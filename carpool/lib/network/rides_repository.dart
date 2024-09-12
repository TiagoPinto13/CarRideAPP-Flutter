import 'package:carpool/datamodel/ride.dart';
import 'package:carpool/network/user_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../datamodel/car.dart';
import '../datamodel/user.dart';

class RideRepository {
  final CollectionReference _firestore =
      FirebaseFirestore.instance.collection("Ride");
  final UserRepository _userRepository = UserRepository();

  void addUserToRide(String rideId, String userId, int numPass) async {
    try {
      final documentReference = _firestore.doc(rideId);

      await FirebaseFirestore.instance.runTransaction((transaction) async {
        DocumentSnapshot snapshot = await transaction.get(documentReference);

        Map<String, dynamic> userList = snapshot.get('Passengers') != null
            ? Map<String, dynamic>.from(
                snapshot['Passengers'] as Map<String, dynamic>)
            : {};

        int usedSeats = 0;
        userList.forEach((key, value) {
          usedSeats += value as int;
        });

        if (usedSeats < snapshot.get('MaxPassengers')) {
          if (userList.containsKey(userId)) {
            userList[userId] = userList[userId]! + numPass;
          } else {
            userList[userId] = numPass;
          }

          transaction.update(documentReference, {'Passengers': userList});
        }
      });
    } catch (e) {
      print('Error adding user to ride: $e');
    }
  }

  void removePassengerFromRide(
      String rideId, String userId, int numPass) async {
    try {
      final documentReference = _firestore.doc(rideId);

      await FirebaseFirestore.instance.runTransaction((transaction) async {
        DocumentSnapshot snapshot = await transaction.get(documentReference);

        Map<String, dynamic> seats = snapshot['Passengers'] != null
            ? Map<String, dynamic>.from(
                snapshot['Passengers'] as Map<String, dynamic>)
            : {};

        if (seats.containsKey(userId)) {
          if (seats[userId]! > numPass) {
            seats[userId] = seats[userId]! - numPass;
          } else if (seats[userId] == numPass) {
            seats.remove(userId);
          }

          transaction.update(documentReference, {'Passengers': seats});
        }
      });
    } catch (e) {
      print('Error adding user to ride: $e');
    }
  }

  Future<List<Ride>> fetchRides() async {
    List<Ride> rides = [];
    try {
      QuerySnapshot rideSnapshot = await _firestore.get();
      if (rideSnapshot.docs.isNotEmpty) {
        for (DocumentSnapshot rideDoc in rideSnapshot.docs) {
          Map<String, dynamic> data = rideDoc.data() as Map<String, dynamic>;

          MyUser? driver = await _userRepository.fetchUser(id: data['Driver']);

          Map<String, dynamic> psg = data['Passengers'] != null
              ? Map<String, dynamic>.from(
                  data['Passengers'] as Map<String, dynamic>)
              : {};
          Map<MyUser, dynamic> passengers = {};

          psg.forEach((userId, value) async {
            MyUser? usr = await _userRepository.fetchUser(id: userId);
            if (usr != null) {
              passengers[usr] = value;
            }
          });

          Ride ride = Ride(
            id: rideDoc.id,
            driver: driver!,
            passengers: passengers,
            maxPassengers: data['MaxPassengers'],
              price: data['totalPrice'] ?? 0.0,
            startingPoint: data['From'],
            startingLat: data['FromLat'],
            startingLng: data['FromLng'],
            destinationLat: data['ToLat'],
            destinationLng: data['ToLng'],
            travelTime: data['TravelTime'],
            distance: data['Distance'],
            destination: data['To'],
            hasDisability: data['Disability'],
            date: data['Date'],
            hour: data['Hour'],
            car: Car.fromMap(data['Car']),
            confirmed: data['Confirmed'],
            rated: data['Rated']
          );
          rides.add(ride);
        }
      }
    } catch (e) {
      print('Error fetching rides: $e');
    }
    return rides;
  }

  Future<List<Ride>> fetchRidesSearch({
    required String userId,
    required String date,
    required int numPassengers,
    required bool disability,
  }) async {
    List<Ride> rides = [];
    try {
      QuerySnapshot rideSnapshot;
      if (disability) {
        rideSnapshot = await _firestore
            .where('Driver', isNotEqualTo: userId)
            .where('Date', isEqualTo: date)
            .where('Disability', isEqualTo: true)
            .get();
      } else {
        rideSnapshot = await _firestore
            .where('Driver', isNotEqualTo: userId)
            .where('Date', isEqualTo: date)
            .get();
      }
      if (rideSnapshot.docs.isNotEmpty) {
        for (DocumentSnapshot rideDoc in rideSnapshot.docs) {
          Map<String, dynamic> data = rideDoc.data() as Map<String, dynamic>;

          Map<String, dynamic> passengers = data['Passengers'] != null
              ? Map<String, dynamic>.from(
                  data['Passengers'] as Map<String, dynamic>)
              : {};

          int seatsUsed = 0;
          passengers.forEach((key, value) {
            seatsUsed += value as int;
          });

          int leftSeats = (data['MaxPassengers'] as int) - seatsUsed;
          if (leftSeats >= numPassengers) {
            Ride ride = await _createRideFromDocument(data, rideDoc.id);
            rides.add(ride);
          }
        }
      }
    } catch (e) {
      print('Error fetching rides: $e');
    }
    return rides;
  }

  Future<List<Ride>> fetchUserSchedule({required String userId}) async {
    List<Ride> rides = [];
    try {
      QuerySnapshot rideSnapshot =
          await _firestore.where('Driver', isEqualTo: userId).get();
      rides.addAll(await _fetchRidesFromSnapshot(rideSnapshot));
    } catch (e) {
      print('Error fetching driver rides: $e');
    }

    try {
      QuerySnapshot rideSnapshot =
          await _firestore.where('Passengers', arrayContains: userId).get();
      rides.addAll(await _fetchRidesFromSnapshot(rideSnapshot));
    } catch (e) {
      print('Error fetching passengers rides: $e');
    }

    return rides;
  }

  Future<List<Ride>> _fetchRidesFromSnapshot(QuerySnapshot snapshot) async {
    List<Ride> rides = [];
    if (snapshot.docs.isNotEmpty) {
      for (DocumentSnapshot rideDoc in snapshot.docs) {
        Map<String, dynamic> data = rideDoc.data() as Map<String, dynamic>;
        Ride ride = await _createRideFromDocument(data, rideDoc.id);
        rides.add(ride);
      }
    }
    return rides;
  }

  Future<Ride> _createRideFromDocument(
      Map<String, dynamic> data, String rideId) async {
    MyUser? driver = await _userRepository.fetchUser(id: data['Driver']);

    Map<String, dynamic> psg = data['Passengers'] != null
        ? Map<String, dynamic>.from(data['Passengers'] as Map<String, dynamic>)
        : {};
    Map<MyUser, dynamic> passengers = {};

    psg.forEach((userId, value) async {
      MyUser? usr = await _userRepository.fetchUser(id: userId);
      if (usr != null) {
        passengers[usr] = value;
      }
    });

    return Ride(
      id: rideId,
      driver: driver!,
      passengers: passengers,
      maxPassengers: data['MaxPassengers'],
      price: data['totalPrice'] ?? 0.0,
      startingPoint: data['From'],
      startingLat: data['FromLat'],
      startingLng: data['FromLng'],
      destination: data['To'],
      destinationLat: data['ToLat'],
      destinationLng: data['ToLng'],
      travelTime: data['TravelTime'],
      distance: data['Distance'],
      hasDisability: data['Disability'],
      date: data['Date'],
      hour: data['Hour'],
      car: Car.fromMap(data['Car']),
      confirmed: data['Confirmed'],
      rated: data['Rated']
    );
  }

  Future<String?> addRide({
    required String driver,
    required Map<String, dynamic> passengers,
    required String from,
    required double fromLat,
    required double fromLng,
    required String to,
    required double toLat,
    required double toLng,
    required String travelTime,
    required String distance,
    required String date,
    required String hour,
    required int numPassengers,
    required Car car,
    required bool hasDisability,
    required bool confirmed,
  }) async {
    final ride = <String, dynamic>{
      'Driver': driver,
      'Passengers': passengers,
      'From': from,
      'FromLat': fromLat,
      'FromLng': fromLng,
      'To': to,
      'ToLat': toLat,
      'ToLng': toLng,
      'TravelTime': travelTime,
      'Distance': distance,
      'Date': date,
      'Hour': hour,
      'MaxPassengers': numPassengers,
      'Car': car.toMap(),
      'Disability': hasDisability,
      'Confirmed': confirmed,
      'Rated': [],
    };

    try {
      return await FirebaseFirestore.instance
          .runTransaction((transaction) async {
        DocumentReference id = await _firestore.add(ride);
        return id.id;
      });
    } catch (e) {
      print('Error adding ride to Firestore: $e');
      return null;
    }
  }

  Future<bool> removeRide({
    required String rideId,
  }) async {
    try {
      await FirebaseFirestore.instance.runTransaction((transaction) async {
        DocumentReference rideRef =
            FirebaseFirestore.instance.collection('Ride').doc(rideId);
        await transaction.delete(rideRef);
      });
      return true;
    } catch (e) {
      print('Error removing ride from Firestore: $e');
      return false;
    }
  }

  void confirmRide({required String rideId}) async {
    try {
      final documentReference = _firestore.doc(rideId);

      await FirebaseFirestore.instance.runTransaction((transaction) async {

        transaction.update(documentReference, {'Confirmed': true});
      });
    } catch (e) {
      print('Error adding user to ride: $e');
    }
  }

  void checkPassengerRate({required String rideId, required String passengerId}) async {
    try {
      final documentReference = _firestore.doc(rideId);

      await FirebaseFirestore.instance.runTransaction((transaction) async {
        DocumentSnapshot snapshot = await transaction.get(documentReference);

        List<dynamic> rated = snapshot['Rated'] != null
            ? List<dynamic>.from(
            snapshot['Rated'] as List<dynamic>)
            : [];

        if (!rated.contains(passengerId)) {
          rated.add(passengerId);

          transaction.update(documentReference, {'Rated': rated});
        }
      });
    } catch (e) {
      print('Error adding user to ride: $e');
    }
  }



  Future<Ride?> fetchRide({required String rideId}) async {
    try {
      DocumentSnapshot rideSnapshot =
          await FirebaseFirestore.instance.collection('Ride').doc(rideId).get();

      if (rideSnapshot.exists) {
        Map<String, dynamic> psg = rideSnapshot['Passengers'] != null
            ? Map<String, dynamic>.from(
                rideSnapshot['Passengers'] as Map<String, dynamic>)
            : {};

        Map<MyUser, int> passengers = {};
        for (String passengerId in psg.keys) {
          MyUser? usr = await _userRepository.fetchUser(id: passengerId);
          if (usr != null) {
            passengers[usr] = psg[passengerId] as int;
          }
        }

        final driver =
            await _userRepository.fetchUser(id: rideSnapshot['Driver']);

        return Ride(
          id: rideId,
          driver: driver!,
          passengers: passengers,
          maxPassengers: rideSnapshot['MaxPassengers'],
          startingPoint: rideSnapshot['From'],
          startingLat: rideSnapshot['FromLat'],
          startingLng: rideSnapshot['FromLng'],
          destinationLat: rideSnapshot['ToLat'],
          destinationLng: rideSnapshot['ToLng'],
          travelTime: rideSnapshot['TravelTime'],
          distance: rideSnapshot['Distance'],
          destination: rideSnapshot['To'],
          date: rideSnapshot['Date'],
          hour: rideSnapshot['Hour'],
          car: Car.fromMap(rideSnapshot['Car']),
          hasDisability: rideSnapshot['Disability'],
          confirmed: rideSnapshot['Confirmed'],
          rated: rideSnapshot['Rated'],
        );
      } else {
        return null;
      }
    } catch (e) {
      print('Error fetching ride from Firestore: $e');
      return null;
    }
  }
}
