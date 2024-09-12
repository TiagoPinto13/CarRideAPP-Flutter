import 'package:carpool/datamodel/ride.dart';
import 'package:carpool/network/rides_repository.dart';
import 'package:carpool/network/user_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_webservice/directions.dart';

import '../../datamodel/search_input.dart';
import '../../datamodel/user.dart';
import '../../utils/strings/strings_constants.dart';

part 'show_rides_page_state.dart';
part 'show_rides_page_logic.freezed.dart';

class ShowRidesPageLogic extends Cubit<ShowRidesPageState> {
  final bool isDarkMode;
  final RideRepository _rideRepository = RideRepository();
  final UserRepository _userRepository = UserRepository();
  List<Ride>? _rides;

  ShowRidesPageLogic({required this.isDarkMode})
      : super(ShowRidesPageState.loading(isDarkMode: isDarkMode));

  Future<bool> addUserToRide(
      {required String id, required Ride ride, required int numPass}) async {
    try {
      _rideRepository.addUserToRide(ride.id, id, numPass);
      _userRepository.addRideToUser(
          userId: id, rideId: ride.id, numPass: numPass);
      _rides!.remove(ride);
      if (_rides!.isEmpty) {
        emit(ShowRidesPageState.error(
            isDarkMode: isDarkMode, message: show_rides_page_no_rides_error));
      } else {
        emit(ShowRidesPageState.loaded(isDarkMode: isDarkMode, rides: _rides!));
      }

      return true;
    } catch (e) {
      emit(ShowRidesPageState.error(
          isDarkMode: isDarkMode, message: show_rides_page_error_adding_user));
    }

    return false;
  }

  void fetchRides(
      {required String userId,
      required String date,
      required int numPassengers,
      required double fromLat,
      required double fromLng,
      required double? toLat,
      required double? toLng,
      required bool disability}) async {
    try {
      emit(ShowRidesPageState.loading(isDarkMode: isDarkMode));
      _rides = await _rideRepository.fetchRidesSearch(
          userId: userId,
          date: date,
          numPassengers: numPassengers,
          disability: disability,);

      final directionsApiClient = GoogleMapsDirections(
          apiKey: "AIzaSyBPabXVBdwpJez-yN_lDZZpOy24VGskOuE");
      List<double> startingDistances = [];

      if (_rides!.isEmpty) {
        emit(ShowRidesPageState.error(
            isDarkMode: isDarkMode, message: show_rides_page_no_rides_error));
      }

      for (var ride in _rides!) {
        final directionsResponse = await directionsApiClient.directions(
          "$fromLat,$fromLng",
          "${ride.startingLat},${ride.startingLng}",
          travelMode: TravelMode.driving,
        );

        if (directionsResponse.isOkay) {
          double distance = directionsResponse
                  .routes.first.legs.first.distance.value
                  .toDouble() /
              1000;
          startingDistances.add(distance);
        }
      }

      List<Ride> filteredRides = [];
      for (int i = 0; i < _rides!.length; i++) {
        if (startingDistances[i] <= 10) {
          filteredRides.add(_rides![i]);
        }
      }

      List<Ride> doubleFilteredRides = [];
      if (toLng != null && toLat != null) {
        List<double> destinationDistances = [];
        for (var ride in filteredRides) {
          final directionsResponse = await directionsApiClient.directions(
            "$toLat,$toLng",
            "${ride.destinationLat},${ride.destinationLng}",
            travelMode: TravelMode.driving,
          );

          if (directionsResponse.isOkay) {
            double distance = directionsResponse
                    .routes.first.legs.first.distance.value
                    .toDouble() /
                1000;
            destinationDistances.add(distance);
          }
        }

        for (int i = 0; i < filteredRides.length; i++) {
          if (destinationDistances[i] <= 15) {
            doubleFilteredRides.add(_rides![i]);
          }
        }
      }

      if (toLat == null || toLng == null) {
        filteredRides.sort((a, b) {
          double distanceA = startingDistances[_rides!.indexOf(a)];
          double distanceB = startingDistances[_rides!.indexOf(b)];
          return distanceA.compareTo(distanceB);
        });

        _rides = filteredRides;
      } else {
        doubleFilteredRides.sort((a, b) {
          double distanceA = startingDistances[_rides!.indexOf(a)];
          double distanceB = startingDistances[_rides!.indexOf(b)];
          return distanceA.compareTo(distanceB);
        });

        _rides = doubleFilteredRides;
      }

      if (_rides!.isEmpty) {
        emit(ShowRidesPageState.error(
            isDarkMode: isDarkMode, message: show_rides_page_no_rides_error));
      } else {

        for (var ride in _rides!) {
          MyUser user = ride.driver;
          MapEntry<double, int> ratingAsDriver = await _userRepository.fetchDriverRating(userId: user.id);
          ride.driver.ratingAsDriver = ratingAsDriver.key;
        }

        emit(ShowRidesPageState.loaded(isDarkMode: isDarkMode, rides: _rides!));
      }
    } catch (e) {
      emit(ShowRidesPageState.error(
          isDarkMode: isDarkMode, message: show_rides_page_error_adding_user));
    }
  }

  Future<bool> sendJoinRideNotification(
      {required String driver,
      required Ride ride,
      required String text,
      required int numPass}) async {
    try {
      JoinRideNotification notificationBody = JoinRideNotification(
          otherId: text, rideId: ride.id, numPassengers: numPass);

      if (await _userRepository.addNotificationToUser(
          userId: driver,
          text: notificationBody.toMap(),
          type: 1,
          timestamp: Timestamp.now())) {
        _rides?.remove(ride);

        if (_rides!.isEmpty) {
          emit(ShowRidesPageState.error(
              isDarkMode: isDarkMode, message: show_rides_page_no_rides_error));
        } else {
          emit(ShowRidesPageState.loaded(
              isDarkMode: isDarkMode, rides: _rides!));
        }

        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}
