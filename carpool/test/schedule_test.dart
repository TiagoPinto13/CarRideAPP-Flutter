import 'package:carpool/pages/home_page_navigation/home_page_navigation_logic.dart';
import 'package:carpool/utils/strings/managers/strings_managers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([HomePageNavigationLogic, StringsManager])

void main() {
  group('ScheduleTab Widget Tests', ()
  {
    setUp(() {

    });


    Widget _buildScheduleTab({
      required BuildContext context,
      required Widget child,
    }) {
      return Scaffold(body: child);
    }

    Widget buildTestableWidget(Widget child) {
      return MaterialApp(
        home: Builder(
          builder: (BuildContext context) {
            return _buildScheduleTab(
              context: context,
              child: child,
            );
          },
        ),
      );
    }

    testWidgets('renders loading state correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
          buildTestableWidget(Center(child: CircularProgressIndicator())));

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets(
        'renders schedule loaded state correctly', (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget(
        const DefaultTabController(
          length: 3,
          child: Column(
            children: [
              SizedBox(
                height: 50,
                child: TabBar(
                  tabs: [
                    Tab(text: 'Active'),
                    Tab(text: 'Waiting'),
                    Tab(text: 'Expired'),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Center(child: Text('Active Rides')),
                    Center(child: Text('Waiting Rides')),
                    Center(child: Text('Expired Rides')),
                  ],
                ),
              ),
            ],
          ),
        ),
      ));

      expect(find.byType(TabBar), findsOneWidget);

      expect(find.byType(TabBarView), findsOneWidget);
    });

    testWidgets('renders error state correctly', (WidgetTester tester) async {
      final errorMessage = 'An error occurred';

      await tester.pumpWidget(buildTestableWidget(
        Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              errorMessage,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ),
      ));

      expect(find.text(errorMessage), findsOneWidget);
    });

  });
}
