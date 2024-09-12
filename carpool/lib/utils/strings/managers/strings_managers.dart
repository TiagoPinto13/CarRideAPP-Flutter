

import 'dart:convert';

import 'package:carpool/providers/preferences.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/app_language_model.dart';
import '../models/language_model.dart';
import '../models/quantity_string_model.dart';
import '../models/string_model.dart';

class StringsManager {
  static final StringsManager _instance = StringsManager._();
  static StringsManager get instance => _instance;

  StringsManager._();

  late String _currentLanguageCode;
  late List<LanguageModel> _localStrings;

  /// Init StringsManager with the given [appLanguages]
  Future<void> initAsync({
    required List<AppLanguageModel> appLanguages,
  }) async {
    _localStrings = [];

    for (final appLanguage in appLanguages) {
      await _loadLocalStrings(appLanguage.languageStringsJsonPath);
    }

    final preferredLanguage = await PreferencesService.getLanguage();
    _currentLanguageCode = preferredLanguage ?? 'en';

    return;
  }

  /// Get a string with a given [stringKey] with the given [parameters] if needed
  String getString(BuildContext? context, String? stringKey, [Map<String, String>? parameters]) {
    try {
      Localizations.of(context!, StringsManager);

      StringModel? stringModel;

      final localStrings = _localStrings
          .firstWhereOrNull((language) => language.language == _currentLanguageCode)
          ?.strings;

      stringModel = localStrings?.firstWhereOrNull((string) => string.key == stringKey);

      if (stringModel == null) {
        _printStringException(stringKey!, exception_unknownString);

        return exception_unknownString;
      }

      return stringModel.value;

    } catch (exception) {
      _printStringException(stringKey!, exception_gettingString);

      return exception_gettingString;
    }
  }

  /// Set current language code
  void setCurrentLanguageCode(String languageCode) {
    _currentLanguageCode = languageCode;
  }


  /// Load a local strings file with the given [jsonPath]
  Future<void> _loadLocalStrings(String jsonPath) async {
    var localStringsJson = await rootBundle.loadString(jsonPath);
    var localStrings = _parseStringsJson(localStringsJson);

    if (localStrings != null) {
      _localStrings.add(localStrings);
    }

    return;
  }

  /// Parse a strings JSON
  LanguageModel? _parseStringsJson(String stringsJson) {
    try {
      final decodedStrings = jsonDecode(stringsJson);

      final language = decodedStrings['language'];
      final stringsList = decodedStrings['strings'];

      List<StringModel> strings = [];

      stringsList.first.forEach((key, value) {
        if (!key.toString().startsWith(section_prefix)) {
          if (value is String) {
            strings.add(StringModel(key: key, value: value));
          } else {
            List<String> parameters = [];

            if (value.containsKey('parameters')) {
              parameters = List.from(value['parameters']);
            }

            if ((value as Map).containsKey('value')) {
              strings.add(StringModel(
                key: key,
                value: value['value'],
              ));
            }

            else if (value.containsKey('quantityValues')) {
              List<QuantityStringModel> quantityValues = [];

              (value['quantityValues'] as Map).forEach((key, value) {
                if (int.tryParse(key) != null) {
                  quantityValues.add(QuantityStringModel(count: int.parse(key), value: value));
                } else {
                  quantityValues.add(QuantityStringModel(count: null, value: value));
                }
              });

              strings.add(StringModel(
                key: key,
                value: '',
              ));
            }
          }
        }
      });

      return LanguageModel(
        language: language,
        strings: strings,
      );
    } catch (exception) {
      return null;
    }
  }
}

/// Print to the console the given [exception] when obtaining a string with a given [stringKey]
void _printStringException(String stringKey, String exception) {
  if (kDebugMode) {
    print("StringManager Error: $stringKey - $exception");
  }
}

// Exceptions
const String exception_gettingString = "EXCEPTION_GETTING_STRING";
const String exception_missingParameters = "EXCEPTION_MISSING_PARAMETERS";
const String exception_missingQuantityParameter = "EXCEPTION_MISSING_QUANTITY_PARAMETER";
const String exception_missingQuantityValue = "EXCEPTION_MISSING_QUANTITY_VALUE";
const String exception_unknownString = "EXCEPTION_UNKNOWN_STRING";

// Other constants
const String section_prefix = "@_";