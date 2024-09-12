// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_page_logic.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SettingsPageState {
  bool get isDarkMode => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isDarkMode) loaded,
    required TResult Function(bool isDarkMode) loading,
    required TResult Function(bool isDarkMode, List<Car> cars) carsLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isDarkMode)? loaded,
    TResult? Function(bool isDarkMode)? loading,
    TResult? Function(bool isDarkMode, List<Car> cars)? carsLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isDarkMode)? loaded,
    TResult Function(bool isDarkMode)? loading,
    TResult Function(bool isDarkMode, List<Car> cars)? carsLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SettingsPageLoadedState value) loaded,
    required TResult Function(SettingsPageLoadingState value) loading,
    required TResult Function(SettingsPageCarsLoadedState value) carsLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SettingsPageLoadedState value)? loaded,
    TResult? Function(SettingsPageLoadingState value)? loading,
    TResult? Function(SettingsPageCarsLoadedState value)? carsLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SettingsPageLoadedState value)? loaded,
    TResult Function(SettingsPageLoadingState value)? loading,
    TResult Function(SettingsPageCarsLoadedState value)? carsLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SettingsPageStateCopyWith<SettingsPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsPageStateCopyWith<$Res> {
  factory $SettingsPageStateCopyWith(
          SettingsPageState value, $Res Function(SettingsPageState) then) =
      _$SettingsPageStateCopyWithImpl<$Res, SettingsPageState>;
  @useResult
  $Res call({bool isDarkMode});
}

/// @nodoc
class _$SettingsPageStateCopyWithImpl<$Res, $Val extends SettingsPageState>
    implements $SettingsPageStateCopyWith<$Res> {
  _$SettingsPageStateCopyWithImpl(this._value, this._then);

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
abstract class _$$SettingsPageLoadedStateImplCopyWith<$Res>
    implements $SettingsPageStateCopyWith<$Res> {
  factory _$$SettingsPageLoadedStateImplCopyWith(
          _$SettingsPageLoadedStateImpl value,
          $Res Function(_$SettingsPageLoadedStateImpl) then) =
      __$$SettingsPageLoadedStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isDarkMode});
}

/// @nodoc
class __$$SettingsPageLoadedStateImplCopyWithImpl<$Res>
    extends _$SettingsPageStateCopyWithImpl<$Res, _$SettingsPageLoadedStateImpl>
    implements _$$SettingsPageLoadedStateImplCopyWith<$Res> {
  __$$SettingsPageLoadedStateImplCopyWithImpl(
      _$SettingsPageLoadedStateImpl _value,
      $Res Function(_$SettingsPageLoadedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isDarkMode = null,
  }) {
    return _then(_$SettingsPageLoadedStateImpl(
      isDarkMode: null == isDarkMode
          ? _value.isDarkMode
          : isDarkMode // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SettingsPageLoadedStateImpl implements SettingsPageLoadedState {
  const _$SettingsPageLoadedStateImpl({this.isDarkMode = false});

  @override
  @JsonKey()
  final bool isDarkMode;

  @override
  String toString() {
    return 'SettingsPageState.loaded(isDarkMode: $isDarkMode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingsPageLoadedStateImpl &&
            (identical(other.isDarkMode, isDarkMode) ||
                other.isDarkMode == isDarkMode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isDarkMode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SettingsPageLoadedStateImplCopyWith<_$SettingsPageLoadedStateImpl>
      get copyWith => __$$SettingsPageLoadedStateImplCopyWithImpl<
          _$SettingsPageLoadedStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isDarkMode) loaded,
    required TResult Function(bool isDarkMode) loading,
    required TResult Function(bool isDarkMode, List<Car> cars) carsLoaded,
  }) {
    return loaded(isDarkMode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isDarkMode)? loaded,
    TResult? Function(bool isDarkMode)? loading,
    TResult? Function(bool isDarkMode, List<Car> cars)? carsLoaded,
  }) {
    return loaded?.call(isDarkMode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isDarkMode)? loaded,
    TResult Function(bool isDarkMode)? loading,
    TResult Function(bool isDarkMode, List<Car> cars)? carsLoaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(isDarkMode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SettingsPageLoadedState value) loaded,
    required TResult Function(SettingsPageLoadingState value) loading,
    required TResult Function(SettingsPageCarsLoadedState value) carsLoaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SettingsPageLoadedState value)? loaded,
    TResult? Function(SettingsPageLoadingState value)? loading,
    TResult? Function(SettingsPageCarsLoadedState value)? carsLoaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SettingsPageLoadedState value)? loaded,
    TResult Function(SettingsPageLoadingState value)? loading,
    TResult Function(SettingsPageCarsLoadedState value)? carsLoaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class SettingsPageLoadedState implements SettingsPageState {
  const factory SettingsPageLoadedState({final bool isDarkMode}) =
      _$SettingsPageLoadedStateImpl;

  @override
  bool get isDarkMode;
  @override
  @JsonKey(ignore: true)
  _$$SettingsPageLoadedStateImplCopyWith<_$SettingsPageLoadedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SettingsPageLoadingStateImplCopyWith<$Res>
    implements $SettingsPageStateCopyWith<$Res> {
  factory _$$SettingsPageLoadingStateImplCopyWith(
          _$SettingsPageLoadingStateImpl value,
          $Res Function(_$SettingsPageLoadingStateImpl) then) =
      __$$SettingsPageLoadingStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isDarkMode});
}

/// @nodoc
class __$$SettingsPageLoadingStateImplCopyWithImpl<$Res>
    extends _$SettingsPageStateCopyWithImpl<$Res,
        _$SettingsPageLoadingStateImpl>
    implements _$$SettingsPageLoadingStateImplCopyWith<$Res> {
  __$$SettingsPageLoadingStateImplCopyWithImpl(
      _$SettingsPageLoadingStateImpl _value,
      $Res Function(_$SettingsPageLoadingStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isDarkMode = null,
  }) {
    return _then(_$SettingsPageLoadingStateImpl(
      isDarkMode: null == isDarkMode
          ? _value.isDarkMode
          : isDarkMode // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SettingsPageLoadingStateImpl implements SettingsPageLoadingState {
  const _$SettingsPageLoadingStateImpl({this.isDarkMode = false});

  @override
  @JsonKey()
  final bool isDarkMode;

  @override
  String toString() {
    return 'SettingsPageState.loading(isDarkMode: $isDarkMode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingsPageLoadingStateImpl &&
            (identical(other.isDarkMode, isDarkMode) ||
                other.isDarkMode == isDarkMode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isDarkMode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SettingsPageLoadingStateImplCopyWith<_$SettingsPageLoadingStateImpl>
      get copyWith => __$$SettingsPageLoadingStateImplCopyWithImpl<
          _$SettingsPageLoadingStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isDarkMode) loaded,
    required TResult Function(bool isDarkMode) loading,
    required TResult Function(bool isDarkMode, List<Car> cars) carsLoaded,
  }) {
    return loading(isDarkMode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isDarkMode)? loaded,
    TResult? Function(bool isDarkMode)? loading,
    TResult? Function(bool isDarkMode, List<Car> cars)? carsLoaded,
  }) {
    return loading?.call(isDarkMode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isDarkMode)? loaded,
    TResult Function(bool isDarkMode)? loading,
    TResult Function(bool isDarkMode, List<Car> cars)? carsLoaded,
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
    required TResult Function(SettingsPageLoadedState value) loaded,
    required TResult Function(SettingsPageLoadingState value) loading,
    required TResult Function(SettingsPageCarsLoadedState value) carsLoaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SettingsPageLoadedState value)? loaded,
    TResult? Function(SettingsPageLoadingState value)? loading,
    TResult? Function(SettingsPageCarsLoadedState value)? carsLoaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SettingsPageLoadedState value)? loaded,
    TResult Function(SettingsPageLoadingState value)? loading,
    TResult Function(SettingsPageCarsLoadedState value)? carsLoaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class SettingsPageLoadingState implements SettingsPageState {
  const factory SettingsPageLoadingState({final bool isDarkMode}) =
      _$SettingsPageLoadingStateImpl;

  @override
  bool get isDarkMode;
  @override
  @JsonKey(ignore: true)
  _$$SettingsPageLoadingStateImplCopyWith<_$SettingsPageLoadingStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SettingsPageCarsLoadedStateImplCopyWith<$Res>
    implements $SettingsPageStateCopyWith<$Res> {
  factory _$$SettingsPageCarsLoadedStateImplCopyWith(
          _$SettingsPageCarsLoadedStateImpl value,
          $Res Function(_$SettingsPageCarsLoadedStateImpl) then) =
      __$$SettingsPageCarsLoadedStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isDarkMode, List<Car> cars});
}

/// @nodoc
class __$$SettingsPageCarsLoadedStateImplCopyWithImpl<$Res>
    extends _$SettingsPageStateCopyWithImpl<$Res,
        _$SettingsPageCarsLoadedStateImpl>
    implements _$$SettingsPageCarsLoadedStateImplCopyWith<$Res> {
  __$$SettingsPageCarsLoadedStateImplCopyWithImpl(
      _$SettingsPageCarsLoadedStateImpl _value,
      $Res Function(_$SettingsPageCarsLoadedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isDarkMode = null,
    Object? cars = null,
  }) {
    return _then(_$SettingsPageCarsLoadedStateImpl(
      isDarkMode: null == isDarkMode
          ? _value.isDarkMode
          : isDarkMode // ignore: cast_nullable_to_non_nullable
              as bool,
      cars: null == cars
          ? _value._cars
          : cars // ignore: cast_nullable_to_non_nullable
              as List<Car>,
    ));
  }
}

/// @nodoc

class _$SettingsPageCarsLoadedStateImpl implements SettingsPageCarsLoadedState {
  const _$SettingsPageCarsLoadedStateImpl(
      {this.isDarkMode = false, required final List<Car> cars})
      : _cars = cars;

  @override
  @JsonKey()
  final bool isDarkMode;
  final List<Car> _cars;
  @override
  List<Car> get cars {
    if (_cars is EqualUnmodifiableListView) return _cars;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cars);
  }

  @override
  String toString() {
    return 'SettingsPageState.carsLoaded(isDarkMode: $isDarkMode, cars: $cars)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingsPageCarsLoadedStateImpl &&
            (identical(other.isDarkMode, isDarkMode) ||
                other.isDarkMode == isDarkMode) &&
            const DeepCollectionEquality().equals(other._cars, _cars));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isDarkMode, const DeepCollectionEquality().hash(_cars));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SettingsPageCarsLoadedStateImplCopyWith<_$SettingsPageCarsLoadedStateImpl>
      get copyWith => __$$SettingsPageCarsLoadedStateImplCopyWithImpl<
          _$SettingsPageCarsLoadedStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isDarkMode) loaded,
    required TResult Function(bool isDarkMode) loading,
    required TResult Function(bool isDarkMode, List<Car> cars) carsLoaded,
  }) {
    return carsLoaded(isDarkMode, cars);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isDarkMode)? loaded,
    TResult? Function(bool isDarkMode)? loading,
    TResult? Function(bool isDarkMode, List<Car> cars)? carsLoaded,
  }) {
    return carsLoaded?.call(isDarkMode, cars);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isDarkMode)? loaded,
    TResult Function(bool isDarkMode)? loading,
    TResult Function(bool isDarkMode, List<Car> cars)? carsLoaded,
    required TResult orElse(),
  }) {
    if (carsLoaded != null) {
      return carsLoaded(isDarkMode, cars);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SettingsPageLoadedState value) loaded,
    required TResult Function(SettingsPageLoadingState value) loading,
    required TResult Function(SettingsPageCarsLoadedState value) carsLoaded,
  }) {
    return carsLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SettingsPageLoadedState value)? loaded,
    TResult? Function(SettingsPageLoadingState value)? loading,
    TResult? Function(SettingsPageCarsLoadedState value)? carsLoaded,
  }) {
    return carsLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SettingsPageLoadedState value)? loaded,
    TResult Function(SettingsPageLoadingState value)? loading,
    TResult Function(SettingsPageCarsLoadedState value)? carsLoaded,
    required TResult orElse(),
  }) {
    if (carsLoaded != null) {
      return carsLoaded(this);
    }
    return orElse();
  }
}

abstract class SettingsPageCarsLoadedState implements SettingsPageState {
  const factory SettingsPageCarsLoadedState(
      {final bool isDarkMode,
      required final List<Car> cars}) = _$SettingsPageCarsLoadedStateImpl;

  @override
  bool get isDarkMode;
  List<Car> get cars;
  @override
  @JsonKey(ignore: true)
  _$$SettingsPageCarsLoadedStateImplCopyWith<_$SettingsPageCarsLoadedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
