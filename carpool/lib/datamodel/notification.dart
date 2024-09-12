import 'package:cloud_firestore/cloud_firestore.dart';

class Notification {
  final dynamic text;
  final int type;
  final Timestamp timestamp;

  Notification({
    required this.text,
    required this.type,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'type': type,
      'timestamp': timestamp,
    };
  }

  factory Notification.fromMap(dynamic map) {
    return Notification(text: map['text'], type: map['type'], timestamp: map['timestamp']);
  }
}