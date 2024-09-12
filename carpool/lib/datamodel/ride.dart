import 'package:carpool/datamodel/user.dart';

import 'car.dart';

class Ride {
  final String id;
  final MyUser driver;
  final Map<MyUser, dynamic> passengers;
  final double? price;
  final int maxPassengers;
  final bool hasDisability;
  final String startingPoint;
  final double startingLat;
  final double startingLng;
  final double destinationLat;
  final double destinationLng;
  final String travelTime;
  final String distance;
  final String destination;
  final String date;
  final String hour;
  final Car? car;
  final bool confirmed;
  final List<dynamic> rated;

  Ride({
    required this.id,
    required this.driver,
    required this.passengers,
    required this.maxPassengers,
    this.price,
    required this.hasDisability,
    required this.startingPoint,
    required this.startingLat,
    required this.startingLng,
    required this.distance,
    required this.travelTime,
    required this.destinationLat,
    required this.destinationLng,
    required this.destination,
    required this.hour,
    required this.date,
    this.car,
    required this.confirmed,
    required this.rated,
  });
}
