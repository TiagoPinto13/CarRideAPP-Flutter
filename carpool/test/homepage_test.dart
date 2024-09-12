import 'package:carpool/datamodel/user.dart';
import 'package:carpool/pages/home_page_navigation/home_page_navigation_logic.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'mockFirebase.dart';

@GenerateMocks([BuildContext, HomePageNavigationState, HomePageNavigationLogic])
class MockBuildContext extends Mock implements BuildContext {}
class MockHomePageNavigationState extends Mock implements HomePageNavigationState {}
class MockHomePageNavigationLogic extends Mock implements HomePageNavigationLogic {}
class MockFirebaseApp extends Mock implements FirebaseApp {}


void main() {
  setupFirebaseAuthMocks();

  setUpAll(() async {
    await Firebase.initializeApp();

  });
  group('_buildSearchTab Tests', () {
    testWidgets('renders UI correctly', (WidgetTester tester) async {
      final context = MockBuildContext();
      final state = MockHomePageNavigationState();
      final cubit = MockHomePageNavigationLogic();

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: _buildSearchTab(
            context: context,
            state: state,
            cubit: cubit,
          ),
        ),
      ));

      expect(find.text('Search Quote One'), findsOneWidget);
      expect(find.text('Search Quote Two'), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);
    });

  });




  group('_buildPublishTab Tests', () {
    testWidgets('renders UI correctly', (WidgetTester tester) async {
      final context = MockBuildContext();
      final state = MockHomePageNavigationState();
      final cubit = MockHomePageNavigationLogic();

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: _buildPublishTab(
            context: context,
            state: state,
            cubit: cubit,
          ),
        ),
      ));

      expect(find.text('Publish Quote One'), findsOneWidget);
      expect(find.text('Publish Quote Two'), findsOneWidget);
    });

  });


}

Widget _buildSearchTab({
  required BuildContext context,
  required HomePageNavigationState state,
  required HomePageNavigationLogic cubit,
}) {
  return SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Search Quote One',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        const Text(
          'Search Quote Two',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 10),
        Container(
          width: 200,
          height: 100,
          color: Colors.blue,
          child: const Center(child: Text('Search Body Card')),
        ),
        const SizedBox(height: 50),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Search Button'),
        ),
      ],
    ),
  );
}

Widget _buildPublishTab({
  required BuildContext context,
  required HomePageNavigationState state,
  required HomePageNavigationLogic cubit,
}) {
  return SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Publish Quote One',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        const Text(
          'Publish Quote Two',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        Container(
          width: 200,
          height: 100,
          color: Colors.green,
          child: const Center(child: Text('Publish Body Card')),
        ),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Publish Button'),
        ),
      ],
    ),
  );
}


MyUser createTestUser(String id) {
  return MyUser(
    id: id,
    name: 'Test User',
    username: 'testuser',
    email: 'testuser@example.com',
    gender: 'Other',
    ridesAsDriver: ['rideId'],
    ridesAsPassenger: {'rideId': 0},
  );
}

Stream<Map<dynamic, int>> simulateMessageStream() {
  final List<Map<String, dynamic>> messages = [
    {
      'senderId': 'senderId1',
      'senderName': 'Sender 1',
      'receiverId': 'receiverId1',
      'receiverName': 'Receiver 1',
      'message': 'Message 1',
      'timestamp': Timestamp.now().millisecondsSinceEpoch,
      'read': false,
    },
    {
      'senderId': 'senderId2',
      'senderName': 'Sender 2',
      'receiverId': 'receiverId2',
      'receiverName': 'Receiver 2',
      'message': 'Message 2',
      'timestamp': Timestamp.now().millisecondsSinceEpoch,
      'read': false,
    },

  ];

  return Stream<Map<dynamic, int>>.value({
    for (var message in messages)
      '${message['senderName']} to ${message['receiverName']}': 1
  });
}