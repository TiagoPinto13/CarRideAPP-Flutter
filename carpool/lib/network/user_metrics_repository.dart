
import 'package:cloud_firestore/cloud_firestore.dart';

import '../datamodel/user_metrics.dart';

class UserMetricsRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserMetrics?> fetchUserMetrics({required String userId}) async {
    try {
      DocumentSnapshot userMetricsDoc = await _firestore.collection('UserMetric').doc(userId).get();
      if (userMetricsDoc.exists) {
        return UserMetrics.fromFirestore(userMetricsDoc);
      }
    } catch (e) {
      print('Error fetching metrics: $e');
    }
    return null;
  }
}