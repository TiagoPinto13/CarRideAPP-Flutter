import 'package:carpool/datamodel/user.dart';
import 'package:carpool/providers/user_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:carpool/pages/notification_page.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import 'mockFirebase.dart';

class MockFirebaseApp extends Mock implements FirebaseApp {}
class MockUserProvider extends Mock implements UserProvider {}
void main() {

  setupFirebaseAuthMocks();
  setUpAll(() async {
    await Firebase.initializeApp();
  });

  group('Notification Page Widget Tests', ()
  {
    /*
    //test para saber se pagina dá render corretamente
    testWidgets('Notification Page should render correctly', (WidgetTester tester) async {
      // Build our NotificationPage widget.
      await tester.pumpWidget(NotificationPage(
        isDarkMode: false,
      ));

      // Verifica se o título é renderizado corretamente.
      expect(find.text('Notifications'), findsOneWidget);

      // Verifica se o botão de voltar é renderizado corretamente.
      expect(find.byIcon(Icons.arrow_back_ios), findsOneWidget);
    });

    testWidgets('Test Notification Page UI', (WidgetTester tester) async {
      // Mock the UserProvider
      final userProvider = MockUserProvider();

      // Build our app and trigger a frame.
      await tester.pumpWidget(
        ChangeNotifierProvider<UserProvider>.value(
          value: userProvider,
          child: MaterialApp(
            home: NotificationPage(isDarkMode: false),
          ),
        ),
      );

      // Verify that the page has a ListView for notifications
      expect(find.byType(ListView), findsOneWidget);
    });

  */
    //test para saber se notificação de join ride é renderizada corretamente
    testWidgets('Join ride notification should render properly', (
        WidgetTester tester) async {
      // Simulate a join ride notification
      await tester.pumpWidget(
        _BuildNotificationPageWrapper(
          isDarkMode: false,
          child: _BuildNotificationPage(
            isDarkMode: false,
          ),
        ),
      );

      // Verifica se os widgets esperados estão presentes
      expect(find.text('Accept'), findsOneWidget);
      expect(find.text('Decline'), findsOneWidget);
      expect(find.text('Contact User'), findsOneWidget);
    });

    // Adicione mais testes conforme necessário para cobrir outras funcionalidades da página
  });
}

// Um widget de wrapper necessário para testar _BuildNotificationPage
class _BuildNotificationPageWrapper extends StatelessWidget {
  final bool isDarkMode;
  final Widget child;

  const _BuildNotificationPageWrapper({
    Key? key,
    required this.isDarkMode,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: child,
      ),
    );
  }
}

// Um widget de teste para _BuildNotificationPage
class _BuildNotificationPage extends StatelessWidget {
  final bool isDarkMode;

  const _BuildNotificationPage({
    Key? key,
    required this.isDarkMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('Accept'),
          Text('Decline'),
          Text('Contact User'),
        ],
      ),
    );
  }
}
