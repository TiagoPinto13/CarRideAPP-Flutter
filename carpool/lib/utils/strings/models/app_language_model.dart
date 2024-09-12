import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_language_model.freezed.dart';
part 'app_language_model.g.dart';

@freezed
class AppLanguageModel with _$AppLanguageModel {
  const AppLanguageModel._();

  const factory AppLanguageModel({
    required String languageCode,
    required String languageStringsJsonPath,
  }) = _AppLanguageModel;

  factory AppLanguageModel.fromJson(Map<String, dynamic> json) => _$AppLanguageModelFromJson(json);
}