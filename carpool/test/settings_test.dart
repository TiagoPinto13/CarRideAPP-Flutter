import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockBuildContext extends Mock implements BuildContext {}

void main() {
  group('SettingsPage Tests', () {
    testWidgets('renders UI correctly', (WidgetTester tester) async {
      final context = MockBuildContext();

      await tester.pumpWidget(const MaterialApp(
        home: SettingsPage(isDarkMode: false),
      ));

      await tester.pumpAndSettle();

      expect(find.text('Language'), findsOneWidget);
      expect(find.byType(DropdownButton<int>), findsWidgets);
      expect(find.text('Dark Mode'), findsOneWidget);
      expect(find.byType(Switch), findsOneWidget);
      expect(find.text('Cars'), findsOneWidget);
    });

    testWidgets('toggles dark mode correctly', (WidgetTester tester) async {
      final context = MockBuildContext();

      await tester.pumpWidget(MaterialApp(
        home: SettingsPage(isDarkMode: false),
      ));

      var switchFinder = find.byType(Switch);
      expect(tester.widget<Switch>(switchFinder).value, false);

      await tester.tap(switchFinder);
      await tester.pump();
      expect(tester.widget<Switch>(switchFinder).value, false);
    });

    testWidgets('renders UI correctly', (WidgetTester tester) async {
      final context = MockBuildContext();

      await tester.pumpWidget(const MaterialApp(
        home: SettingsPage(isDarkMode: false),
      ));

      await tester.pumpAndSettle();

      expect(find.text('Language'), findsOneWidget);
      expect(find.byType(DropdownButton<int>), findsWidgets);
      expect(find.text('Dark Mode'), findsOneWidget);
      expect(find.byType(Switch), findsOneWidget);
      expect(find.text('Cars'), findsOneWidget);
    });

  });
}


class Car {
  final String name;
  final double consumption;

  Car({required this.name, required this.consumption});
}

class SettingsPage extends StatefulWidget {
  final bool isDarkMode;

  const SettingsPage({Key? key, required this.isDarkMode}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final List<Car> _cars = [
    Car(name: 'Car 1', consumption: 10.5),
    Car(name: 'Car 2', consumption: 8.0),
    Car(name: 'Car 3', consumption: 12.3),
  ];

  int _selectedCarIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          ListTile(
            title: Text('Language'),
            subtitle: DropdownButton<int>(
              value: 1,
              items: const [
                DropdownMenuItem<int>(
                  value: 1,
                  child: Text('English'),
                ),
                DropdownMenuItem<int>(
                  value: 2,
                  child: Text('Portuguese'),
                ),
              ],
              onChanged: (int? value) {},
            ),
          ),
          ListTile(
            title: Text('Dark Mode'),
            trailing: Switch(
              value: widget.isDarkMode,
              onChanged: (bool value) {},
            ),
          ),
          ListTile(
            title: Text('Cars'),
            subtitle: DropdownButton<int>(
              value: _selectedCarIndex,
              items: _cars
                  .map(
                    (car) => DropdownMenuItem<int>(
                  value: _cars.indexOf(car),
                  child: Text(car.name),
                ),
              )
                  .toList(),
              onChanged: (int? index) {
                setState(() {
                  _selectedCarIndex = index ?? 0;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
