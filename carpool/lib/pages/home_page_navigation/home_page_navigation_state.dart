part of 'home_page_navigation_logic.dart';

@freezed
class HomePageNavigationState with _$HomePageNavigationState {
  const factory HomePageNavigationState.loading({
    @Default(false) bool isDarkMode,
  }) = HomePageNavigationLoadingState;

  const factory HomePageNavigationState.scheduleLoaded({
    @Default(false) bool isDarkMode,
    required List<Ride> activeRidesAsDriver,
    required List<Ride> waitingRidesAsDriver,
    required List<Ride> expiredRidesAsDriver,
    required Map<Ride, int> activeRidesAsPassenger,
    required Map<Ride, int> expiredRidesAsPassenger,
    required Map<Ride, int> waitingRidesAsPassenger,
  }) = HomePageNavigationScheduleLoadedState;

  const factory HomePageNavigationState.error({
    @Default(false) bool isDarkMode,
    required String message,
  }) = HomePageNavigationErrorState;

  const factory HomePageNavigationState.metricsLoaded({
    @Default(false) bool isDarkMode,
    required List<Ride> rides,
  }) = HomePageNavigationMetricsLoadedState;

  const factory HomePageNavigationState.chatsLoaded({
    @Default(false) bool isDarkMode,
    required List<dynamic> chats,
}) = HomePageNavigationChatLoadedState;

  const factory HomePageNavigationState.carsLoaded({
    @Default(false) bool isDarkMode,
    required List<Car> cars,
}) = HomePageNavigationCarsLoadedState;

}