import 'package:carpool/datamodel/car.dart';
import 'package:carpool/network/user_repository.dart';
import 'package:carpool/providers/preferences.dart';
import 'package:carpool/theme/app_colors.dart';
import 'package:carpool/ui/app_button.dart';
import 'package:carpool/utils/strings/strings_constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../utils/strings/managers/strings_managers.dart';

part 'settings_page_state.dart';
part 'settings_page_logic.freezed.dart';

class SettingsPageLogic extends Cubit<SettingsPageState> {
  final bool isDarkMode;
  final _auth = FirebaseAuth.instance;
  var currentUser = FirebaseAuth.instance.currentUser;
  final UserRepository _userRepository = UserRepository();

  SettingsPageLogic({required this.isDarkMode})
      : super(SettingsPageState.loaded(isDarkMode: isDarkMode));

  Future<void> changeLanguage({required String language}) async {
    emit(SettingsPageState.loading(isDarkMode: isDarkMode));
    await PreferencesService.saveLanguage(language);
    StringsManager.instance.setCurrentLanguageCode(language);
    Future.delayed(Duration(seconds: 2));
    emit(SettingsPageState.loaded(isDarkMode: isDarkMode));
  }

  Future<void> changeTheme({required String theme}) async {
    emit(SettingsPageState.loading(isDarkMode: isDarkMode));
    await PreferencesService.saveThemeMode(theme);
    Future.delayed(Duration(seconds: 2));
    emit(SettingsPageState.loaded(isDarkMode: !isDarkMode));
  }

  Future<bool> addCarToUser(
      {required String userId,
      required String carName,
      required double consumption}) async {
    try {
      emit(SettingsPageState.loading(isDarkMode: isDarkMode));
      bool res = await _userRepository.addCarToUser(
          userId: userId, carName: carName, consumption: consumption);

      emit(SettingsPageState.loaded(isDarkMode: isDarkMode));
      return res;
    } catch (e) {
      return false;
    }
  }

  Future<bool> removeCarToUser({
    required String userId,
    required String carId,
  }) async {
    try {
      emit(SettingsPageState.loading(isDarkMode: isDarkMode));
      bool res = await _userRepository.removeCarFromUser(
          userId: userId, carId: carId);

      emit(SettingsPageState.loaded(isDarkMode: isDarkMode));
      return res;
    } catch (e) {
      return false;
    }
  }

  void fetchCars({required String userId}) async {
    try {
      emit(SettingsPageState.loading(isDarkMode: isDarkMode));
      List<Car> cars = await _userRepository.getCars(id: userId);

      emit(SettingsPageState.carsLoaded(isDarkMode: isDarkMode, cars: cars));
    } catch (e) {}
  }
}
