// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_page_logic.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LoginPageState {
  bool get isDarkMode => throw _privateConstructorUsedError;
  bool get isObscured => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isDarkMode, bool isObscured) loaded,
    required TResult Function(bool isDarkMode, bool isObscured) loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isDarkMode, bool isObscured)? loaded,
    TResult? Function(bool isDarkMode, bool isObscured)? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isDarkMode, bool isObscured)? loaded,
    TResult Function(bool isDarkMode, bool isObscured)? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginPageLoadedState value) loaded,
    required TResult Function(LoginPageLoadingState value) loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginPageLoadedState value)? loaded,
    TResult? Function(LoginPageLoadingState value)? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginPageLoadedState value)? loaded,
    TResult Function(LoginPageLoadingState value)? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginPageStateCopyWith<LoginPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginPageStateCopyWith<$Res> {
  factory $LoginPageStateCopyWith(
          LoginPageState value, $Res Function(LoginPageState) then) =
      _$LoginPageStateCopyWithImpl<$Res, LoginPageState>;
  @useResult
  $Res call({bool isDarkMode, bool isObscured});
}

/// @nodoc
class _$LoginPageStateCopyWithImpl<$Res, $Val extends LoginPageState>
    implements $LoginPageStateCopyWith<$Res> {
  _$LoginPageStateCopyWithImpl(this._value, this._then);

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
abstract class _$$LoginPageLoadedStateImplCopyWith<$Res>
    implements $LoginPageStateCopyWith<$Res> {
  factory _$$LoginPageLoadedStateImplCopyWith(_$LoginPageLoadedStateImpl value,
          $Res Function(_$LoginPageLoadedStateImpl) then) =
      __$$LoginPageLoadedStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isDarkMode, bool isObscured});
}

/// @nodoc
class __$$LoginPageLoadedStateImplCopyWithImpl<$Res>
    extends _$LoginPageStateCopyWithImpl<$Res, _$LoginPageLoadedStateImpl>
    implements _$$LoginPageLoadedStateImplCopyWith<$Res> {
  __$$LoginPageLoadedStateImplCopyWithImpl(_$LoginPageLoadedStateImpl _value,
      $Res Function(_$LoginPageLoadedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isDarkMode = null,
    Object? isObscured = null,
  }) {
    return _then(_$LoginPageLoadedStateImpl(
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

class _$LoginPageLoadedStateImpl
    with DiagnosticableTreeMixin
    implements LoginPageLoadedState {
  const _$LoginPageLoadedStateImpl(
      {this.isDarkMode = false, this.isObscured = true});

  @override
  @JsonKey()
  final bool isDarkMode;
  @override
  @JsonKey()
  final bool isObscured;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LoginPageState.loaded(isDarkMode: $isDarkMode, isObscured: $isObscured)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LoginPageState.loaded'))
      ..add(DiagnosticsProperty('isDarkMode', isDarkMode))
      ..add(DiagnosticsProperty('isObscured', isObscured));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginPageLoadedStateImpl &&
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
  _$$LoginPageLoadedStateImplCopyWith<_$LoginPageLoadedStateImpl>
      get copyWith =>
          __$$LoginPageLoadedStateImplCopyWithImpl<_$LoginPageLoadedStateImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isDarkMode, bool isObscured) loaded,
    required TResult Function(bool isDarkMode, bool isObscured) loading,
  }) {
    return loaded(isDarkMode, isObscured);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isDarkMode, bool isObscured)? loaded,
    TResult? Function(bool isDarkMode, bool isObscured)? loading,
  }) {
    return loaded?.call(isDarkMode, isObscured);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isDarkMode, bool isObscured)? loaded,
    TResult Function(bool isDarkMode, bool isObscured)? loading,
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
    required TResult Function(LoginPageLoadedState value) loaded,
    required TResult Function(LoginPageLoadingState value) loading,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginPageLoadedState value)? loaded,
    TResult? Function(LoginPageLoadingState value)? loading,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginPageLoadedState value)? loaded,
    TResult Function(LoginPageLoadingState value)? loading,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class LoginPageLoadedState implements LoginPageState {
  const factory LoginPageLoadedState(
      {final bool isDarkMode,
      final bool isObscured}) = _$LoginPageLoadedStateImpl;

  @override
  bool get isDarkMode;
  @override
  bool get isObscured;
  @override
  @JsonKey(ignore: true)
  _$$LoginPageLoadedStateImplCopyWith<_$LoginPageLoadedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoginPageLoadingStateImplCopyWith<$Res>
    implements $LoginPageStateCopyWith<$Res> {
  factory _$$LoginPageLoadingStateImplCopyWith(
          _$LoginPageLoadingStateImpl value,
          $Res Function(_$LoginPageLoadingStateImpl) then) =
      __$$LoginPageLoadingStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isDarkMode, bool isObscured});
}

/// @nodoc
class __$$LoginPageLoadingStateImplCopyWithImpl<$Res>
    extends _$LoginPageStateCopyWithImpl<$Res, _$LoginPageLoadingStateImpl>
    implements _$$LoginPageLoadingStateImplCopyWith<$Res> {
  __$$LoginPageLoadingStateImplCopyWithImpl(_$LoginPageLoadingStateImpl _value,
      $Res Function(_$LoginPageLoadingStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isDarkMode = null,
    Object? isObscured = null,
  }) {
    return _then(_$LoginPageLoadingStateImpl(
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

class _$LoginPageLoadingStateImpl
    with DiagnosticableTreeMixin
    implements LoginPageLoadingState {
  const _$LoginPageLoadingStateImpl(
      {this.isDarkMode = false, this.isObscured = true});

  @override
  @JsonKey()
  final bool isDarkMode;
  @override
  @JsonKey()
  final bool isObscured;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LoginPageState.loading(isDarkMode: $isDarkMode, isObscured: $isObscured)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LoginPageState.loading'))
      ..add(DiagnosticsProperty('isDarkMode', isDarkMode))
      ..add(DiagnosticsProperty('isObscured', isObscured));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginPageLoadingStateImpl &&
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
  _$$LoginPageLoadingStateImplCopyWith<_$LoginPageLoadingStateImpl>
      get copyWith => __$$LoginPageLoadingStateImplCopyWithImpl<
          _$LoginPageLoadingStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isDarkMode, bool isObscured) loaded,
    required TResult Function(bool isDarkMode, bool isObscured) loading,
  }) {
    return loading(isDarkMode, isObscured);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isDarkMode, bool isObscured)? loaded,
    TResult? Function(bool isDarkMode, bool isObscured)? loading,
  }) {
    return loading?.call(isDarkMode, isObscured);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isDarkMode, bool isObscured)? loaded,
    TResult Function(bool isDarkMode, bool isObscured)? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(isDarkMode, isObscured);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginPageLoadedState value) loaded,
    required TResult Function(LoginPageLoadingState value) loading,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginPageLoadedState value)? loaded,
    TResult? Function(LoginPageLoadingState value)? loading,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginPageLoadedState value)? loaded,
    TResult Function(LoginPageLoadingState value)? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoginPageLoadingState implements LoginPageState {
  const factory LoginPageLoadingState(
      {final bool isDarkMode,
      final bool isObscured}) = _$LoginPageLoadingStateImpl;

  @override
  bool get isDarkMode;
  @override
  bool get isObscured;
  @override
  @JsonKey(ignore: true)
  _$$LoginPageLoadingStateImplCopyWith<_$LoginPageLoadingStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
