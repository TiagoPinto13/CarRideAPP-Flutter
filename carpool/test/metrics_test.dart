


import 'package:carpool/datamodel/car.dart';
import 'package:carpool/datamodel/ride.dart';
import 'package:carpool/datamodel/user.dart';
import 'package:carpool/pages/home_page_navigation.dart';
import 'package:carpool/utils/strings/managers/strings_managers.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_core/firebase_core.dart';
import 'mockFirebase.dart';



class MockFirebaseApp extends Mock implements FirebaseApp {}

void main() {
  setupFirebaseAuthMocks();

  setUpAll(() async {
    await Firebase.initializeApp();

  });
  group('MetricsHelper tests', ()
  {
    test('Teste para calculateTotalDistance', () {
      final MyUser driver = createTestUser('userId');
      final Car car = createTestCar(
          'Toyota Prius', 5.0);

      final List<Ride> userRides = [
        Ride(
          id: '1',
          driver: driver,
          passengers: {},
          maxPassengers: 2,
          hasDisability: false,
          startingPoint: "Porto",
          startingLat: 0.0,
          startingLng: 0.0,
          distance: '10 km',
          travelTime: '10 min',
          destinationLat: 0.0,
          destinationLng: 0.0,
          destination: 'Lisboa',
          hour: '10:00',
          date: '10/10/2021',
          confirmed: false,
          rated: [],
          car: car,
        ),
        Ride(
          id: '2',
          driver: driver,
          passengers: {},
          maxPassengers: 2,
          hasDisability: false,
          startingPoint: "Porto",
          startingLat: 0.0,
          startingLng: 0.0,
          distance: '20 km',
          travelTime: '20 min',
          destinationLat: 0.0,
          destinationLng: 0.0,
          destination: 'Lisboa',
          hour: '10:00',
          date: '10/10/2021',
          confirmed: false,
          rated: [],
          car: car,
        ),
        Ride(
          id: '3',
          driver: driver,
          passengers: {},
          maxPassengers: 2,
          hasDisability: false,
          startingPoint: "Porto",
          startingLat: 0.0,
          startingLng: 0.0,
          distance: '30 km',
          travelTime: '30 min',
          destinationLat: 0.0,
          destinationLng: 0.0,
          destination: 'Lisboa',
          hour: '10:00',
          date: '10/10/2021',
          confirmed: false,
          rated: [],
          car: car,
        ),
      ];

      final double totalDistance = MetricsHelper.calculateTotalDistance(
          userRides);

      expect(totalDistance, equals(60.0));
    });




    test('Teste para calculateTotalFuelSaved', () {
      final MyUser driver = createTestUser('userId');
      final Car car = createTestCar(
          'Toyota Prius', 5.0);

      final List<Ride> userRides = [
        Ride(
          id: '1',
          driver: driver,
          passengers: {},
          maxPassengers: 2,
          hasDisability: false,
          startingPoint: "Porto",
          startingLat: 0.0,
          startingLng: 0.0,
          distance: '10 km',
          travelTime: '10 min',
          destinationLat: 0.0,
          destinationLng: 0.0,
          destination: 'Lisboa',
          hour: '10:00',
          date: '10/10/2021',
          confirmed: false,
          rated: [],
          car: car,
        ),
        Ride(
          id: '2',
          driver: driver,
          passengers: {},
          maxPassengers: 2,
          hasDisability: false,
          startingPoint: "Porto",
          startingLat: 0.0,
          startingLng: 0.0,
          distance: '20 km',
          travelTime: '20 min',
          destinationLat: 0.0,
          destinationLng: 0.0,
          destination: 'Lisboa',
          hour: '10:00',
          date: '10/10/2021',
          confirmed: false,
          rated: [],
          car: car,
        ),
        Ride(
          id: '3',
          driver: driver,
          passengers: {},
          maxPassengers: 2,
          hasDisability: false,
          startingPoint: "Porto",
          startingLat: 0.0,
          startingLng: 0.0,
          distance: '30 km',
          travelTime: '30 min',
          destinationLat: 0.0,
          destinationLng: 0.0,
          destination: 'Lisboa',
          hour: '10:00',
          date: '10/10/2021',
          confirmed: false,
          rated: [],
          car: car,
        ),
      ];

      final double totalFuelSaved = MetricsHelper.calculateTotalFuelSaved(
          userRides);

      expect(totalFuelSaved, equals(3.0));
    });
    test('Test calculateTotalFuelSaved', () {
      final MyUser driver = createTestUser('userId');
      final Car car = createTestCar('Ferrarri', 5.0);

      final List<Ride> userRides = [
        Ride(
          id: '1',
          driver: driver,
          car: car,
          passengers: {},
          maxPassengers: 2,
          hasDisability: false,
          startingPoint: "Porto",
          startingLat: 0.0,
          startingLng: 0.0,
          distance: '10 km',
          travelTime: '10 min',
          destinationLat: 0.0,
          destinationLng: 0.0,
          destination: 'Lisboa',
          hour: '10:00',
          date: '2022-05-10',
          confirmed: false,
          rated: [],
        ),
        Ride(
          id: '2',
          driver: driver,
          car: car,
          passengers: {},
          maxPassengers: 2,
          hasDisability: false,
          startingPoint: "Porto",
          startingLat: 0.0,
          startingLng: 0.0,
          distance: '20 km',
          travelTime: '20 min',
          destinationLat: 0.0,
          destinationLng: 0.0,
          destination: 'Lisboa',
          hour: '10:00',
          date: '2022-05-12',
          confirmed: false,
          rated: [],
        ),
      ];

      double totalFuelSaved = MetricsHelper.calculateTotalFuelSaved(userRides);

      expect(totalFuelSaved, equals((10 * 5.0 + 20 * 5.0) / 100));
    });

    test('Teste para buildBarGroups', () {
      final List<double> lastWeek = [10, 20, 30, 40, 50, 60, 70];
      final List<double> thisWeek = [15, 25, 35, 45, 55, 65, 75];

      final List<BarChartGroupData> barGroups = MetricsHelper.buildBarGroups(
          lastWeek, thisWeek);

      expect(barGroups.length, equals(7));

      expect(barGroups[0].barRods.length, equals(2));
      expect(barGroups[0].barRods[0].y, equals(10));
      expect(barGroups[0].barRods[1].y, equals(15));
    });



    test('Teste para extractNumericValue', () {
      expect(MetricsHelper.extractNumericValue("20 km"), equals(20.0));

      expect(MetricsHelper.extractNumericValue("invalid"), equals(0.0));
    });
    test('Test getWeekdayNumber', () {
      DateTime monday = DateTime(2022, 5, 9);
      DateTime sunday = DateTime(2022, 5, 15);

      expect(MetricsHelper.getWeekdayNumber(monday), equals(0));
      expect(MetricsHelper.getWeekdayNumber(sunday), equals(6));
    });


    testWidgets('Test buildLegend', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MetricsHelper.buildLegend('Legenda', Colors.blue),
          ),
        ),
      );

      expect(find.text('Legenda'), findsOneWidget);
      expect(find.byType(Container), findsOneWidget);
    });
  });


  }

MyUser createTestUser(String id) {
  return MyUser(
    id: id,
    name: 'Test User',
    username: 'testuser',
    email: 'testuser@example.com',
    gender: 'Other',
    ridesAsDriver: [],
    ridesAsPassenger: {},
  );
}

Car createTestCar(String name, double consumption) {
  return Car(
    name: name,
    consumption: consumption,
  );
}
class MockStringsManager extends Mock implements StringsManager {}
