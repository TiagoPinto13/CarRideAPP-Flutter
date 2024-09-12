import 'dart:async';
import 'package:carpool/datamodel/search_input.dart';
import 'package:carpool/network/message_repository.dart';
import 'package:carpool/network/rides_repository.dart';
import 'package:carpool/network/user_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../datamodel/car.dart';
import '../../datamodel/ride.dart';
import '../../datamodel/user.dart';
import '../../network/metrics_repository.dart';
import '../../network/user_metrics_repository.dart';
import '../../utils/strings/strings_constants.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

part 'home_page_navigation_state.dart';
part 'home_page_navigation_logic.freezed.dart';

class HomePageNavigationLogic extends Cubit<HomePageNavigationState> {
  final bool isDarkMode;
  final RideRepository _rideRepository = RideRepository();
  final UserRepository _userRepository = UserRepository();
  final MetricsRepository metricsRepository = MetricsRepository();
  final UserMetricsRepository userMetricsRepository = UserMetricsRepository();
  final MessageRepository _messageRepository = MessageRepository();
  Map<Ride, int> _activeRidesAsPassenger = {};
  Map<Ride, int> _waitingRidesAsPassenger = {};
  Map<Ride, int> _expiredRidesAsPassenger = {};
  List<Ride> _activeRidesAsDriver = [];
  List<Ride> _expiredRidesAsDriver = [];
  List<Ride> _waitingRidesAsDriver = [];
  int _ridesAsDriverOffset = 0;
  int _ridesAsPassengerOffset = 0;
  static const int _ridesLimit = 10;

  HomePageNavigationLogic({required this.isDarkMode})
      : super(HomePageNavigationState.loading(isDarkMode: isDarkMode));

  void resetState() {
    _activeRidesAsPassenger.clear();
    _expiredRidesAsDriver.clear();
    _waitingRidesAsPassenger.clear();
    _activeRidesAsDriver.clear();
    _waitingRidesAsDriver.clear();
    _expiredRidesAsPassenger.clear();
    emit(HomePageNavigationState.loading(isDarkMode: isDarkMode));
  }

  bool hasExpired(String rideDate, String rideHour) {
    DateTime currentDate = DateTime.now();

    String combined = '$rideDate $rideHour';

    DateTime rideDateTime = DateFormat('yyyy-MM-dd HH:mm').parse(combined);

    return rideDateTime.isBefore(currentDate);
  }

  void fetchUserCars({required String userId}) async {
    try {
      _activeRidesAsPassenger.clear();
      _expiredRidesAsDriver.clear();
      _waitingRidesAsPassenger.clear();
      _activeRidesAsDriver.clear();
      _waitingRidesAsDriver.clear();
      _expiredRidesAsPassenger.clear();
      emit(HomePageNavigationState.loading(isDarkMode: isDarkMode));
      List<Car> userCars = await _userRepository.getCars(id: userId);

      emit(HomePageNavigationState.carsLoaded(isDarkMode: isDarkMode, cars: userCars));

    } catch (e) {
      print("Error fetching cars $e");
      emit(HomePageNavigationState.error(
          isDarkMode: isDarkMode,
          message: home_page_navigation_error_fetching));
    }
  }

  void _resetRidesData() {
    _ridesAsDriverOffset = 0;
    _ridesAsPassengerOffset = 0;
  }

  Future<void> _processDriverRides(List<dynamic> rideIds) async {
    for (dynamic rideId in rideIds) {
      Ride? ride = await _rideRepository.fetchRide(rideId: rideId);
      if (ride != null) {
        if (!hasExpired(ride.date, ride.hour)) {
          _activeRidesAsDriver.add(ride);
        } else {
          if (ride.confirmed) {
            _expiredRidesAsDriver.add(ride);
          } else {
            _waitingRidesAsDriver.add(ride);
          }
        }
      }
    }
  }

  Future<void> _processPassengerRides(Map<String, dynamic> rides, MyUser user) async {
    for (String rideId in rides.keys) {
      Ride? ride = await _rideRepository.fetchRide(rideId: rideId);
      if (ride != null) {
        if (!hasExpired(ride.date, ride.hour)) {
          _activeRidesAsPassenger[ride] = user.ridesAsPassenger[rideId]!;
        } else {
          if (ride.confirmed) {
            _expiredRidesAsPassenger[ride] = user.ridesAsPassenger[rideId]!;
          } else {
            _waitingRidesAsPassenger[ride] = user.ridesAsPassenger[rideId]!;
          }
        }
      }
    }
  }


  void fetchSchedule({required String userId, bool isLoadMore = false}) async {
    try {
      // If not loading more, clear existing rides and reset offsets
      if (!isLoadMore) {
        _activeRidesAsPassenger.clear();
        _expiredRidesAsDriver.clear();
        _waitingRidesAsPassenger.clear();
        _activeRidesAsDriver.clear();
        _waitingRidesAsDriver.clear();
        _expiredRidesAsPassenger.clear();

        _resetRidesData();

        emit(HomePageNavigationState.loading(isDarkMode: isDarkMode));
      } else {
        emit(HomePageNavigationState.loading(isDarkMode: isDarkMode));
      }

      MyUser? user = await _userRepository.fetchUser(id: userId);

      if (user != null) {
        List<dynamic> driverRidesChunk = user.fetchRidesAsDriverChunk(_ridesAsDriverOffset, _ridesLimit);
        Map<String, dynamic> passengerRidesChunk = user.fetchRidesAsPassengerChunk(_ridesAsPassengerOffset, _ridesLimit);

        await _processDriverRides(driverRidesChunk);
        await _processPassengerRides(passengerRidesChunk, user);

        _ridesAsDriverOffset += _ridesLimit;
        _ridesAsPassengerOffset += _ridesLimit;

        emit(HomePageNavigationState.scheduleLoaded(
          isDarkMode: isDarkMode,
          activeRidesAsDriver: _activeRidesAsDriver,
          activeRidesAsPassenger: _activeRidesAsPassenger,
          expiredRidesAsDriver: _expiredRidesAsDriver,
          expiredRidesAsPassenger: _expiredRidesAsPassenger,
          waitingRidesAsDriver: _waitingRidesAsDriver,
          waitingRidesAsPassenger: _waitingRidesAsPassenger,
        ));
      } else {
        emit(HomePageNavigationState.error(
          isDarkMode: isDarkMode,
          message: home_page_navigation_error_fetching,
        ));
      }
    } catch (e) {
      emit(HomePageNavigationState.error(
        isDarkMode: isDarkMode,
        message: home_page_navigation_error_fetching,
      ));
    }
  }


  Future<bool> removeUserFromRide(
      {required String userId,
      required Ride rideId,
      required int numPass,
      required int totalNum}) async {
    try {
      emit(HomePageNavigationState.loading(isDarkMode: isDarkMode));
      _rideRepository.removePassengerFromRide(rideId.id, userId, numPass);
      _userRepository.removeUserFromRide(
          userId: userId, rideId: rideId.id, numPass: numPass);
      _activeRidesAsPassenger.remove(rideId);

      if (totalNum != numPass) {
        _activeRidesAsPassenger[rideId] = totalNum - numPass;

      }

      emit(HomePageNavigationState.scheduleLoaded(
        isDarkMode: isDarkMode,
        activeRidesAsDriver: _activeRidesAsDriver,
        activeRidesAsPassenger: _activeRidesAsPassenger,
        expiredRidesAsDriver: _expiredRidesAsDriver,
        expiredRidesAsPassenger: _expiredRidesAsPassenger,
        waitingRidesAsDriver: _waitingRidesAsDriver,
        waitingRidesAsPassenger: _waitingRidesAsPassenger,
      ));

      return true;
    } catch (e) {
      emit(HomePageNavigationState.error(
          isDarkMode: isDarkMode,
          message: home_page_navigation_error_fetching));
    }
    return false;
  }

  Future<bool> removeRide(
      {required String userId, required Ride rideId}) async {
    try {
      emit(HomePageNavigationState.loading(isDarkMode: isDarkMode));
      _rideRepository.removeRide(rideId: rideId.id);
      _userRepository.removeRideFromUserDriver(
          userId: userId, rideId: rideId.id);
      _activeRidesAsDriver.remove(rideId);

      emit(HomePageNavigationState.scheduleLoaded(
        isDarkMode: isDarkMode,
        activeRidesAsDriver: _activeRidesAsDriver,
        activeRidesAsPassenger: _activeRidesAsPassenger,
        expiredRidesAsDriver: _expiredRidesAsDriver,
        expiredRidesAsPassenger: _expiredRidesAsPassenger,
        waitingRidesAsDriver: _waitingRidesAsDriver,
        waitingRidesAsPassenger: _waitingRidesAsPassenger,
      ));
      return true;
    } catch (e) {
      emit(HomePageNavigationState.error(
          isDarkMode: isDarkMode,
          message: home_page_navigation_error_fetching));
    }
    return false;
  }

  Future<bool> publishRide({
    required String? id,
    required String to,
    required double toLat,
    required double toLng,
    required String from,
    required double fromLat,
    required double fromLng,
    required String travelTime,
    required String distance,
    required String date,
    required String hour,
    required int numPassengers,
    required Car car,
    required bool disable,
    required bool confirmed,
  }) async {
    try {
      _activeRidesAsPassenger.clear();
      _expiredRidesAsDriver.clear();
      _waitingRidesAsPassenger.clear();
      _activeRidesAsDriver.clear();
      _waitingRidesAsDriver.clear();
      _expiredRidesAsPassenger.clear();

      if (id != null) {
        String? rideId = await _rideRepository.addRide(
            driver: id,
            passengers: {},
            to: to,
            toLat: toLat,
            toLng: toLng,
            from: from,
            fromLat: fromLat,
            fromLng: fromLng,
            travelTime: travelTime,
            distance: distance,
            date: date,
            hour: hour,
            numPassengers: numPassengers,
            car: car,
            hasDisability: disable,
            confirmed: confirmed);

        return await _userRepository.addRideToUserDriver(
            userId: id, rideId: rideId!);
      }
    } catch (e) {
      print('Error adding ride: $e');
    }

    return false;
  }

  void fetchMetrics({required String userId}) async {
    try {
      _activeRidesAsPassenger.clear();
      _expiredRidesAsDriver.clear();
      _waitingRidesAsPassenger.clear();
      _activeRidesAsDriver.clear();
      _waitingRidesAsDriver.clear();
      _expiredRidesAsPassenger.clear();

      emit(HomePageNavigationState.loading(isDarkMode: isDarkMode));
      MyUser? user = await _userRepository.fetchUser(id: userId);

      List<Ride> allRides = [];
      if (user != null) {
        for (int i = 0; i < user.ridesAsDriver.length; i++) {
          Ride? r =
              await _rideRepository.fetchRide(rideId: user.ridesAsDriver[i]);
          if (r != null && r.confirmed) {
            allRides.add(r);
          }
        }

        for (String rideId in user.ridesAsPassenger.keys) {
          Ride? r = await _rideRepository.fetchRide(rideId: rideId);
          if (r != null && r.confirmed) {
            allRides.add(r);
          }
        }
      }

      if (allRides.isEmpty) {
        emit(HomePageNavigationState.error(
            isDarkMode: isDarkMode, message: metrics_page_error_no_metrics));
      } else {
        emit(HomePageNavigationState.metricsLoaded(
            isDarkMode: isDarkMode, rides: allRides));
      }
    } catch (e) {
      emit(HomePageNavigationState.error(
          isDarkMode: isDarkMode, message: metrics_page_error_fetching));
    }
  }

  Stream<Map<dynamic, int>> loadChatsSub2({required String id}) {
    try {
      return _messageRepository
          .getChats(id)
          .asyncMap<Map<dynamic, int>>((event) async {
        if (event.snapshot.value != null) {
          Map<dynamic, int> unreadMessages = {};
          Map<dynamic, dynamic>? chatMap =
              event.snapshot.value as Map<dynamic, dynamic>?;

          if (chatMap != null) {
            List<Future<int>> unreadMessageFutures = [];

            for (var entry in chatMap.entries) {
              String otherId = entry.value['otherId'];
              unreadMessageFutures.add(
                  _messageRepository.getUnreadMessageFromChat(id, otherId));
            }

            List<int> unreadMessageCounts =
                await Future.wait(unreadMessageFutures);
            List<dynamic> chatList = chatMap.values.toList();
            int index = 0;
            for (var entry in chatMap.entries) {
              unreadMessages[chatList[index]] = unreadMessageCounts[index];
              index++;
            }
          }
          return unreadMessages;
        }
        return {};
      }).handleError((e) {
        emit(HomePageNavigationState.error(
            isDarkMode: isDarkMode,
            message: home_page_navigation_error_fetching));
      });
    } catch (e) {
      emit(HomePageNavigationState.error(
          isDarkMode: isDarkMode,
          message: home_page_navigation_error_fetching));
      return const Stream<Map<dynamic, int>>.empty();
    }
  }

  Stream<Map<String, int>> loadChatsSub({required String id}) {
    try {
      return _messageRepository
          .getChats(id)
          .asyncMap<Map<String, int>>((event) async {
        if (event.snapshot.value != null) {
          Map<String, int> unreadMessages = {};
          Map<dynamic, dynamic>? chatMap =
              event.snapshot.value as Map<dynamic, dynamic>?;
          if (chatMap != null) {
            List<Future<int>> unreadMessageFutures = [];
            for (var entry in chatMap.entries) {
              String otherId = entry.value['otherId'];
              unreadMessageFutures.add(
                  _messageRepository.getUnreadMessageFromChat(id, otherId));
            }

            await Future.wait(unreadMessageFutures).then((List<int> counts) {
              for (int i = 0; i < chatMap.length; i++) {
                String otherId = chatMap.entries.elementAt(i).key;
                unreadMessages[otherId] = counts[i];
              }
            });
          }
          return unreadMessages;
        }
        return {};
      }).handleError((e) {
        emit(HomePageNavigationState.error(
            isDarkMode: isDarkMode,
            message: home_page_navigation_error_fetching));
      });
    } catch (e) {
      emit(HomePageNavigationState.error(
          isDarkMode: isDarkMode,
          message: home_page_navigation_error_fetching));
      return const Stream<Map<String, int>>.empty();
    }
  }

  Stream<DatabaseEvent> getChats(String id) {
    return _messageRepository.getChats(id);
  }

  void sendWithdrawNotificationToDriver(
      {required String senderId,
      required Ride ride,
      required int numPass}) async {
    JoinRideNotification notification = JoinRideNotification(
        otherId: senderId, rideId: ride.id, numPassengers: numPass);

    await _userRepository.addNotificationToUser(
        userId: ride.driver.id,
        text: notification.toMap(),
        type: 5,
        timestamp: Timestamp.now());
  }

  void sendNotificationToAllPassengers(
      {required String senderId, required Ride ride}) async {
    ride.passengers.forEach((key, value) async {
      CancelRideNotification notification = CancelRideNotification(
          userId: senderId,
          from: ride.startingPoint,
          to: ride.destination,
          date: ride.date,
          hour: ride.hour,
          seats: value);
      await _userRepository.addNotificationToUser(
          userId: key.id,
          text: notification.toMap(),
          type: 4,
          timestamp: Timestamp.now());
    });
  }

  void confirmRide({required String rideId}) {
    _rideRepository.confirmRide(rideId: rideId);

    for (var ride in _waitingRidesAsDriver) {
      if (ride.id == rideId) {
        _expiredRidesAsDriver.add(ride);
        _waitingRidesAsDriver.remove(ride);
        break;
      }
    }

    emit(HomePageNavigationState.scheduleLoaded(
      isDarkMode: isDarkMode,
      activeRidesAsDriver: _activeRidesAsDriver,
      activeRidesAsPassenger: _activeRidesAsPassenger,
      expiredRidesAsDriver: _expiredRidesAsDriver,
      expiredRidesAsPassenger: _expiredRidesAsPassenger,
      waitingRidesAsDriver: _waitingRidesAsDriver,
      waitingRidesAsPassenger: _waitingRidesAsPassenger,
    ));
  }

  void sendConfirmationNotificationToUsers(
      {required String senderId, required Ride ride}) async {
    ride.passengers.forEach((key, value) async {
      ConfirmRideNotification notification = ConfirmRideNotification(
          userId: senderId,
          from: ride.startingPoint,
          to: ride.destination,
          date: ride.date,
          hour: ride.hour,
          seats: value,
          driverRating: false);
      await _userRepository.addNotificationToUser(
          userId: key.id,
          text: notification.toMap(),
          type: 6,
          timestamp: Timestamp.now());
    });
  }

  Future<bool> addRatingToPassenger(
      {required String userId,
      required String passengerId,
      required int rating,
      required String rideId,
      required String from,
      required String to,
      required String date,
      required String hour}) async {
    try {
      if (await _userRepository.addRatingToPassenger(
          userId: userId,
          passengerId: passengerId,
          rating: rating,
          rideId: rideId)) {
        RatingReceived r = RatingReceived(
            userId: userId,
            from: from,
            to: to,
            date: date,
            hour: hour,
            rating: rating);
        await _userRepository.addNotificationToUser(
            userId: passengerId,
            text: r.toMap(),
            type: 7,
            timestamp: Timestamp.now());
        _rideRepository.checkPassengerRate(
            rideId: rideId, passengerId: passengerId);

        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("Error sending rating to user: $e");
      return false;
    }
  }

  Future<bool> addCarToUser(
      {required String userId,
        required String carName,
        required double consumption}) async {
    try {
      return await _userRepository.addCarToUser(
          userId: userId, carName: carName, consumption: consumption);
    } catch (e) {
      return false;
    }
  }

  Stream<QuerySnapshot> getNotifications({required String id}) {
    return _userRepository.getNotifications(id: id);
  }
}
