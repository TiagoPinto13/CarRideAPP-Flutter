
import 'package:carpool/pages/chat_page/chat_page_logic.dart';
import 'package:carpool/pages/home_page_navigation/home_page_navigation_logic.dart';
import 'package:carpool/pages/initial_page/initial_page_logic.dart';
import 'package:carpool/pages/login_page/login_page_logic.dart';
import 'package:carpool/pages/notifications_page/notification_page_logic.dart';
import 'package:carpool/pages/settings_page/settings_page_logic.dart';
import 'package:carpool/pages/signup_page/signup_page_logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:carpool/datamodel/search_input.dart';
import 'package:carpool/routes.dart';
import 'package:carpool/pages/home_page_navigation.dart';
import 'package:carpool/pages/login_page.dart';
import 'package:carpool/pages/signup_page.dart';
import 'package:carpool/pages/initial_page.dart';
import 'package:carpool/pages/show_rides_page.dart';
import 'package:carpool/pages/chat_page.dart';
import 'package:carpool/pages/notification_page.dart';
import 'package:carpool/pages/settings_page.dart';
import 'package:mockito/mockito.dart';


class MockBuildContext extends Mock implements BuildContext {}

void main() {
test('generateRoute should return the correct route for each named route', () {
var route = Routes.generateRoute(RouteSettings(name: HomePageNavigation.routeName));
expect(route.builder(MockBuildContext()), isA<BlocProvider<HomePageNavigationLogic>>());

route = Routes.generateRoute(RouteSettings(name: LoginPage.routeName));
expect(route.builder(MockBuildContext()), isA<BlocProvider<LoginPageLogic>>());

route = Routes.generateRoute(RouteSettings(name: SignupPage.routeName));
expect(route.builder(MockBuildContext()), isA<BlocProvider<SignupPageLogic>>());

route = Routes.generateRoute(RouteSettings(name: InitialPage.routeName));
expect(route.builder(MockBuildContext()), isA<BlocProvider<InitialPageLogic>>());

route = Routes.generateRoute(RouteSettings(name: ChatPage.routeName, arguments: ContactDriver(senderId: 'senderId', senderName: 'John Doe', receiverName: 'Jane Doe', receiverId: 'receiverId')));
expect(route.builder(MockBuildContext()), isA<BlocProvider<ChatPageLogic>>());

route = Routes.generateRoute(RouteSettings(name: NotificationPage.routeName));
expect(route.builder(MockBuildContext()), isA<BlocProvider<NotificationPageLogic>>());

route = Routes.generateRoute(RouteSettings(name: SettingsPage.routeName));
expect(route.builder(MockBuildContext()), isA<BlocProvider<SettingsPageLogic>>());
});

test('generateRoute should return an error route for unknown routes', () {
var route = Routes.generateRoute(RouteSettings(name: 'unknown'));
expect(route.builder(MockBuildContext()), isA<Scaffold>());
});
}