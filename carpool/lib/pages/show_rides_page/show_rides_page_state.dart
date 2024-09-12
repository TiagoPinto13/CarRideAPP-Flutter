part of 'show_rides_page_logic.dart';

@freezed
class ShowRidesPageState with _$ShowRidesPageState {
  const factory ShowRidesPageState.loading({
    @Default(false) bool isDarkMode,
  }) = ShowRidesPageLoadingState;

  const factory ShowRidesPageState.loaded({
    @Default(false) bool isDarkMode,
    required List<Ride> rides,
  }) = ShowRidesPageLoadedState;

  const factory ShowRidesPageState.error({
  @Default(false) bool isDarkMode,
  required String message,
  }) = ShowRidesPageErrorState;
}