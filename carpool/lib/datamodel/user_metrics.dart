import 'package:cloud_firestore/cloud_firestore.dart';

class UserMetrics {
  final String metricsId;
  final String userId;

  UserMetrics({
    required this.userId,
    required this.metricsId,
  });

  factory UserMetrics.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return UserMetrics(
      metricsId: data['Metric'],
      userId: data['User'],
    );
  }
}