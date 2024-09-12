// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'show_rides_page_logic.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ShowRidesPageState {
  bool get isDarkMode => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isDarkMode) loading,
    required TResult Function(bool isDarkMode, List<Ride> rides) loaded,
    required TResult Function(bool isDarkMode, String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isDarkMode)? loading,
    TResult? Function(bool isDarkMode, List<Ride> rides)? loaded,
    TResult? Function(bool isDarkMode, String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isDarkMode)? loading,
    TResult Function(bool isDarkMode, List<Ride> rides)? loaded,
    TResult Function(bool isDarkMode, String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ShowRidesPageLoadingState value) loading,
    required TResult Function(ShowRidesPageLoadedState value) loaded,
    required TResult Function(ShowRidesPageErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ShowRidesPageLoadingState value)? loading,
    TResult? Function(ShowRidesPageLoadedState value)? loaded,
    TResult? Function(ShowRidesPageErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShowRidesPageLoadingState value)? loading,
    TResult Function(ShowRidesPageLoadedState value)? loaded,
    TResult Function(ShowRidesPageErrorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ShowRidesPageStateCopyWith<ShowRidesPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShowRidesPageStateCopyWith<$Res> {
  factory $ShowRidesPageStateCopyWith(
          ShowRidesPageState value, $Res Function(ShowRidesPageState) then) =
      _$ShowRidesPageStateCopyWithImpl<$Res, ShowRidesPageState>;
  @useResult
  $Res call({bool isDarkMode});
}

/// @nodoc
class _$ShowRidesPageStateCopyWithImpl<$Res, $Val extends ShowRidesPageState>
    implements $ShowRidesPageStateCopyWith<$Res> {
  _$ShowRidesPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isDarkMode = null,
  }) {
    return _then(_value.copyWith(
      isDarkMode: null == isDarkMode
          ? _value.isDarkMode
          : isDarkMode // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShowRidesPageLoadingStateImplCopyWith<$Res>
    implements $ShowRidesPageStateCopyWith<$Res> {
  factory _$$ShowRidesPageLoadingStateImplCopyWith(
          _$ShowRidesPageLoadingStateImpl value,
          $Res Function(_$ShowRidesPageLoadingStateImpl) then) =
      __$$ShowRidesPageLoadingStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isDarkMode});
}

/// @nodoc
class __$$ShowRidesPageLoadingStateImplCopyWithImpl<$Res>
    extends _$ShowRidesPageStateCopyWithImpl<$Res,
        _$ShowRidesPageLoadingStateImpl>
    implements _$$ShowRidesPageLoadingStateImplCopyWith<$Res> {
  __$$ShowRidesPageLoadingStateImplCopyWithImpl(
      _$ShowRidesPageLoadingStateImpl _value,
      $Res Function(_$ShowRidesPageLoadingStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isDarkMode = null,
  }) {
    return _then(_$ShowRidesPageLoadingStateImpl(
      isDarkMode: null == isDarkMode
          ? _value.isDarkMode
          : isDarkMode // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ShowRidesPageLoadingStateImpl implements ShowRidesPageLoadingState {
  const _$ShowRidesPageLoadingStateImpl({this.isDarkMode = false});

  @override
  @JsonKey()
  final bool isDarkMode;

  @override
  String toString() {
    return 'ShowRidesPageState.loading(isDarkMode: $isDarkMode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShowRidesPageLoadingStateImpl &&
            (identical(other.isDarkMode, isDarkMode) ||
                other.isDarkMode == isDarkMode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isDarkMode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShowRidesPageLoadingStateImplCopyWith<_$ShowRidesPageLoadingStateImpl>
      get copyWith => __$$ShowRidesPageLoadingStateImplCopyWithImpl<
          _$ShowRidesPageLoadingStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isDarkMode) loading,
    required TResult Function(bool isDarkMode, List<Ride> rides) loaded,
    required TResult Function(bool isDarkMode, String message) error,
  }) {
    return loading(isDarkMode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isDarkMode)? loading,
    TResult? Function(bool isDarkMode, List<Ride> rides)? loaded,
    TResult? Function(bool isDarkMode, String message)? error,
  }) {
    return loading?.call(isDarkMode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isDarkMode)? loading,
    TResult Function(bool isDarkMode, List<Ride> rides)? loaded,
    TResult Function(bool isDarkMode, String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(isDarkMode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ShowRidesPageLoadingState value) loading,
    required TResult Function(ShowRidesPageLoadedState value) loaded,
    required TResult Function(ShowRidesPageErrorState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ShowRidesPageLoadingState value)? loading,
    TResult? Function(ShowRidesPageLoadedState value)? loaded,
    TResult? Function(ShowRidesPageErrorState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShowRidesPageLoadingState value)? loading,
    TResult Function(ShowRidesPageLoadedState value)? loaded,
    TResult Function(ShowRidesPageErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ShowRidesPageLoadingState implements ShowRidesPageState {
  const factory ShowRidesPageLoadingState({final bool isDarkMode}) =
      _$ShowRidesPageLoadingStateImpl;

  @override
  bool get isDarkMode;
  @override
  @JsonKey(ignore: true)
  _$$ShowRidesPageLoadingStateImplCopyWith<_$ShowRidesPageLoadingStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ShowRidesPageLoadedStateImplCopyWith<$Res>
    implements $ShowRidesPageStateCopyWith<$Res> {
  factory _$$ShowRidesPageLoadedStateImplCopyWith(
          _$ShowRidesPageLoadedStateImpl value,
          $Res Function(_$ShowRidesPageLoadedStateImpl) then) =
      __$$ShowRidesPageLoadedStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isDarkMode, List<Ride> rides});
}

/// @nodoc
class __$$ShowRidesPageLoadedStateImplCopyWithImpl<$Res>
    extends _$ShowRidesPageStateCopyWithImpl<$Res,
        _$ShowRidesPageLoadedStateImpl>
    implements _$$ShowRidesPageLoadedStateImplCopyWith<$Res> {
  __$$ShowRidesPageLoadedStateImplCopyWithImpl(
      _$ShowRidesPageLoadedStateImpl _value,
      $Res Function(_$ShowRidesPageLoadedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isDarkMode = null,
    Object? rides = null,
  }) {
    return _then(_$ShowRidesPageLoadedStateImpl(
      isDarkMode: null == isDarkMode
          ? _value.isDarkMode
          : isDarkMode // ignore: cast_nullable_to_non_nullable
              as bool,
      rides: null == rides
          ? _value._rides
          : rides // ignore: cast_nullable_to_non_nullable
              as List<Ride>,
    ));
  }
}

/// @nodoc

class _$ShowRidesPageLoadedStateImpl implements ShowRidesPageLoadedState {
  const _$ShowRidesPageLoadedStateImpl(
      {this.isDarkMode = false, required final List<Ride> rides})
      : _rides = rides;

  @override
  @JsonKey()
  final bool isDarkMode;
  final List<Ride> _rides;
  @override
  List<Ride> get rides {
    if (_rides is EqualUnmodifiableListView) return _rides;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rides);
  }

  @override
  String toString() {
    return 'ShowRidesPageState.loaded(isDarkMode: $isDarkMode, rides: $rides)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShowRidesPageLoadedStateImpl &&
            (identical(other.isDarkMode, isDarkMode) ||
                other.isDarkMode == isDarkMode) &&
            const DeepCollectionEquality().equals(other._rides, _rides));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isDarkMode, const DeepCollectionEquality().hash(_rides));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShowRidesPageLoadedStateImplCopyWith<_$ShowRidesPageLoadedStateImpl>
      get copyWith => __$$ShowRidesPageLoadedStateImplCopyWithImpl<
          _$ShowRidesPageLoadedStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isDarkMode) loading,
    required TResult Function(bool isDarkMode, List<Ride> rides) loaded,
    required TResult Function(bool isDarkMode, String message) error,
  }) {
    return loaded(isDarkMode, rides);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isDarkMode)? loading,
    TResult? Function(bool isDarkMode, List<Ride> rides)? loaded,
    TResult? Function(bool isDarkMode, String message)? error,
  }) {
    return loaded?.call(isDarkMode, rides);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isDarkMode)? loading,
    TResult Function(bool isDarkMode, List<Ride> rides)? loaded,
    TResult Function(bool isDarkMode, String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(isDarkMode, rides);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ShowRidesPageLoadingState value) loading,
    required TResult Function(ShowRidesPageLoadedState value) loaded,
    required TResult Function(ShowRidesPageErrorState value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ShowRidesPageLoadingState value)? loading,
    TResult? Function(ShowRidesPageLoadedState value)? loaded,
    TResult? Function(ShowRidesPageErrorState value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShowRidesPageLoadingState value)? loading,
    TResult Function(ShowRidesPageLoadedState value)? loaded,
    TResult Function(ShowRidesPageErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class ShowRidesPageLoadedState implements ShowRidesPageState {
  const factory ShowRidesPageLoadedState(
      {final bool isDarkMode,
      required final List<Ride> rides}) = _$ShowRidesPageLoadedStateImpl;

  @override
  bool get isDarkMode;
  List<Ride> get rides;
  @override
  @JsonKey(ignore: true)
  _$$ShowRidesPageLoadedStateImplCopyWith<_$ShowRidesPageLoadedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ShowRidesPageErrorStateImplCopyWith<$Res>
    implements $ShowRidesPageStateCopyWith<$Res> {
  factory _$$ShowRidesPageErrorStateImplCopyWith(
          _$ShowRidesPageErrorStateImpl value,
          $Res Function(_$ShowRidesPageErrorStateImpl) then) =
      __$$ShowRidesPageErrorStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isDarkMode, String message});
}

/// @nodoc
class __$$ShowRidesPageErrorStateImplCopyWithImpl<$Res>
    extends _$ShowRidesPageStateCopyWithImpl<$Res,
        _$ShowRidesPageErrorStateImpl>
    implements _$$ShowRidesPageErrorStateImplCopyWith<$Res> {
  __$$ShowRidesPageErrorStateImplCopyWithImpl(
      _$ShowRidesPageErrorStateImpl _value,
      $Res Function(_$ShowRidesPageErrorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isDarkMode = null,
    Object? message = null,
  }) {
    return _then(_$ShowRidesPageErrorStateImpl(
      isDarkMode: null == isDarkMode
          ? _value.isDarkMode
          : isDarkMode // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ShowRidesPageErrorStateImpl implements ShowRidesPageErrorState {
  const _$ShowRidesPageErrorStateImpl(
      {this.isDarkMode = false, required this.message});

  @override
  @JsonKey()
  final bool isDarkMode;
  @override
  final String message;

  @override
  String toString() {
    return 'ShowRidesPageState.error(isDarkMode: $isDarkMode, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShowRidesPageErrorStateImpl &&
            (identical(other.isDarkMode, isDarkMode) ||
                other.isDarkMode == isDarkMode) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isDarkMode, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShowRidesPageErrorStateImplCopyWith<_$ShowRidesPageErrorStateImpl>
      get copyWith => __$$ShowRidesPageErrorStateImplCopyWithImpl<
          _$ShowRidesPageErrorStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isDarkMode) loading,
    required TResult Function(bool isDarkMode, List<Ride> rides) loaded,
    required TResult Function(bool isDarkMode, String message) error,
  }) {
    return error(isDarkMode, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isDarkMode)? loading,
    TResult? Function(bool isDarkMode, List<Ride> rides)? loaded,
    TResult? Function(bool isDarkMode, String message)? error,
  }) {
    return error?.call(isDarkMode, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isDarkMode)? loading,
    TResult Function(bool isDarkMode, List<Ride> rides)? loaded,
    TResult Function(bool isDarkMode, String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(isDarkMode, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ShowRidesPageLoadingState value) loading,
    required TResult Function(ShowRidesPageLoadedState value) loaded,
    required TResult Function(ShowRidesPageErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ShowRidesPageLoadingState value)? loading,
    TResult? Function(ShowRidesPageLoadedState value)? loaded,
    TResult? Function(ShowRidesPageErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShowRidesPageLoadingState value)? loading,
    TResult Function(ShowRidesPageLoadedState value)? loaded,
    TResult Function(ShowRidesPageErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ShowRidesPageErrorState implements ShowRidesPageState {
  const factory ShowRidesPageErrorState(
      {final bool isDarkMode,
      required final String message}) = _$ShowRidesPageErrorStateImpl;

  @override
  bool get isDarkMode;
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$ShowRidesPageErrorStateImplCopyWith<_$ShowRidesPageErrorStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
