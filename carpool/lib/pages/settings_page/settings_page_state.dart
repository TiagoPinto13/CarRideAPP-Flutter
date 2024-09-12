part of 'settings_page_logic.dart';

@freezed
class SettingsPageState with _$SettingsPageState {
  const factory SettingsPageState.loaded({
    @Default(false) bool isDarkMode,
  }) = SettingsPageLoadedState;
  const factory SettingsPageState.loading({
    @Default(false) bool isDarkMode,
  }) = SettingsPageLoadingState;
  const factory SettingsPageState.carsLoaded({
    @Default(false) bool isDarkMode, required List<Car> cars
  }) = SettingsPageCarsLoadedState;
}