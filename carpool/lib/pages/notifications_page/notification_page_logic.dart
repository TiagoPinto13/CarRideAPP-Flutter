import 'package:carpool/network/rides_repository.dart';
import 'package:carpool/network/user_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../datamodel/ride.dart';
import '../../datamodel/search_input.dart';

part 'notification_page_state.dart';
part 'notification_page_logic.freezed.dart';

class NotificationPageLogic extends Cubit<NotificationPageState> {
  final bool isDarkMode;
  final _userRepository = UserRepository();
  final _ridesRepository = RideRepository();


  NotificationPageLogic({required this.isDarkMode})
      : super(NotificationPageState.loaded(isDarkMode: isDarkMode));


  Stream<QuerySnapshot> getNotification({required String id}) {
    return _userRepository.getNotifications(id: id);
  }

  Future<Ride?> getRide({required String rideId}) async {
    return await _ridesRepository.fetchRide(rideId: rideId);
  }

  Future<MapEntry<double, int>> getPassengerRating({required String passengerId}) {
    return _userRepository.fetchPassengerRating(userId: passengerId);
  }


  Future<bool> sendReplyJoinRideNotification({required String senderId, required String rideId, required String receiverId, required int numPass, required int type, required String notificationId}) async {
    try {
      ReplyJoinRideNotification notificationBody = ReplyJoinRideNotification(userId: senderId, rideId: rideId);

      if (await _userRepository.addNotificationToUser(userId: receiverId, text: notificationBody.toMap(), type: type, timestamp: Timestamp.now())) {
        if (type == 3) {
          try {
            _ridesRepository.addUserToRide(rideId, receiverId, numPass);
            _userRepository.addRideToUser(
                userId: receiverId, rideId: rideId, numPass: numPass);

          } catch (e) {
            return false;
          }
        }
        _userRepository.removeNotificationFromUser(userId: senderId, notificationId: notificationId);
        return true;
      }
      return false;
    }
    catch (e) {
      return false;
    }
  }

  void removeNotification({required String userId , required String notificationId}) {
    try {
      _userRepository.removeNotificationFromUser(
          userId: userId, notificationId: notificationId);
    }
    catch (e) {
      print("Error removing notification from user: $e");
    }
  }

  Future<bool> rateDriver({required String driverId,  required String notificationId, required String userId, required int rating, required String from, required String to, required String date, required String hour}) async {
    try {
      if (await _userRepository.addRatingToDriver(
      driverId: driverId, notificationId: notificationId, userId: userId, rating: rating)) {
        RatingReceived r = RatingReceived(userId: userId, from: from, to: to, date: date, hour: hour, rating: rating);

        await _userRepository.addNotificationToUser(userId: driverId, text: r.toMap(), type: 7, timestamp: Timestamp.now());
        return true;
      }
      else {
        return false;
      }
    }
    catch (e) {
      print("Error sending rating to user: $e");
      return false;
    }
  }
}