part of 'signup_page_logic.dart';

@freezed
class SignupPageState with _$SignupPageState {
  const factory SignupPageState.loaded({
    @Default(false) bool isDarkMode,
    @Default(true) bool isObscured,
  }) = SignupPageLoadedState;
  
  const factory SignupPageState.buttonPressed({
    @Default(false) bool isDarkMode,
    @Default(true) bool isObscured,
  }) = SignupPageButtonPressedState;
}