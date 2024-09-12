import 'package:carpool/datamodel/search_input.dart';
import 'package:carpool/pages/chat_page.dart';
import 'package:carpool/pages/chat_page/chat_page_logic.dart';
import 'package:carpool/pages/home_page_navigation.dart';
import 'package:carpool/pages/home_page_navigation/home_page_navigation_logic.dart';
import 'package:carpool/pages/initial_page.dart';
import 'package:carpool/pages/initial_page/initial_page_logic.dart';
import 'package:carpool/pages/login_page.dart';
import 'package:carpool/pages/login_page/login_page_logic.dart';
import 'package:carpool/pages/notification_page.dart';
import 'package:carpool/pages/notifications_page/notification_page_logic.dart';
import 'package:carpool/pages/settings_page.dart';
import 'package:carpool/pages/settings_page/settings_page_logic.dart';
import 'package:carpool/pages/show_rides_page.dart';
import 'package:carpool/pages/show_rides_page/show_rides_page_logic.dart';
import 'package:carpool/pages/signup_page.dart';
import 'package:carpool/pages/signup_page/signup_page_logic.dart';
import 'package:carpool/providers/preferences.dart';
import 'package:carpool/theme/app_colors.dart';
import 'package:carpool/theme/app_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Routes {
  static MaterialPageRoute generateRoute(RouteSettings settings) {
    final name = settings.name;
    final args = settings.arguments;

    MaterialPageRoute route(Widget widget) {
      return MaterialPageRoute(
        builder: (context) => widget,
      );
    }

    // Home
    if (name == HomePageNavigation.routeName) {
      return route(
        BlocProvider(
          create: (context) => HomePageNavigationLogic(isDarkMode: PreferencesService.isDarkMode()),
          child: HomePageNavigation(
              isDarkMode: PreferencesService.isDarkMode(),
          ),
        ),
      );
    }

    if (name == LoginPage.routeName) {
      return route(
        BlocProvider(
          create: (context) => LoginPageLogic(isDarkMode: PreferencesService.isDarkMode()),
          child: LoginPage(isDarkMode: PreferencesService.isDarkMode()),
        ),
      );
    }

    if (name == SignupPage.routeName) {
      return route(
        BlocProvider(
          create: (context) => SignupPageLogic(isDarkMode: PreferencesService.isDarkMode()),
          child: SignupPage(isDarkMode: PreferencesService.isDarkMode()),
        ),
      );
    }

    if (name == InitialPage.routeName) {
      return route(
        BlocProvider(
          create: (context) => InitialPageLogic(isDarkMode: PreferencesService.isDarkMode()),
          child: InitialPage(isDarkMode: PreferencesService.isDarkMode()),
        ),
      );
    }

    if (name == ShowRidesPage.routeName) {
      if (args is SearchInput) {
        return route(
          BlocProvider(
            create: (context) => ShowRidesPageLogic(isDarkMode: PreferencesService.isDarkMode()),
            child: ShowRidesPage(searchInput: args, isDarkMode: PreferencesService.isDarkMode()),
          ),
        );
      }
    }

    if (name == ChatPage.routeName) {
      if (args is ContactDriver) {
        return route(
          BlocProvider(
            create: (context) => ChatPageLogic(isDarkMode: PreferencesService.isDarkMode()),
            child: ChatPage(
              senderId: args.senderId,
              senderName: args.senderName,
              receiverName: args.receiverName,
              receiverId: args.receiverId,
                isDarkMode: PreferencesService.isDarkMode(),
            ),
          ),
        );
      }
    }

    if (name == NotificationPage.routeName) {
      return route(
        BlocProvider(
          create: (context) => NotificationPageLogic(isDarkMode: PreferencesService.isDarkMode()),
          child: NotificationPage(isDarkMode: PreferencesService.isDarkMode()),
        ),
      );
    }

    if (name == SettingsPage.routeName) {
      return route(
        BlocProvider(
          create: (context) => SettingsPageLogic(isDarkMode: PreferencesService.isDarkMode()),
          child: SettingsPage(isDarkMode: PreferencesService.isDarkMode()),
        ),
      );
    }

    return route(_errorRoute(settings));
  }

  static Widget _errorRoute(RouteSettings settings) {
    return Scaffold(
      backgroundColor: AppColors.textColor,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('Route doesn\'t exist', style: AppStyle.bodyLight),
            Text('Route: ${settings.name}', style: AppStyle.bodyLight),
            Text('Arguments: ${settings.arguments}', style: AppStyle.bodyLight),
          ],
        ),
      ),
    );
  }
}
