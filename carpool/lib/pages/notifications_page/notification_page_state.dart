part of 'notification_page_logic.dart';

@freezed
class NotificationPageState with _$NotificationPageState {
  const factory NotificationPageState.loaded({
    @Default(false) bool isDarkMode,
  }) = NotificationPageLoadedState;
}