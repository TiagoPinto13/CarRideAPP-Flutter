// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quantity_string_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

QuantityStringModel _$QuantityStringModelFromJson(Map<String, dynamic> json) {
  return _QuantityStringModel.fromJson(json);
}

/// @nodoc
mixin _$QuantityStringModel {
  int? get count => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuantityStringModelCopyWith<QuantityStringModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuantityStringModelCopyWith<$Res> {
  factory $QuantityStringModelCopyWith(
          QuantityStringModel value, $Res Function(QuantityStringModel) then) =
      _$QuantityStringModelCopyWithImpl<$Res, QuantityStringModel>;
  @useResult
  $Res call({int? count, String value});
}

/// @nodoc
class _$QuantityStringModelCopyWithImpl<$Res, $Val extends QuantityStringModel>
    implements $QuantityStringModelCopyWith<$Res> {
  _$QuantityStringModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = freezed,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuantityStringModelImplCopyWith<$Res>
    implements $QuantityStringModelCopyWith<$Res> {
  factory _$$QuantityStringModelImplCopyWith(_$QuantityStringModelImpl value,
          $Res Function(_$QuantityStringModelImpl) then) =
      __$$QuantityStringModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? count, String value});
}

/// @nodoc
class __$$QuantityStringModelImplCopyWithImpl<$Res>
    extends _$QuantityStringModelCopyWithImpl<$Res, _$QuantityStringModelImpl>
    implements _$$QuantityStringModelImplCopyWith<$Res> {
  __$$QuantityStringModelImplCopyWithImpl(_$QuantityStringModelImpl _value,
      $Res Function(_$QuantityStringModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = freezed,
    Object? value = null,
  }) {
    return _then(_$QuantityStringModelImpl(
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuantityStringModelImpl extends _QuantityStringModel {
  const _$QuantityStringModelImpl({required this.count, required this.value})
      : super._();

  factory _$QuantityStringModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuantityStringModelImplFromJson(json);

  @override
  final int? count;
  @override
  final String value;

  @override
  String toString() {
    return 'QuantityStringModel(count: $count, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuantityStringModelImpl &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, count, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuantityStringModelImplCopyWith<_$QuantityStringModelImpl> get copyWith =>
      __$$QuantityStringModelImplCopyWithImpl<_$QuantityStringModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuantityStringModelImplToJson(
      this,
    );
  }
}

abstract class _QuantityStringModel extends QuantityStringModel {
  const factory _QuantityStringModel(
      {required final int? count,
      required final String value}) = _$QuantityStringModelImpl;
  const _QuantityStringModel._() : super._();

  factory _QuantityStringModel.fromJson(Map<String, dynamic> json) =
      _$QuantityStringModelImpl.fromJson;

  @override
  int? get count;
  @override
  String get value;
  @override
  @JsonKey(ignore: true)
  _$$QuantityStringModelImplCopyWith<_$QuantityStringModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
