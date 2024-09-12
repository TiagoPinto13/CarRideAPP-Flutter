part of 'login_page_logic.dart';

@freezed
class LoginPageState with _$LoginPageState {
  const factory LoginPageState.loaded({
    @Default(false) bool isDarkMode,
    @Default(true) bool isObscured,
  }) = LoginPageLoadedState;
  const factory LoginPageState.loading({
    @Default(false) bool isDarkMode,
    @Default(true) bool isObscured,
  }) = LoginPageLoadingState;
}
