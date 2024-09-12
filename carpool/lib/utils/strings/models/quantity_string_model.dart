import 'package:freezed_annotation/freezed_annotation.dart';

part 'quantity_string_model.freezed.dart';
part 'quantity_string_model.g.dart';

@freezed
class QuantityStringModel with _$QuantityStringModel {
  const QuantityStringModel._();

  const factory QuantityStringModel({
    required int? count,
    required String value,
  }) = _QuantityStringModel;

  factory QuantityStringModel.fromJson(Map<String, dynamic> json) =>
      _$QuantityStringModelFromJson(json);
}