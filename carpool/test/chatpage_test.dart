import 'package:carpool/pages/home_page_navigation/home_page_navigation_logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockBuildContext extends Mock implements BuildContext {}
class MockHomePageNavigationState extends Mock implements HomePageNavigationState {}
class MockHomePageNavigationLogic extends Mock implements HomePageNavigationLogic {}

void main() {

  group('_buildSearchTab Tests', () {
    testWidgets('renders UI correctly when not loading', (WidgetTester tester) async {
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
      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.byType(ElevatedButton), findsOneWidget);
    });
    testWidgets('renders UI correctly when not loading', (WidgetTester tester) async {
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
      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.byType(ElevatedButton), findsOneWidget);
    });


  });

}
bool _isLoading = false;
Widget _buildSearchTab({
  required BuildContext context,
  required HomePageNavigationState state,
  required HomePageNavigationLogic cubit,
}) {
  return SingleChildScrollView(
    child: _isLoading
        ? Center(child: CircularProgressIndicator())
        : Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          'Search Quote One',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        Text(
          'Search Quote Two',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 10),
        _buildSearchBodyCard(context: context, state: state), // Use _buildSearchBodyCard for undefined method
        const SizedBox(height: 50),
        _buildSearchButton(context: context, state: state, cubit: cubit), // Use _buildSearchButton for undefined method
      ],
    ),
  );
}

Widget _buildSearchBodyCard({
  required BuildContext context,
  required HomePageNavigationState state,
}) {
  return Container(
    width: 200,
    height: 100,
    color: Colors.blue,
    child: const Center(child: Text('Search Body Card')),
  );
}

Widget _buildSearchButton({
  required BuildContext context,
  required HomePageNavigationState state,
  required HomePageNavigationLogic cubit,
}) {
  return ElevatedButton(
    onPressed: () {},
    child: Text('Search Button'),
  );
}
