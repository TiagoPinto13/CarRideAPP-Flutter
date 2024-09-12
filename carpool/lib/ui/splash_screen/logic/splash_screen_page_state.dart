/*
part of 'splash_screen_page_cubit.dart';

@freezed
class SplashScreenPageState with _$SplashScreenPageState {
  const factory SplashScreenPageState.initial({
    String? buildVersion,
  }) = InitialState;

  const factory SplashScreenPageState.loading({
    required String? buildVersion,
  }) = LoadingState;

  const factory SplashScreenPageState.noLogin({
    required String? buildVersion,
  }) = NoLoginState;

  const factory SplashScreenPageState.loginSuccess({
    required String? buildVersion,
    required bool isUserOnboarded,
    required bool isPassCodeProtected,
  }) = LoginSuccessState;

  const factory SplashScreenPageState.loginFailed({
    required String? buildVersion,
    @Default(true) bool isAccountWithSubscription,
  }) = LoginFailedState;
}
*/
