part of 'chat_page_logic.dart';

@freezed
class ChatPageState with _$ChatPageState {
  const factory ChatPageState.loading({
    @Default(false) bool isDarkMode,
  }) = ChatPageLoadingState;
  const factory ChatPageState.error({
    @Default(false) bool isDarkMode,
  }) = ChatPageErrorState;
  const factory ChatPageState.loaded({
    @Default(false) bool isDarkMode,
    required List<dynamic> messages,
  }) = ChatPageLoadedState;
}
