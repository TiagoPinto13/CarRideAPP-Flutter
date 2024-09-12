import 'package:flutter/material.dart';
import '../managers/strings_managers.dart';

class StringsDelegate extends LocalizationsDelegate<StringsManager> {
  @override
  bool isSupported(Locale locale) => true;

  @override
  Future<StringsManager> load(Locale locale) async {
    return StringsManager.instance;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate old) => false;
}
