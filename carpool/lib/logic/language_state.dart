part of 'language_logic.dart';

@freezed
class LanguageState with _$LanguageState {
  const factory LanguageState.state({@Default(AppLanguage.en) AppLanguage appLanguage}) = _State;
}
