import 'package:carpool/logic/theme_logic.dart';

import 'package:carpool/pages/initial_page.dart';
import 'package:carpool/providers/preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:overlay_support/overlay_support.dart';
import 'logic/language_logic.dart';
import 'routes.dart';
import 'theme/app_theme.dart';
import 'utils/strings/delegates/strings_delegates.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class App extends StatefulWidget {
  final StringsDelegate stringsDelegate = StringsDelegate();
  final bool isDarkMode;

  App({super.key, required this.isDarkMode});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return Phoenix(
      child: MultiRepositoryProvider(
        providers: [
          RepositoryProvider.value(value: PreferencesService()),
          BlocProvider(
            create: (context) => LanguageLogic(),
          ),
        ],
        child: BlocBuilder<LanguageLogic, LanguageState>(
          builder: (context, state) {
            return Phoenix(
              child: OverlaySupport(
                child: MaterialApp(
                  title: 'SmartHome',
                  locale: const Locale('pt', 'PT'),
                  localizationsDelegates: [
                    widget.stringsDelegate,
                  ],
                  onGenerateRoute: Routes.generateRoute,
                  initialRoute: InitialPage.routeName,
                  navigatorKey: navigatorKey,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
