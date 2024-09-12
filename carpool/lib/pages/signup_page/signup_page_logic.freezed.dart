// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup_page_logic.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SignupPageState {
  bool get isDarkMode => throw _privateConstructorUsedError;
  bool get isObscured => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isDarkMode, bool isObscured) loaded,
    required TResult Function(bool isDarkMode, bool isObscured) buttonPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isDarkMode, bool isObscured)? loaded,
    TResult? Function(bool isDarkMode, bool isObscured)? buttonPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isDarkMode, bool isObscured)? loaded,
    TResult Function(bool isDarkMode, bool isObscured)? buttonPressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignupPageLoadedState value) loaded,
    required TResult Function(SignupPageButtonPressedState value) buttonPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignupPageLoadedState value)? loaded,
    TResult? Function(SignupPageButtonPressedState value)? buttonPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignupPageLoadedState value)? loaded,
    TResult Function(SignupPageButtonPressedState value)? buttonPressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignupPageStateCopyWith<SignupPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignupPageStateCopyWith<$Res> {
  factory $SignupPageStateCopyWith(
          SignupPageState value, $Res Function(SignupPageState) then) =
      _$SignupPageStateCopyWithImpl<$Res, SignupPageState>;
  @useResult
  $Res call({bool isDarkMode, bool isObscured});
}

/// @nodoc
class _$SignupPageStateCopyWithImpl<$Res, $Val extends SignupPageState>
    implements $SignupPageStateCopyWith<$Res> {
  _$SignupPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isDarkMode = null,
    Object? isObscured = null,
  }) {
    return _then(_value.copyWith(
      isDarkMode: null == isDarkMode
          ? _value.isDarkMode
          : isDarkMode // ignore: cast_nullable_to_non_nullable
              as bool,
      isObscured: null == isObscured
          ? _value.isObscured
          : isObscured // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignupPageLoadedStateImplCopyWith<$Res>
    implements $SignupPageStateCopyWith<$Res> {
  factory _$$SignupPageLoadedStateImplCopyWith(
          _$SignupPageLoadedStateImpl value,
          $Res Function(_$SignupPageLoadedStateImpl) then) =
      __$$SignupPageLoadedStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isDarkMode, bool isObscured});
}

/// @nodoc
class __$$SignupPageLoadedStateImplCopyWithImpl<$Res>
    extends _$SignupPageStateCopyWithImpl<$Res, _$SignupPageLoadedStateImpl>
    implements _$$SignupPageLoadedStateImplCopyWith<$Res> {
  __$$SignupPageLoadedStateImplCopyWithImpl(_$SignupPageLoadedStateImpl _value,
      $Res Function(_$SignupPageLoadedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isDarkMode = null,
    Object? isObscured = null,
  }) {
    return _then(_$SignupPageLoadedStateImpl(
      isDarkMode: null == isDarkMode
          ? _value.isDarkMode
          : isDarkMode // ignore: cast_nullable_to_non_nullable
              as bool,
      isObscured: null == isObscured
          ? _value.isObscured
          : isObscured // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SignupPageLoadedStateImpl implements SignupPageLoadedState {
  const _$SignupPageLoadedStateImpl(
      {this.isDarkMode = false, this.isObscured = true});

  @override
  @JsonKey()
  final bool isDarkMode;
  @override
  @JsonKey()
  final bool isObscured;

  @override
  String toString() {
    return 'SignupPageState.loaded(isDarkMode: $isDarkMode, isObscured: $isObscured)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignupPageLoadedStateImpl &&
            (identical(other.isDarkMode, isDarkMode) ||
                other.isDarkMode == isDarkMode) &&
            (identical(other.isObscured, isObscured) ||
                other.isObscured == isObscured));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isDarkMode, isObscured);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignupPageLoadedStateImplCopyWith<_$SignupPageLoadedStateImpl>
      get copyWith => __$$SignupPageLoadedStateImplCopyWithImpl<
          _$SignupPageLoadedStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isDarkMode, bool isObscured) loaded,
    required TResult Function(bool isDarkMode, bool isObscured) buttonPressed,
  }) {
    return loaded(isDarkMode, isObscured);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isDarkMode, bool isObscured)? loaded,
    TResult? Function(bool isDarkMode, bool isObscured)? buttonPressed,
  }) {
    return loaded?.call(isDarkMode, isObscured);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isDarkMode, bool isObscured)? loaded,
    TResult Function(bool isDarkMode, bool isObscured)? buttonPressed,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(isDarkMode, isObscured);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignupPageLoadedState value) loaded,
    required TResult Function(SignupPageButtonPressedState value) buttonPressed,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignupPageLoadedState value)? loaded,
    TResult? Function(SignupPageButtonPressedState value)? buttonPressed,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignupPageLoadedState value)? loaded,
    TResult Function(SignupPageButtonPressedState value)? buttonPressed,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class SignupPageLoadedState implements SignupPageState {
  const factory SignupPageLoadedState(
      {final bool isDarkMode,
      final bool isObscured}) = _$SignupPageLoadedStateImpl;

  @override
  bool get isDarkMode;
  @override
  bool get isObscured;
  @override
  @JsonKey(ignore: true)
  _$$SignupPageLoadedStateImplCopyWith<_$SignupPageLoadedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SignupPageButtonPressedStateImplCopyWith<$Res>
    implements $SignupPageStateCopyWith<$Res> {
  factory _$$SignupPageButtonPressedStateImplCopyWith(
          _$SignupPageButtonPressedStateImpl value,
          $Res Function(_$SignupPageButtonPressedStateImpl) then) =
      __$$SignupPageButtonPressedStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isDarkMode, bool isObscured});
}

/// @nodoc
class __$$SignupPageButtonPressedStateImplCopyWithImpl<$Res>
    extends _$SignupPageStateCopyWithImpl<$Res,
        _$SignupPageButtonPressedStateImpl>
    implements _$$SignupPageButtonPressedStateImplCopyWith<$Res> {
  __$$SignupPageButtonPressedStateImplCopyWithImpl(
      _$SignupPageButtonPressedStateImpl _value,
      $Res Function(_$SignupPageButtonPressedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isDarkMode = null,
    Object? isObscured = null,
  }) {
    return _then(_$SignupPageButtonPressedStateImpl(
      isDarkMode: null == isDarkMode
          ? _value.isDarkMode
          : isDarkMode // ignore: cast_nullable_to_non_nullable
              as bool,
      isObscured: null == isObscured
          ? _value.isObscured
          : isObscured // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SignupPageButtonPressedStateImpl
    implements SignupPageButtonPressedState {
  const _$SignupPageButtonPressedStateImpl(
      {this.isDarkMode = false, this.isObscured = true});

  @override
  @JsonKey()
  final bool isDarkMode;
  @override
  @JsonKey()
  final bool isObscured;

  @override
  String toString() {
    return 'SignupPageState.buttonPressed(isDarkMode: $isDarkMode, isObscured: $isObscured)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignupPageButtonPressedStateImpl &&
            (identical(other.isDarkMode, isDarkMode) ||
                other.isDarkMode == isDarkMode) &&
            (identical(other.isObscured, isObscured) ||
                other.isObscured == isObscured));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isDarkMode, isObscured);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignupPageButtonPressedStateImplCopyWith<
          _$SignupPageButtonPressedStateImpl>
      get copyWith => __$$SignupPageButtonPressedStateImplCopyWithImpl<
          _$SignupPageButtonPressedStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isDarkMode, bool isObscured) loaded,
    required TResult Function(bool isDarkMode, bool isObscured) buttonPressed,
  }) {
    return buttonPressed(isDarkMode, isObscured);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isDarkMode, bool isObscured)? loaded,
    TResult? Function(bool isDarkMode, bool isObscured)? buttonPressed,
  }) {
    return buttonPressed?.call(isDarkMode, isObscured);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isDarkMode, bool isObscured)? loaded,
    TResult Function(bool isDarkMode, bool isObscured)? buttonPressed,
    required TResult orElse(),
  }) {
    if (buttonPressed != null) {
      return buttonPressed(isDarkMode, isObscured);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignupPageLoadedState value) loaded,
    required TResult Function(SignupPageButtonPressedState value) buttonPressed,
  }) {
    return buttonPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignupPageLoadedState value)? loaded,
    TResult? Function(SignupPageButtonPressedState value)? buttonPressed,
  }) {
    return buttonPressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignupPageLoadedState value)? loaded,
    TResult Function(SignupPageButtonPressedState value)? buttonPressed,
    required TResult orElse(),
  }) {
    if (buttonPressed != null) {
      return buttonPressed(this);
    }
    return orElse();
  }
}

abstract class SignupPageButtonPressedState implements SignupPageState {
  const factory SignupPageButtonPressedState(
      {final bool isDarkMode,
      final bool isObscured}) = _$SignupPageButtonPressedStateImpl;

  @override
  bool get isDarkMode;
  @override
  bool get isObscured;
  @override
  @JsonKey(ignore: true)
  _$$SignupPageButtonPressedStateImplCopyWith<
          _$SignupPageButtonPressedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
