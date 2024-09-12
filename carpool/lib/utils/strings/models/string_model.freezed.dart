// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'string_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StringModel _$StringModelFromJson(Map<String, dynamic> json) {
  return _StringModel.fromJson(json);
}

/// @nodoc
mixin _$StringModel {
  String get key => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StringModelCopyWith<StringModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StringModelCopyWith<$Res> {
  factory $StringModelCopyWith(
          StringModel value, $Res Function(StringModel) then) =
      _$StringModelCopyWithImpl<$Res, StringModel>;
  @useResult
  $Res call({String key, String value});
}

/// @nodoc
class _$StringModelCopyWithImpl<$Res, $Val extends StringModel>
    implements $StringModelCopyWith<$Res> {
  _$StringModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StringModelImplCopyWith<$Res>
    implements $StringModelCopyWith<$Res> {
  factory _$$StringModelImplCopyWith(
          _$StringModelImpl value, $Res Function(_$StringModelImpl) then) =
      __$$StringModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String key, String value});
}

/// @nodoc
class __$$StringModelImplCopyWithImpl<$Res>
    extends _$StringModelCopyWithImpl<$Res, _$StringModelImpl>
    implements _$$StringModelImplCopyWith<$Res> {
  __$$StringModelImplCopyWithImpl(
      _$StringModelImpl _value, $Res Function(_$StringModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? value = null,
  }) {
    return _then(_$StringModelImpl(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StringModelImpl extends _StringModel {
  const _$StringModelImpl({required this.key, required this.value}) : super._();

  factory _$StringModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StringModelImplFromJson(json);

  @override
  final String key;
  @override
  final String value;

  @override
  String toString() {
    return 'StringModel(key: $key, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StringModelImpl &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, key, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StringModelImplCopyWith<_$StringModelImpl> get copyWith =>
      __$$StringModelImplCopyWithImpl<_$StringModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StringModelImplToJson(
      this,
    );
  }
}

abstract class _StringModel extends StringModel {
  const factory _StringModel(
      {required final String key,
      required final String value}) = _$StringModelImpl;
  const _StringModel._() : super._();

  factory _StringModel.fromJson(Map<String, dynamic> json) =
      _$StringModelImpl.fromJson;

  @override
  String get key;
  @override
  String get value;
  @override
  @JsonKey(ignore: true)
  _$$StringModelImplCopyWith<_$StringModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
