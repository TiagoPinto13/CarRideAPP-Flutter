class SearchInput {
  final double fromLat;
  final double fromLng;
  final double? toLat;
  final double? toLng;
  final DateTime? date;
  final int passengers;
  final bool disability;

  SearchInput({
    required this.fromLat,
    required this.fromLng,
    this.toLat,
    this.toLng,
    required this.date,
    required this.passengers,
    required this.disability,
  });
}

class ContactDriver {
  final String senderId;
  final String senderName;
  final String receiverName;
  final String receiverId;

  ContactDriver({
    required this.senderId,
    required this.senderName,
    required this.receiverName,
    required this.receiverId,
  });
}

class JoinRideNotification {
  final String otherId;
  final int numPassengers;
  final String rideId;

  JoinRideNotification({
    required this.otherId,
    required this.rideId,
    required this.numPassengers,
  });

  Map<String, dynamic> toMap() {
    return {
      'user': otherId,
      'ride': rideId,
      'numPassengers': numPassengers,
    };
  }

  factory JoinRideNotification.fromMap(Map<String, dynamic> map) {
    return JoinRideNotification(
      otherId: map['user'],
      rideId: map['ride'],
      numPassengers: map['numPassengers'],
    );
  }
}

class ReplyJoinRideNotification {
  final String userId;
  final String rideId;

  ReplyJoinRideNotification({
    required this.userId,
    required this.rideId,
  });

  Map<String, dynamic> toMap() {
    return {
      'user': userId,
      'ride': rideId,
    };
  }

  factory ReplyJoinRideNotification.fromMap(Map<String, dynamic> map) {
    return ReplyJoinRideNotification(
      userId: map['user'],
      rideId: map['ride'],
    );
  }
}

class CancelRideNotification {
  final String userId;
  final String from;
  final String to;
  final String date;
  final String hour;
  final int seats;

  CancelRideNotification({
    required this.userId,
    required this.from,
    required this.to,
    required this.date,
    required this.hour,
    required this.seats,
  });

  Map<String, dynamic> toMap() {
    return {
      'user': userId,
      'from': from,
      'to': to,
      'date': date,
      'hour': hour,
      'seats': seats,
    };
  }

  factory CancelRideNotification.fromMap(Map<String, dynamic> map) {
    return CancelRideNotification(
      userId: map['user'],
      from: map['from'],
      to: map['to'],
      date: map['date'],
      hour: map['hour'],
      seats: map['seats'],
    );
  }
}

class HomePageNavigationArguments {
  final String id;
  final int selectedIndex;

  HomePageNavigationArguments(this.id, this.selectedIndex);
}

class ConfirmRideNotification {
  final String userId;
  final String from;
  final String to;
  final String date;
  final String hour;
  final int seats;
  final bool driverRating;

  ConfirmRideNotification({
    required this.userId,
    required this.from,
    required this.to,
    required this.date,
    required this.hour,
    required this.seats,
    required this.driverRating,
  });

  Map<String, dynamic> toMap() {
    return {
      'user': userId,
      'from': from,
      'to': to,
      'date': date,
      'hour': hour,
      'seats': seats,
      'driverRating': driverRating,
    };
  }

  factory ConfirmRideNotification.fromMap(Map<String, dynamic> map) {
    return ConfirmRideNotification(
      userId: map['user'],
      from: map['from'],
      to: map['to'],
      date: map['date'],
      hour: map['hour'],
      seats: map['seats'],
      driverRating: map['driverRating'],
    );
  }
}


class RatingReceived {
  final String userId;
  final String from;
  final String to;
  final String date;
  final String hour;
  final int rating;

  RatingReceived({
    required this.userId,
    required this.from,
    required this.to,
    required this.date,
    required this.hour,
    required this.rating,
  });

  Map<String, dynamic> toMap() {
    return {
      'user': userId,
      'from': from,
      'to': to,
      'date': date,
      'hour': hour,
      'rating': rating,
    };
  }

  factory RatingReceived.fromMap(Map<String, dynamic> map) {
    return RatingReceived(
      userId: map['user'],
      from: map['from'],
      to: map['to'],
      date: map['date'],
      hour: map['hour'],
      rating: map['rating'],
    );
  }
}