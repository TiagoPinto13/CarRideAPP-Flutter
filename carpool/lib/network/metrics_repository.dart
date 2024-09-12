import 'package:cloud_firestore/cloud_firestore.dart';

import '../datamodel/metrics.dart';

class MetricsRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Metrics>> fetchMetrics({required String metricsId}) async {
    try {
      QuerySnapshot metricsQuery = await _firestore.collection('Metric').where('metricsId', isEqualTo: metricsId).get();
      List<Metrics> metricsList = [];

      metricsQuery.docs.forEach((metricsDoc) {
        if (metricsDoc.exists) {
          Map<String, dynamic> data = metricsDoc.data() as Map<String, dynamic>;
          metricsList.add(Metrics.fromFirestore(data));
        }
      });

      return metricsList;
    } catch (e) {
      print('Error fetching metrics: $e');
      return [];
    }
  }
}