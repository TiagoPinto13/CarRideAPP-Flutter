import 'package:cloud_firestore/cloud_firestore.dart';

class MyUser {
  final String id;
  final String name;
  final String username;
  final String email;
  final String gender;
  final List<dynamic> ridesAsDriver;
  final Map<String, dynamic> ridesAsPassenger;
  double? ratingAsDriver;
  double? ratingAsPassenger;


  MyUser({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.gender,
    required this.ridesAsDriver,
    required this.ridesAsPassenger,
    this.ratingAsDriver,
    this.ratingAsPassenger,
  });

  List<dynamic> fetchRidesAsDriverChunk(int startIndex, int limit) {
    return ridesAsDriver.reversed.skip(startIndex).take(limit).toList();
  }

  Map<String, dynamic> fetchRidesAsPassengerChunk(int startIndex, int limit) {
    return Map.fromEntries(
        ridesAsPassenger.entries.toList().reversed
            .skip(startIndex)
            .take(limit)
            .toList()
    );
  }

  factory MyUser.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return MyUser(
      id: data['id'],
      name: data['Name'],
      username: data['Username'],
      email: data['Email'],
      gender: data['Gender'],
      ridesAsDriver: List<dynamic>.from(data['RidesAsDriver'] ?? []),
      ridesAsPassenger:
          Map<String, dynamic>.from(data['RidesAsPassenger'] ?? {}),
    );
  }
}
