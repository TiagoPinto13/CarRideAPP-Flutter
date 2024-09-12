import 'package:carpool/datamodel/search_input.dart';
import 'package:carpool/datamodel/car.dart';
import 'package:carpool/datamodel/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../datamodel/notification.dart';

class UserRepository {
  final CollectionReference _firestore =
      FirebaseFirestore.instance.collection("User");

  Future<List<MyUser>> fetchUsers() async {
    List<MyUser> users = [];
    try {
      QuerySnapshot userSnapshot = await _firestore.get();
      if (userSnapshot.docs.isNotEmpty) {
        for (DocumentSnapshot userDoc in userSnapshot.docs) {
          MyUser user = MyUser.fromFirestore(userDoc);
          users.add(user);
        }
      }
    } catch (e) {
      print('Error fetching users: $e');
    }
    return users;
  }

  Future<bool> addRideToUser(
      {required String userId,
      required String rideId,
      required int numPass}) async {
    try {
      final documentReference = _firestore.doc(userId);

      await FirebaseFirestore.instance
          .runTransaction((Transaction transaction) async {
        final DocumentSnapshot snapshot =
            await transaction.get(documentReference);

        if (snapshot.exists) {
          Map<String, dynamic> userData =
              snapshot.data() as Map<String, dynamic>;

          Map<String, int> rides = userData['RidesAsPassenger'] != null
              ? Map<String, int>.from(
                  userData['RidesAsPassenger'] as Map<String, dynamic>)
              : {};

          if (rides.containsKey(rideId)) {
            rides[rideId] = rides[rideId]! + numPass;
          } else {
            rides[rideId] = numPass;
          }

          userData['RidesAsPassenger'] = rides;

          transaction.update(documentReference, userData);

          return true;
        }
      });
    } catch (e) {
      print('Error adding user to ride: $e');
    }
    return false;
  }

  Future<bool> addRideToUserDriver(
      {required String userId, required String rideId}) async {
    try {
      final DocumentReference userRef = _firestore.doc(userId);

      final DocumentSnapshot userSnapshot = await userRef.get();

      if (userSnapshot.exists &&
          (userSnapshot.data() as Map<String, dynamic>)
              .containsKey('RidesAsDriver')) {
        List<dynamic> driverRides =
            (userSnapshot.data() as Map<String, dynamic>)['RidesAsDriver'] ??
                [];

        driverRides.add(rideId);

        await userRef.update({'RidesAsDriver': driverRides});

        return true;
      } else {
        await userRef.set({
          'RidesAsDriver': [rideId]
        }, SetOptions(merge: true));

        return true;
      }
    } catch (e) {
      print('Error adding ride to user: $e');
      return false;
    }
  }

  Future<bool> removeUserFromRide(
      {required String userId,
      required String rideId,
      required int numPass}) async {
    try {
      final documentReference = _firestore.doc(userId);

      await FirebaseFirestore.instance
          .runTransaction((Transaction transaction) async {
        final DocumentSnapshot snapshot =
            await transaction.get(documentReference);

        if (snapshot.exists) {
          Map<String, dynamic> userData =
              snapshot.data() as Map<String, dynamic>;

          Map<String, int> rides = userData['RidesAsPassenger'] != null
              ? Map<String, int>.from(
                  userData['RidesAsPassenger'] as Map<String, dynamic>)
              : {};

          if (numPass == rides[rideId]) {
            rides.remove(rideId);
          } else {
            rides[rideId] = (rides[rideId]! - numPass);
          }

          userData['RidesAsPassenger'] = rides;

          transaction.update(documentReference, userData);

          return true;
        }
      });
    } catch (e) {
      print('Error adding user to ride: $e');
    }
    return false;
  }

  Future<bool> removeRideFromUserDriver(
      {required String userId, required String rideId}) async {
    try {
      final documentReference = _firestore.doc(userId);

      await FirebaseFirestore.instance.runTransaction((transaction) async {
        DocumentSnapshot snapshot = await transaction.get(documentReference);

        List<dynamic> driverRides = snapshot.get('RidesAsDriver') ?? [];

        driverRides.remove(rideId);

        transaction.update(documentReference, {'RidesAsDriver': driverRides});
      });

      return true;
    } catch (e) {
      print('Error adding ride to user: $e');
    }
    return false;
  }

  Future<bool> addChatToUser(
      {required String userId,
      required String otherId,
      required String otherName,
      required String message,
      required Timestamp timestamp}) async {
    try {
      final documentReference = _firestore.doc(userId);

      List<String> ids = [userId, otherId];
      ids.sort();
      String chatId = ids.join('_');

      await documentReference.collection('Chat').doc(chatId).set({
        'otherId': otherId,
        'otherName': otherName,
        'message': message,
        'timestamp': timestamp,
      });

      return true;
    } catch (e) {
      print('Error adding chat to user: $e');
      return false;
    }
  }

  Future<bool> addNotificationToUser(
      {required String userId,
      required Map<String, dynamic> text,
      required int type,
      required Timestamp timestamp}) async {
    try {
      Notification n = Notification(
        text: text,
        type: type,
        timestamp: timestamp,
      );

      await _firestore.doc(userId).collection("Notifications").add(n.toMap());

      return true;
    } catch (e) {
      print('Error adding notification to user: $e');
      return false;
    }
  }

  Future<bool> addCarToUser(
      {required String userId,
      required String carName,
      required double consumption}) async {
    try {
      final Car car = Car(name: carName, consumption: consumption);

      await _firestore.doc(userId).collection("Cars").add(car.toMap());

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> removeCarFromUser(
      {required String userId, required String carId}) async {
    try {
      final documentReference = _firestore.doc(userId);

      await FirebaseFirestore.instance
          .runTransaction((Transaction transaction) async {
        final notificationRef = documentReference.collection("Cars").doc(carId);

        final notificationDoc = await transaction.get(notificationRef);

        if (notificationDoc.exists) {
          transaction.delete(notificationRef);

          return true;
        }
      });

      return false;
    } catch (e) {
      print('Error removing car from user: $e');
    }
    return false;
  }

  Future<bool> removeNotificationFromUser(
      {required String userId, required String notificationId}) async {
    try {
      final documentReference = _firestore.doc(userId);

      await FirebaseFirestore.instance
          .runTransaction((Transaction transaction) async {
        final notificationRef =
            documentReference.collection("Notifications").doc(notificationId);

        final notificationDoc = await transaction.get(notificationRef);

        if (notificationDoc.exists) {
          transaction.delete(notificationRef);

          return true;
        }
      });

      return false;
    } catch (e) {
      print('Error removing notification from user: $e');
    }
    return false;
  }

  Future<bool> addUser({
    required String id,
    required String name,
    required String username,
    required String email,
    required String gender,
  }) async {
    try {
      final DocumentReference userRef = _firestore.doc(id);

      final userData = <String, dynamic>{
        'id': id,
        'Name': name,
        'Username': username,
        'Email': email,
        'Gender': gender,
        'RidesAsDriver': List<String>.empty(),
        'RidesAsPassenger': {},
        
      };

      await userRef.set(userData);

      return true;
    } catch (e) {
      print('Error adding user to Firestore: $e');
      return false;
    }
  }

  Future<MyUser?> fetchUser({required String id}) async {
    try {
      QuerySnapshot querySnapshot =
          await _firestore.where('id', isEqualTo: id).get();
      if (querySnapshot.docs.isNotEmpty) {
        DocumentSnapshot userDoc = querySnapshot.docs.first;

        List<dynamic> ridesAsDriver = List<dynamic>.from(userDoc['RidesAsDriver'] ?? []);
        ridesAsDriver.reversed.toList();

        Map<String, dynamic> ridesAsPassenger = Map<String, dynamic>.from(userDoc['RidesAsPassenger'] ?? {});
        var ridesAsPassengerList = ridesAsPassenger.entries.toList().reversed.toList();
        ridesAsPassenger = Map<String, dynamic>.fromEntries(ridesAsPassengerList);

        return MyUser(
          id: userDoc['id'],
          name: userDoc['Name'],
          username: userDoc['Username'],
          email: userDoc['Email'],
          
          gender: userDoc['Gender'],
          ridesAsPassenger: ridesAsPassenger,
          ridesAsDriver: ridesAsDriver,
        );
      }
    } catch (e) {
      print('Error fetching user: $e');
    }
    return null;
  }

  Future<List<MyUser>?> fetchAllUsers() async {
    try {
      QuerySnapshot querySnapshot = await _firestore.get();
      if (querySnapshot.docs.isNotEmpty) {
        QuerySnapshot querySnapshot =
            await FirebaseFirestore.instance.collection('User').get();
        List<MyUser> userList = [];

        querySnapshot.docs.forEach((doc) {
          MyUser user = MyUser.fromFirestore(doc);
          userList.add(user);
        });

        return userList;
      }
    } catch (e) {
      print('Error fetching user: $e');
    }

    return null;
  }

  Stream<QuerySnapshot> getChats(String id) {
    return _firestore
        .doc(id)
        .collection("Chat")
        .orderBy("timestamp", descending: true)
        .snapshots();
  }

  Stream<QuerySnapshot> getNotifications({required String id}) {
    return _firestore.doc(id).collection("Notifications").snapshots();
  }

  Future<List<Car>> getCars({required String id}) async {
    final QuerySnapshot<Map<String, dynamic>> snapshot =
        await _firestore.doc(id).collection("Cars").get();

    List<Car> carsList = [];

    snapshot.docs.forEach((carDoc) {
      Car car = Car(
          name: carDoc.data()['name'],
          consumption: carDoc.data()['consumption']);
      car.id = carDoc.id;
      carsList.add(car);
    });

    return carsList;
  }

  void markRating({required String notificationId, required String userId}) async {
    try {
      final notificationRef = _firestore.doc(userId).collection("Notifications").doc(notificationId);

      await FirebaseFirestore.instance.runTransaction((transaction) async {
        DocumentSnapshot snapshot = await transaction.get(notificationRef);

        ConfirmRideNotification notification = ConfirmRideNotification.fromMap(snapshot['text']);
        ConfirmRideNotification newNotification = ConfirmRideNotification(userId: notification.userId,
            from: notification.from, to: notification.to, date: notification.date,
            hour: notification.hour, seats: notification.seats, driverRating: true);

        transaction.update(notificationRef, {'text': newNotification.toMap()});
      });

    } catch (e) {
      print('Error marking rating: $e');
    }
  }

  Future<bool> addRatingToDriver({required String driverId, required int rating, required String notificationId, required String userId}) async {
    try {
      final userRef = _firestore.doc(driverId);
      final ratingCollection = userRef.collection('RatingsAsDriver');

      await FirebaseFirestore.instance.runTransaction((transaction) async {
        await ratingCollection.add({
          'rating': rating,
        });
      });

      markRating(notificationId: notificationId, userId: userId);

      return true;

    } catch (e) {
      print('Error removing notification from user: $e');
    }
    return false;
  }

  Future<bool> addRatingToPassenger({required String userId, required String passengerId, required int rating, required String rideId}) async {
    try {
      final userRef = _firestore.doc(passengerId);
      final ratingCollection = userRef.collection('RatingsAsPassenger');

      await FirebaseFirestore.instance.runTransaction((transaction) async {
        await ratingCollection.add({
          'rating': rating,
        });
      });

      return true;

    } catch (e) {
      print('Error removing notification from user: $e');
    }
    return false;
  }

  Future<MapEntry<double, int>> fetchDriverRating({required String userId}) async {
    final QuerySnapshot<Map<String, dynamic>> snapshot =
    await _firestore.doc(userId).collection("RatingsAsDriver").get();

    double total = 0.0;
    double i = 0.0;
    int t = 0;

    snapshot.docs.forEach((rate) {
      total += rate.data()['rating'];
      i++;
      t++;
    });

    if (i > 0) {
      return MapEntry(total / i, t);
    }

    return const MapEntry(0, 0);
  }

  Future<MapEntry<double, int>> fetchPassengerRating({required String userId}) async {
    final QuerySnapshot<Map<String, dynamic>> snapshot =
    await _firestore.doc(userId).collection("RatingsAsPassenger").get();

    double total = 0.0;
    double i = 0.0;
    int t = 0;

    snapshot.docs.forEach((rate) {
      total += rate.data()['rating'];
      i++;
      t++;
    });

    if (i > 0) {
      return MapEntry(total / i, t);
    }

    return const MapEntry(0, 0);
  }
}
