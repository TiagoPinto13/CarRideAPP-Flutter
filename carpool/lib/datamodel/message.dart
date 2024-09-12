import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String senderId;
  final String senderName;
  final String receiverName;
  final String receiverId;
  final String message;
  final int timestamp;
  final bool read;

  Message({
    required this.senderId,
    required this.senderName,
    required this.receiverName,
    required this.receiverId,
    required this.message,
    required this.timestamp,
    required this.read,
});


  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'senderName': senderName,
      'receiverName': receiverName,
      'receiverId': receiverId,
      'message': message,
      'timestamp': timestamp,
      'read': read,
    };
  }
}