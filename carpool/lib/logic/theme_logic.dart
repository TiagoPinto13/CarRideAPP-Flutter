import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

/*
part 'theme_state.dart';
part 'theme_logic.freezed.dart';

enum AppThemeModes {
  dark,
  light,
}

class ThemeLogic extends Cubit<ThemeState> {
  ThemeLogic() : super(const ThemeState.state(appTheme: AppThemeModes.light));

  AppThemeModes get currentTheme => state.appTheme;

  void changeTheme(AppThemeModes appTheme) {
    emit(ThemeState.state(appTheme: appTheme));
  }
}
*/