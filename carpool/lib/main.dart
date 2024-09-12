import 'package:carpool/app.dart';
import 'package:carpool/providers/preferences.dart';
import 'package:carpool/providers/user_provider.dart';
import 'package:carpool/utils/strings/managers/strings_managers.dart';
import 'package:carpool/utils/strings/models/app_language_model.dart';
import 'package:carpool/utils/strings/strings_constants.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
 
  WidgetsFlutterBinding.ensureInitialized();

  final savedLanguage = await PreferencesService.getLanguage();
  final savedTheme = await PreferencesService.getThemeMode();

  String? selectedLanguage = savedLanguage ?? 'en';

  StringsManager.instance.initAsync(
    appLanguages: [
      AppLanguageModel(
          languageCode: selectedLanguage,
          languageStringsJsonPath:
              'assets/strings/strings_$selectedLanguage.json'),
    ],
  );

  await StringsManager.instance.initAsync(appLanguages: appLanguages);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: App(
        isDarkMode: savedTheme == "dark",
      ),
    ),
  );
}
