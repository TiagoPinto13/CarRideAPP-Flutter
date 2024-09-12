part of 'initial_page_logic.dart';

@freezed
class InitialPageState with _$InitialPageState {
  const factory InitialPageState.loaded({
    @Default(false) bool isDarkMode,
  }) = InitialPageLoadedState;
}
