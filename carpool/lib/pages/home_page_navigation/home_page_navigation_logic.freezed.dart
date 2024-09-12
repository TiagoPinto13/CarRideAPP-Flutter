// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_page_navigation_logic.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomePageNavigationState {
  bool get isDarkMode => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isDarkMode) loading,
    required TResult Function(
            bool isDarkMode,
            List<Ride> activeRidesAsDriver,
            List<Ride> waitingRidesAsDriver,
            List<Ride> expiredRidesAsDriver,
            Map<Ride, int> activeRidesAsPassenger,
            Map<Ride, int> expiredRidesAsPassenger,
            Map<Ride, int> waitingRidesAsPassenger)
        scheduleLoaded,
    required TResult Function(bool isDarkMode, String message) error,
    required TResult Function(bool isDarkMode, List<Ride> rides) metricsLoaded,
    required TResult Function(bool isDarkMode, List<dynamic> chats) chatsLoaded,
    required TResult Function(bool isDarkMode, List<Car> cars) carsLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isDarkMode)? loading,
    TResult? Function(
            bool isDarkMode,
            List<Ride> activeRidesAsDriver,
            List<Ride> waitingRidesAsDriver,
            List<Ride> expiredRidesAsDriver,
            Map<Ride, int> activeRidesAsPassenger,
            Map<Ride, int> expiredRidesAsPassenger,
            Map<Ride, int> waitingRidesAsPassenger)?
        scheduleLoaded,
    TResult? Function(bool isDarkMode, String message)? error,
    TResult? Function(bool isDarkMode, List<Ride> rides)? metricsLoaded,
    TResult? Function(bool isDarkMode, List<dynamic> chats)? chatsLoaded,
    TResult? Function(bool isDarkMode, List<Car> cars)? carsLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isDarkMode)? loading,
    TResult Function(
            bool isDarkMode,
            List<Ride> activeRidesAsDriver,
            List<Ride> waitingRidesAsDriver,
            List<Ride> expiredRidesAsDriver,
            Map<Ride, int> activeRidesAsPassenger,
            Map<Ride, int> expiredRidesAsPassenger,
            Map<Ride, int> waitingRidesAsPassenger)?
        scheduleLoaded,
    TResult Function(bool isDarkMode, String message)? error,
    TResult Function(bool isDarkMode, List<Ride> rides)? metricsLoaded,
    TResult Function(bool isDarkMode, List<dynamic> chats)? chatsLoaded,
    TResult Function(bool isDarkMode, List<Car> cars)? carsLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomePageNavigationLoadingState value) loading,
    required TResult Function(HomePageNavigationScheduleLoadedState value)
        scheduleLoaded,
    required TResult Function(HomePageNavigationErrorState value) error,
    required TResult Function(HomePageNavigationMetricsLoadedState value)
        metricsLoaded,
    required TResult Function(HomePageNavigationChatLoadedState value)
        chatsLoaded,
    required TResult Function(HomePageNavigationCarsLoadedState value)
        carsLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HomePageNavigationLoadingState value)? loading,
    TResult? Function(HomePageNavigationScheduleLoadedState value)?
        scheduleLoaded,
    TResult? Function(HomePageNavigationErrorState value)? error,
    TResult? Function(HomePageNavigationMetricsLoadedState value)?
        metricsLoaded,
    TResult? Function(HomePageNavigationChatLoadedState value)? chatsLoaded,
    TResult? Function(HomePageNavigationCarsLoadedState value)? carsLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomePageNavigationLoadingState value)? loading,
    TResult Function(HomePageNavigationScheduleLoadedState value)?
        scheduleLoaded,
    TResult Function(HomePageNavigationErrorState value)? error,
    TResult Function(HomePageNavigationMetricsLoadedState value)? metricsLoaded,
    TResult Function(HomePageNavigationChatLoadedState value)? chatsLoaded,
    TResult Function(HomePageNavigationCarsLoadedState value)? carsLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomePageNavigationStateCopyWith<HomePageNavigationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomePageNavigationStateCopyWith<$Res> {
  factory $HomePageNavigationStateCopyWith(HomePageNavigationState value,
          $Res Function(HomePageNavigationState) then) =
      _$HomePageNavigationStateCopyWithImpl<$Res, HomePageNavigationState>;
  @useResult
  $Res call({bool isDarkMode});
}

/// @nodoc
class _$HomePageNavigationStateCopyWithImpl<$Res,
        $Val extends HomePageNavigationState>
    implements $HomePageNavigationStateCopyWith<$Res> {
  _$HomePageNavigationStateCopyWithImpl(this._value, this._then);

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
abstract class _$$HomePageNavigationLoadingStateImplCopyWith<$Res>
    implements $HomePageNavigationStateCopyWith<$Res> {
  factory _$$HomePageNavigationLoadingStateImplCopyWith(
          _$HomePageNavigationLoadingStateImpl value,
          $Res Function(_$HomePageNavigationLoadingStateImpl) then) =
      __$$HomePageNavigationLoadingStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isDarkMode});
}

/// @nodoc
class __$$HomePageNavigationLoadingStateImplCopyWithImpl<$Res>
    extends _$HomePageNavigationStateCopyWithImpl<$Res,
        _$HomePageNavigationLoadingStateImpl>
    implements _$$HomePageNavigationLoadingStateImplCopyWith<$Res> {
  __$$HomePageNavigationLoadingStateImplCopyWithImpl(
      _$HomePageNavigationLoadingStateImpl _value,
      $Res Function(_$HomePageNavigationLoadingStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isDarkMode = null,
  }) {
    return _then(_$HomePageNavigationLoadingStateImpl(
      isDarkMode: null == isDarkMode
          ? _value.isDarkMode
          : isDarkMode // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$HomePageNavigationLoadingStateImpl
    implements HomePageNavigationLoadingState {
  const _$HomePageNavigationLoadingStateImpl({this.isDarkMode = false});

  @override
  @JsonKey()
  final bool isDarkMode;

  @override
  String toString() {
    return 'HomePageNavigationState.loading(isDarkMode: $isDarkMode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomePageNavigationLoadingStateImpl &&
            (identical(other.isDarkMode, isDarkMode) ||
                other.isDarkMode == isDarkMode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isDarkMode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomePageNavigationLoadingStateImplCopyWith<
          _$HomePageNavigationLoadingStateImpl>
      get copyWith => __$$HomePageNavigationLoadingStateImplCopyWithImpl<
          _$HomePageNavigationLoadingStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isDarkMode) loading,
    required TResult Function(
            bool isDarkMode,
            List<Ride> activeRidesAsDriver,
            List<Ride> waitingRidesAsDriver,
            List<Ride> expiredRidesAsDriver,
            Map<Ride, int> activeRidesAsPassenger,
            Map<Ride, int> expiredRidesAsPassenger,
            Map<Ride, int> waitingRidesAsPassenger)
        scheduleLoaded,
    required TResult Function(bool isDarkMode, String message) error,
    required TResult Function(bool isDarkMode, List<Ride> rides) metricsLoaded,
    required TResult Function(bool isDarkMode, List<dynamic> chats) chatsLoaded,
    required TResult Function(bool isDarkMode, List<Car> cars) carsLoaded,
  }) {
    return loading(isDarkMode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isDarkMode)? loading,
    TResult? Function(
            bool isDarkMode,
            List<Ride> activeRidesAsDriver,
            List<Ride> waitingRidesAsDriver,
            List<Ride> expiredRidesAsDriver,
            Map<Ride, int> activeRidesAsPassenger,
            Map<Ride, int> expiredRidesAsPassenger,
            Map<Ride, int> waitingRidesAsPassenger)?
        scheduleLoaded,
    TResult? Function(bool isDarkMode, String message)? error,
    TResult? Function(bool isDarkMode, List<Ride> rides)? metricsLoaded,
    TResult? Function(bool isDarkMode, List<dynamic> chats)? chatsLoaded,
    TResult? Function(bool isDarkMode, List<Car> cars)? carsLoaded,
  }) {
    return loading?.call(isDarkMode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isDarkMode)? loading,
    TResult Function(
            bool isDarkMode,
            List<Ride> activeRidesAsDriver,
            List<Ride> waitingRidesAsDriver,
            List<Ride> expiredRidesAsDriver,
            Map<Ride, int> activeRidesAsPassenger,
            Map<Ride, int> expiredRidesAsPassenger,
            Map<Ride, int> waitingRidesAsPassenger)?
        scheduleLoaded,
    TResult Function(bool isDarkMode, String message)? error,
    TResult Function(bool isDarkMode, List<Ride> rides)? metricsLoaded,
    TResult Function(bool isDarkMode, List<dynamic> chats)? chatsLoaded,
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
    required TResult Function(HomePageNavigationLoadingState value) loading,
    required TResult Function(HomePageNavigationScheduleLoadedState value)
        scheduleLoaded,
    required TResult Function(HomePageNavigationErrorState value) error,
    required TResult Function(HomePageNavigationMetricsLoadedState value)
        metricsLoaded,
    required TResult Function(HomePageNavigationChatLoadedState value)
        chatsLoaded,
    required TResult Function(HomePageNavigationCarsLoadedState value)
        carsLoaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HomePageNavigationLoadingState value)? loading,
    TResult? Function(HomePageNavigationScheduleLoadedState value)?
        scheduleLoaded,
    TResult? Function(HomePageNavigationErrorState value)? error,
    TResult? Function(HomePageNavigationMetricsLoadedState value)?
        metricsLoaded,
    TResult? Function(HomePageNavigationChatLoadedState value)? chatsLoaded,
    TResult? Function(HomePageNavigationCarsLoadedState value)? carsLoaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomePageNavigationLoadingState value)? loading,
    TResult Function(HomePageNavigationScheduleLoadedState value)?
        scheduleLoaded,
    TResult Function(HomePageNavigationErrorState value)? error,
    TResult Function(HomePageNavigationMetricsLoadedState value)? metricsLoaded,
    TResult Function(HomePageNavigationChatLoadedState value)? chatsLoaded,
    TResult Function(HomePageNavigationCarsLoadedState value)? carsLoaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class HomePageNavigationLoadingState
    implements HomePageNavigationState {
  const factory HomePageNavigationLoadingState({final bool isDarkMode}) =
      _$HomePageNavigationLoadingStateImpl;

  @override
  bool get isDarkMode;
  @override
  @JsonKey(ignore: true)
  _$$HomePageNavigationLoadingStateImplCopyWith<
          _$HomePageNavigationLoadingStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HomePageNavigationScheduleLoadedStateImplCopyWith<$Res>
    implements $HomePageNavigationStateCopyWith<$Res> {
  factory _$$HomePageNavigationScheduleLoadedStateImplCopyWith(
          _$HomePageNavigationScheduleLoadedStateImpl value,
          $Res Function(_$HomePageNavigationScheduleLoadedStateImpl) then) =
      __$$HomePageNavigationScheduleLoadedStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isDarkMode,
      List<Ride> activeRidesAsDriver,
      List<Ride> waitingRidesAsDriver,
      List<Ride> expiredRidesAsDriver,
      Map<Ride, int> activeRidesAsPassenger,
      Map<Ride, int> expiredRidesAsPassenger,
      Map<Ride, int> waitingRidesAsPassenger});
}

/// @nodoc
class __$$HomePageNavigationScheduleLoadedStateImplCopyWithImpl<$Res>
    extends _$HomePageNavigationStateCopyWithImpl<$Res,
        _$HomePageNavigationScheduleLoadedStateImpl>
    implements _$$HomePageNavigationScheduleLoadedStateImplCopyWith<$Res> {
  __$$HomePageNavigationScheduleLoadedStateImplCopyWithImpl(
      _$HomePageNavigationScheduleLoadedStateImpl _value,
      $Res Function(_$HomePageNavigationScheduleLoadedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isDarkMode = null,
    Object? activeRidesAsDriver = null,
    Object? waitingRidesAsDriver = null,
    Object? expiredRidesAsDriver = null,
    Object? activeRidesAsPassenger = null,
    Object? expiredRidesAsPassenger = null,
    Object? waitingRidesAsPassenger = null,
  }) {
    return _then(_$HomePageNavigationScheduleLoadedStateImpl(
      isDarkMode: null == isDarkMode
          ? _value.isDarkMode
          : isDarkMode // ignore: cast_nullable_to_non_nullable
              as bool,
      activeRidesAsDriver: null == activeRidesAsDriver
          ? _value._activeRidesAsDriver
          : activeRidesAsDriver // ignore: cast_nullable_to_non_nullable
              as List<Ride>,
      waitingRidesAsDriver: null == waitingRidesAsDriver
          ? _value._waitingRidesAsDriver
          : waitingRidesAsDriver // ignore: cast_nullable_to_non_nullable
              as List<Ride>,
      expiredRidesAsDriver: null == expiredRidesAsDriver
          ? _value._expiredRidesAsDriver
          : expiredRidesAsDriver // ignore: cast_nullable_to_non_nullable
              as List<Ride>,
      activeRidesAsPassenger: null == activeRidesAsPassenger
          ? _value._activeRidesAsPassenger
          : activeRidesAsPassenger // ignore: cast_nullable_to_non_nullable
              as Map<Ride, int>,
      expiredRidesAsPassenger: null == expiredRidesAsPassenger
          ? _value._expiredRidesAsPassenger
          : expiredRidesAsPassenger // ignore: cast_nullable_to_non_nullable
              as Map<Ride, int>,
      waitingRidesAsPassenger: null == waitingRidesAsPassenger
          ? _value._waitingRidesAsPassenger
          : waitingRidesAsPassenger // ignore: cast_nullable_to_non_nullable
              as Map<Ride, int>,
    ));
  }
}

/// @nodoc

class _$HomePageNavigationScheduleLoadedStateImpl
    implements HomePageNavigationScheduleLoadedState {
  const _$HomePageNavigationScheduleLoadedStateImpl(
      {this.isDarkMode = false,
      required final List<Ride> activeRidesAsDriver,
      required final List<Ride> waitingRidesAsDriver,
      required final List<Ride> expiredRidesAsDriver,
      required final Map<Ride, int> activeRidesAsPassenger,
      required final Map<Ride, int> expiredRidesAsPassenger,
      required final Map<Ride, int> waitingRidesAsPassenger})
      : _activeRidesAsDriver = activeRidesAsDriver,
        _waitingRidesAsDriver = waitingRidesAsDriver,
        _expiredRidesAsDriver = expiredRidesAsDriver,
        _activeRidesAsPassenger = activeRidesAsPassenger,
        _expiredRidesAsPassenger = expiredRidesAsPassenger,
        _waitingRidesAsPassenger = waitingRidesAsPassenger;

  @override
  @JsonKey()
  final bool isDarkMode;
  final List<Ride> _activeRidesAsDriver;
  @override
  List<Ride> get activeRidesAsDriver {
    if (_activeRidesAsDriver is EqualUnmodifiableListView)
      return _activeRidesAsDriver;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_activeRidesAsDriver);
  }

  final List<Ride> _waitingRidesAsDriver;
  @override
  List<Ride> get waitingRidesAsDriver {
    if (_waitingRidesAsDriver is EqualUnmodifiableListView)
      return _waitingRidesAsDriver;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_waitingRidesAsDriver);
  }

  final List<Ride> _expiredRidesAsDriver;
  @override
  List<Ride> get expiredRidesAsDriver {
    if (_expiredRidesAsDriver is EqualUnmodifiableListView)
      return _expiredRidesAsDriver;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_expiredRidesAsDriver);
  }

  final Map<Ride, int> _activeRidesAsPassenger;
  @override
  Map<Ride, int> get activeRidesAsPassenger {
    if (_activeRidesAsPassenger is EqualUnmodifiableMapView)
      return _activeRidesAsPassenger;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_activeRidesAsPassenger);
  }

  final Map<Ride, int> _expiredRidesAsPassenger;
  @override
  Map<Ride, int> get expiredRidesAsPassenger {
    if (_expiredRidesAsPassenger is EqualUnmodifiableMapView)
      return _expiredRidesAsPassenger;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_expiredRidesAsPassenger);
  }

  final Map<Ride, int> _waitingRidesAsPassenger;
  @override
  Map<Ride, int> get waitingRidesAsPassenger {
    if (_waitingRidesAsPassenger is EqualUnmodifiableMapView)
      return _waitingRidesAsPassenger;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_waitingRidesAsPassenger);
  }

  @override
  String toString() {
    return 'HomePageNavigationState.scheduleLoaded(isDarkMode: $isDarkMode, activeRidesAsDriver: $activeRidesAsDriver, waitingRidesAsDriver: $waitingRidesAsDriver, expiredRidesAsDriver: $expiredRidesAsDriver, activeRidesAsPassenger: $activeRidesAsPassenger, expiredRidesAsPassenger: $expiredRidesAsPassenger, waitingRidesAsPassenger: $waitingRidesAsPassenger)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomePageNavigationScheduleLoadedStateImpl &&
            (identical(other.isDarkMode, isDarkMode) ||
                other.isDarkMode == isDarkMode) &&
            const DeepCollectionEquality()
                .equals(other._activeRidesAsDriver, _activeRidesAsDriver) &&
            const DeepCollectionEquality()
                .equals(other._waitingRidesAsDriver, _waitingRidesAsDriver) &&
            const DeepCollectionEquality()
                .equals(other._expiredRidesAsDriver, _expiredRidesAsDriver) &&
            const DeepCollectionEquality().equals(
                other._activeRidesAsPassenger, _activeRidesAsPassenger) &&
            const DeepCollectionEquality().equals(
                other._expiredRidesAsPassenger, _expiredRidesAsPassenger) &&
            const DeepCollectionEquality().equals(
                other._waitingRidesAsPassenger, _waitingRidesAsPassenger));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isDarkMode,
      const DeepCollectionEquality().hash(_activeRidesAsDriver),
      const DeepCollectionEquality().hash(_waitingRidesAsDriver),
      const DeepCollectionEquality().hash(_expiredRidesAsDriver),
      const DeepCollectionEquality().hash(_activeRidesAsPassenger),
      const DeepCollectionEquality().hash(_expiredRidesAsPassenger),
      const DeepCollectionEquality().hash(_waitingRidesAsPassenger));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomePageNavigationScheduleLoadedStateImplCopyWith<
          _$HomePageNavigationScheduleLoadedStateImpl>
      get copyWith => __$$HomePageNavigationScheduleLoadedStateImplCopyWithImpl<
          _$HomePageNavigationScheduleLoadedStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isDarkMode) loading,
    required TResult Function(
            bool isDarkMode,
            List<Ride> activeRidesAsDriver,
            List<Ride> waitingRidesAsDriver,
            List<Ride> expiredRidesAsDriver,
            Map<Ride, int> activeRidesAsPassenger,
            Map<Ride, int> expiredRidesAsPassenger,
            Map<Ride, int> waitingRidesAsPassenger)
        scheduleLoaded,
    required TResult Function(bool isDarkMode, String message) error,
    required TResult Function(bool isDarkMode, List<Ride> rides) metricsLoaded,
    required TResult Function(bool isDarkMode, List<dynamic> chats) chatsLoaded,
    required TResult Function(bool isDarkMode, List<Car> cars) carsLoaded,
  }) {
    return scheduleLoaded(
        isDarkMode,
        activeRidesAsDriver,
        waitingRidesAsDriver,
        expiredRidesAsDriver,
        activeRidesAsPassenger,
        expiredRidesAsPassenger,
        waitingRidesAsPassenger);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isDarkMode)? loading,
    TResult? Function(
            bool isDarkMode,
            List<Ride> activeRidesAsDriver,
            List<Ride> waitingRidesAsDriver,
            List<Ride> expiredRidesAsDriver,
            Map<Ride, int> activeRidesAsPassenger,
            Map<Ride, int> expiredRidesAsPassenger,
            Map<Ride, int> waitingRidesAsPassenger)?
        scheduleLoaded,
    TResult? Function(bool isDarkMode, String message)? error,
    TResult? Function(bool isDarkMode, List<Ride> rides)? metricsLoaded,
    TResult? Function(bool isDarkMode, List<dynamic> chats)? chatsLoaded,
    TResult? Function(bool isDarkMode, List<Car> cars)? carsLoaded,
  }) {
    return scheduleLoaded?.call(
        isDarkMode,
        activeRidesAsDriver,
        waitingRidesAsDriver,
        expiredRidesAsDriver,
        activeRidesAsPassenger,
        expiredRidesAsPassenger,
        waitingRidesAsPassenger);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isDarkMode)? loading,
    TResult Function(
            bool isDarkMode,
            List<Ride> activeRidesAsDriver,
            List<Ride> waitingRidesAsDriver,
            List<Ride> expiredRidesAsDriver,
            Map<Ride, int> activeRidesAsPassenger,
            Map<Ride, int> expiredRidesAsPassenger,
            Map<Ride, int> waitingRidesAsPassenger)?
        scheduleLoaded,
    TResult Function(bool isDarkMode, String message)? error,
    TResult Function(bool isDarkMode, List<Ride> rides)? metricsLoaded,
    TResult Function(bool isDarkMode, List<dynamic> chats)? chatsLoaded,
    TResult Function(bool isDarkMode, List<Car> cars)? carsLoaded,
    required TResult orElse(),
  }) {
    if (scheduleLoaded != null) {
      return scheduleLoaded(
          isDarkMode,
          activeRidesAsDriver,
          waitingRidesAsDriver,
          expiredRidesAsDriver,
          activeRidesAsPassenger,
          expiredRidesAsPassenger,
          waitingRidesAsPassenger);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomePageNavigationLoadingState value) loading,
    required TResult Function(HomePageNavigationScheduleLoadedState value)
        scheduleLoaded,
    required TResult Function(HomePageNavigationErrorState value) error,
    required TResult Function(HomePageNavigationMetricsLoadedState value)
        metricsLoaded,
    required TResult Function(HomePageNavigationChatLoadedState value)
        chatsLoaded,
    required TResult Function(HomePageNavigationCarsLoadedState value)
        carsLoaded,
  }) {
    return scheduleLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HomePageNavigationLoadingState value)? loading,
    TResult? Function(HomePageNavigationScheduleLoadedState value)?
        scheduleLoaded,
    TResult? Function(HomePageNavigationErrorState value)? error,
    TResult? Function(HomePageNavigationMetricsLoadedState value)?
        metricsLoaded,
    TResult? Function(HomePageNavigationChatLoadedState value)? chatsLoaded,
    TResult? Function(HomePageNavigationCarsLoadedState value)? carsLoaded,
  }) {
    return scheduleLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomePageNavigationLoadingState value)? loading,
    TResult Function(HomePageNavigationScheduleLoadedState value)?
        scheduleLoaded,
    TResult Function(HomePageNavigationErrorState value)? error,
    TResult Function(HomePageNavigationMetricsLoadedState value)? metricsLoaded,
    TResult Function(HomePageNavigationChatLoadedState value)? chatsLoaded,
    TResult Function(HomePageNavigationCarsLoadedState value)? carsLoaded,
    required TResult orElse(),
  }) {
    if (scheduleLoaded != null) {
      return scheduleLoaded(this);
    }
    return orElse();
  }
}

abstract class HomePageNavigationScheduleLoadedState
    implements HomePageNavigationState {
  const factory HomePageNavigationScheduleLoadedState(
          {final bool isDarkMode,
          required final List<Ride> activeRidesAsDriver,
          required final List<Ride> waitingRidesAsDriver,
          required final List<Ride> expiredRidesAsDriver,
          required final Map<Ride, int> activeRidesAsPassenger,
          required final Map<Ride, int> expiredRidesAsPassenger,
          required final Map<Ride, int> waitingRidesAsPassenger}) =
      _$HomePageNavigationScheduleLoadedStateImpl;

  @override
  bool get isDarkMode;
  List<Ride> get activeRidesAsDriver;
  List<Ride> get waitingRidesAsDriver;
  List<Ride> get expiredRidesAsDriver;
  Map<Ride, int> get activeRidesAsPassenger;
  Map<Ride, int> get expiredRidesAsPassenger;
  Map<Ride, int> get waitingRidesAsPassenger;
  @override
  @JsonKey(ignore: true)
  _$$HomePageNavigationScheduleLoadedStateImplCopyWith<
          _$HomePageNavigationScheduleLoadedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HomePageNavigationErrorStateImplCopyWith<$Res>
    implements $HomePageNavigationStateCopyWith<$Res> {
  factory _$$HomePageNavigationErrorStateImplCopyWith(
          _$HomePageNavigationErrorStateImpl value,
          $Res Function(_$HomePageNavigationErrorStateImpl) then) =
      __$$HomePageNavigationErrorStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isDarkMode, String message});
}

/// @nodoc
class __$$HomePageNavigationErrorStateImplCopyWithImpl<$Res>
    extends _$HomePageNavigationStateCopyWithImpl<$Res,
        _$HomePageNavigationErrorStateImpl>
    implements _$$HomePageNavigationErrorStateImplCopyWith<$Res> {
  __$$HomePageNavigationErrorStateImplCopyWithImpl(
      _$HomePageNavigationErrorStateImpl _value,
      $Res Function(_$HomePageNavigationErrorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isDarkMode = null,
    Object? message = null,
  }) {
    return _then(_$HomePageNavigationErrorStateImpl(
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

class _$HomePageNavigationErrorStateImpl
    implements HomePageNavigationErrorState {
  const _$HomePageNavigationErrorStateImpl(
      {this.isDarkMode = false, required this.message});

  @override
  @JsonKey()
  final bool isDarkMode;
  @override
  final String message;

  @override
  String toString() {
    return 'HomePageNavigationState.error(isDarkMode: $isDarkMode, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomePageNavigationErrorStateImpl &&
            (identical(other.isDarkMode, isDarkMode) ||
                other.isDarkMode == isDarkMode) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isDarkMode, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomePageNavigationErrorStateImplCopyWith<
          _$HomePageNavigationErrorStateImpl>
      get copyWith => __$$HomePageNavigationErrorStateImplCopyWithImpl<
          _$HomePageNavigationErrorStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isDarkMode) loading,
    required TResult Function(
            bool isDarkMode,
            List<Ride> activeRidesAsDriver,
            List<Ride> waitingRidesAsDriver,
            List<Ride> expiredRidesAsDriver,
            Map<Ride, int> activeRidesAsPassenger,
            Map<Ride, int> expiredRidesAsPassenger,
            Map<Ride, int> waitingRidesAsPassenger)
        scheduleLoaded,
    required TResult Function(bool isDarkMode, String message) error,
    required TResult Function(bool isDarkMode, List<Ride> rides) metricsLoaded,
    required TResult Function(bool isDarkMode, List<dynamic> chats) chatsLoaded,
    required TResult Function(bool isDarkMode, List<Car> cars) carsLoaded,
  }) {
    return error(isDarkMode, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isDarkMode)? loading,
    TResult? Function(
            bool isDarkMode,
            List<Ride> activeRidesAsDriver,
            List<Ride> waitingRidesAsDriver,
            List<Ride> expiredRidesAsDriver,
            Map<Ride, int> activeRidesAsPassenger,
            Map<Ride, int> expiredRidesAsPassenger,
            Map<Ride, int> waitingRidesAsPassenger)?
        scheduleLoaded,
    TResult? Function(bool isDarkMode, String message)? error,
    TResult? Function(bool isDarkMode, List<Ride> rides)? metricsLoaded,
    TResult? Function(bool isDarkMode, List<dynamic> chats)? chatsLoaded,
    TResult? Function(bool isDarkMode, List<Car> cars)? carsLoaded,
  }) {
    return error?.call(isDarkMode, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isDarkMode)? loading,
    TResult Function(
            bool isDarkMode,
            List<Ride> activeRidesAsDriver,
            List<Ride> waitingRidesAsDriver,
            List<Ride> expiredRidesAsDriver,
            Map<Ride, int> activeRidesAsPassenger,
            Map<Ride, int> expiredRidesAsPassenger,
            Map<Ride, int> waitingRidesAsPassenger)?
        scheduleLoaded,
    TResult Function(bool isDarkMode, String message)? error,
    TResult Function(bool isDarkMode, List<Ride> rides)? metricsLoaded,
    TResult Function(bool isDarkMode, List<dynamic> chats)? chatsLoaded,
    TResult Function(bool isDarkMode, List<Car> cars)? carsLoaded,
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
    required TResult Function(HomePageNavigationLoadingState value) loading,
    required TResult Function(HomePageNavigationScheduleLoadedState value)
        scheduleLoaded,
    required TResult Function(HomePageNavigationErrorState value) error,
    required TResult Function(HomePageNavigationMetricsLoadedState value)
        metricsLoaded,
    required TResult Function(HomePageNavigationChatLoadedState value)
        chatsLoaded,
    required TResult Function(HomePageNavigationCarsLoadedState value)
        carsLoaded,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HomePageNavigationLoadingState value)? loading,
    TResult? Function(HomePageNavigationScheduleLoadedState value)?
        scheduleLoaded,
    TResult? Function(HomePageNavigationErrorState value)? error,
    TResult? Function(HomePageNavigationMetricsLoadedState value)?
        metricsLoaded,
    TResult? Function(HomePageNavigationChatLoadedState value)? chatsLoaded,
    TResult? Function(HomePageNavigationCarsLoadedState value)? carsLoaded,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomePageNavigationLoadingState value)? loading,
    TResult Function(HomePageNavigationScheduleLoadedState value)?
        scheduleLoaded,
    TResult Function(HomePageNavigationErrorState value)? error,
    TResult Function(HomePageNavigationMetricsLoadedState value)? metricsLoaded,
    TResult Function(HomePageNavigationChatLoadedState value)? chatsLoaded,
    TResult Function(HomePageNavigationCarsLoadedState value)? carsLoaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class HomePageNavigationErrorState implements HomePageNavigationState {
  const factory HomePageNavigationErrorState(
      {final bool isDarkMode,
      required final String message}) = _$HomePageNavigationErrorStateImpl;

  @override
  bool get isDarkMode;
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$HomePageNavigationErrorStateImplCopyWith<
          _$HomePageNavigationErrorStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HomePageNavigationMetricsLoadedStateImplCopyWith<$Res>
    implements $HomePageNavigationStateCopyWith<$Res> {
  factory _$$HomePageNavigationMetricsLoadedStateImplCopyWith(
          _$HomePageNavigationMetricsLoadedStateImpl value,
          $Res Function(_$HomePageNavigationMetricsLoadedStateImpl) then) =
      __$$HomePageNavigationMetricsLoadedStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isDarkMode, List<Ride> rides});
}

/// @nodoc
class __$$HomePageNavigationMetricsLoadedStateImplCopyWithImpl<$Res>
    extends _$HomePageNavigationStateCopyWithImpl<$Res,
        _$HomePageNavigationMetricsLoadedStateImpl>
    implements _$$HomePageNavigationMetricsLoadedStateImplCopyWith<$Res> {
  __$$HomePageNavigationMetricsLoadedStateImplCopyWithImpl(
      _$HomePageNavigationMetricsLoadedStateImpl _value,
      $Res Function(_$HomePageNavigationMetricsLoadedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isDarkMode = null,
    Object? rides = null,
  }) {
    return _then(_$HomePageNavigationMetricsLoadedStateImpl(
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

class _$HomePageNavigationMetricsLoadedStateImpl
    implements HomePageNavigationMetricsLoadedState {
  const _$HomePageNavigationMetricsLoadedStateImpl(
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
    return 'HomePageNavigationState.metricsLoaded(isDarkMode: $isDarkMode, rides: $rides)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomePageNavigationMetricsLoadedStateImpl &&
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
  _$$HomePageNavigationMetricsLoadedStateImplCopyWith<
          _$HomePageNavigationMetricsLoadedStateImpl>
      get copyWith => __$$HomePageNavigationMetricsLoadedStateImplCopyWithImpl<
          _$HomePageNavigationMetricsLoadedStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isDarkMode) loading,
    required TResult Function(
            bool isDarkMode,
            List<Ride> activeRidesAsDriver,
            List<Ride> waitingRidesAsDriver,
            List<Ride> expiredRidesAsDriver,
            Map<Ride, int> activeRidesAsPassenger,
            Map<Ride, int> expiredRidesAsPassenger,
            Map<Ride, int> waitingRidesAsPassenger)
        scheduleLoaded,
    required TResult Function(bool isDarkMode, String message) error,
    required TResult Function(bool isDarkMode, List<Ride> rides) metricsLoaded,
    required TResult Function(bool isDarkMode, List<dynamic> chats) chatsLoaded,
    required TResult Function(bool isDarkMode, List<Car> cars) carsLoaded,
  }) {
    return metricsLoaded(isDarkMode, rides);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isDarkMode)? loading,
    TResult? Function(
            bool isDarkMode,
            List<Ride> activeRidesAsDriver,
            List<Ride> waitingRidesAsDriver,
            List<Ride> expiredRidesAsDriver,
            Map<Ride, int> activeRidesAsPassenger,
            Map<Ride, int> expiredRidesAsPassenger,
            Map<Ride, int> waitingRidesAsPassenger)?
        scheduleLoaded,
    TResult? Function(bool isDarkMode, String message)? error,
    TResult? Function(bool isDarkMode, List<Ride> rides)? metricsLoaded,
    TResult? Function(bool isDarkMode, List<dynamic> chats)? chatsLoaded,
    TResult? Function(bool isDarkMode, List<Car> cars)? carsLoaded,
  }) {
    return metricsLoaded?.call(isDarkMode, rides);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isDarkMode)? loading,
    TResult Function(
            bool isDarkMode,
            List<Ride> activeRidesAsDriver,
            List<Ride> waitingRidesAsDriver,
            List<Ride> expiredRidesAsDriver,
            Map<Ride, int> activeRidesAsPassenger,
            Map<Ride, int> expiredRidesAsPassenger,
            Map<Ride, int> waitingRidesAsPassenger)?
        scheduleLoaded,
    TResult Function(bool isDarkMode, String message)? error,
    TResult Function(bool isDarkMode, List<Ride> rides)? metricsLoaded,
    TResult Function(bool isDarkMode, List<dynamic> chats)? chatsLoaded,
    TResult Function(bool isDarkMode, List<Car> cars)? carsLoaded,
    required TResult orElse(),
  }) {
    if (metricsLoaded != null) {
      return metricsLoaded(isDarkMode, rides);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomePageNavigationLoadingState value) loading,
    required TResult Function(HomePageNavigationScheduleLoadedState value)
        scheduleLoaded,
    required TResult Function(HomePageNavigationErrorState value) error,
    required TResult Function(HomePageNavigationMetricsLoadedState value)
        metricsLoaded,
    required TResult Function(HomePageNavigationChatLoadedState value)
        chatsLoaded,
    required TResult Function(HomePageNavigationCarsLoadedState value)
        carsLoaded,
  }) {
    return metricsLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HomePageNavigationLoadingState value)? loading,
    TResult? Function(HomePageNavigationScheduleLoadedState value)?
        scheduleLoaded,
    TResult? Function(HomePageNavigationErrorState value)? error,
    TResult? Function(HomePageNavigationMetricsLoadedState value)?
        metricsLoaded,
    TResult? Function(HomePageNavigationChatLoadedState value)? chatsLoaded,
    TResult? Function(HomePageNavigationCarsLoadedState value)? carsLoaded,
  }) {
    return metricsLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomePageNavigationLoadingState value)? loading,
    TResult Function(HomePageNavigationScheduleLoadedState value)?
        scheduleLoaded,
    TResult Function(HomePageNavigationErrorState value)? error,
    TResult Function(HomePageNavigationMetricsLoadedState value)? metricsLoaded,
    TResult Function(HomePageNavigationChatLoadedState value)? chatsLoaded,
    TResult Function(HomePageNavigationCarsLoadedState value)? carsLoaded,
    required TResult orElse(),
  }) {
    if (metricsLoaded != null) {
      return metricsLoaded(this);
    }
    return orElse();
  }
}

abstract class HomePageNavigationMetricsLoadedState
    implements HomePageNavigationState {
  const factory HomePageNavigationMetricsLoadedState(
          {final bool isDarkMode, required final List<Ride> rides}) =
      _$HomePageNavigationMetricsLoadedStateImpl;

  @override
  bool get isDarkMode;
  List<Ride> get rides;
  @override
  @JsonKey(ignore: true)
  _$$HomePageNavigationMetricsLoadedStateImplCopyWith<
          _$HomePageNavigationMetricsLoadedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HomePageNavigationChatLoadedStateImplCopyWith<$Res>
    implements $HomePageNavigationStateCopyWith<$Res> {
  factory _$$HomePageNavigationChatLoadedStateImplCopyWith(
          _$HomePageNavigationChatLoadedStateImpl value,
          $Res Function(_$HomePageNavigationChatLoadedStateImpl) then) =
      __$$HomePageNavigationChatLoadedStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isDarkMode, List<dynamic> chats});
}

/// @nodoc
class __$$HomePageNavigationChatLoadedStateImplCopyWithImpl<$Res>
    extends _$HomePageNavigationStateCopyWithImpl<$Res,
        _$HomePageNavigationChatLoadedStateImpl>
    implements _$$HomePageNavigationChatLoadedStateImplCopyWith<$Res> {
  __$$HomePageNavigationChatLoadedStateImplCopyWithImpl(
      _$HomePageNavigationChatLoadedStateImpl _value,
      $Res Function(_$HomePageNavigationChatLoadedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isDarkMode = null,
    Object? chats = null,
  }) {
    return _then(_$HomePageNavigationChatLoadedStateImpl(
      isDarkMode: null == isDarkMode
          ? _value.isDarkMode
          : isDarkMode // ignore: cast_nullable_to_non_nullable
              as bool,
      chats: null == chats
          ? _value._chats
          : chats // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc

class _$HomePageNavigationChatLoadedStateImpl
    implements HomePageNavigationChatLoadedState {
  const _$HomePageNavigationChatLoadedStateImpl(
      {this.isDarkMode = false, required final List<dynamic> chats})
      : _chats = chats;

  @override
  @JsonKey()
  final bool isDarkMode;
  final List<dynamic> _chats;
  @override
  List<dynamic> get chats {
    if (_chats is EqualUnmodifiableListView) return _chats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chats);
  }

  @override
  String toString() {
    return 'HomePageNavigationState.chatsLoaded(isDarkMode: $isDarkMode, chats: $chats)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomePageNavigationChatLoadedStateImpl &&
            (identical(other.isDarkMode, isDarkMode) ||
                other.isDarkMode == isDarkMode) &&
            const DeepCollectionEquality().equals(other._chats, _chats));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isDarkMode, const DeepCollectionEquality().hash(_chats));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomePageNavigationChatLoadedStateImplCopyWith<
          _$HomePageNavigationChatLoadedStateImpl>
      get copyWith => __$$HomePageNavigationChatLoadedStateImplCopyWithImpl<
          _$HomePageNavigationChatLoadedStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isDarkMode) loading,
    required TResult Function(
            bool isDarkMode,
            List<Ride> activeRidesAsDriver,
            List<Ride> waitingRidesAsDriver,
            List<Ride> expiredRidesAsDriver,
            Map<Ride, int> activeRidesAsPassenger,
            Map<Ride, int> expiredRidesAsPassenger,
            Map<Ride, int> waitingRidesAsPassenger)
        scheduleLoaded,
    required TResult Function(bool isDarkMode, String message) error,
    required TResult Function(bool isDarkMode, List<Ride> rides) metricsLoaded,
    required TResult Function(bool isDarkMode, List<dynamic> chats) chatsLoaded,
    required TResult Function(bool isDarkMode, List<Car> cars) carsLoaded,
  }) {
    return chatsLoaded(isDarkMode, chats);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isDarkMode)? loading,
    TResult? Function(
            bool isDarkMode,
            List<Ride> activeRidesAsDriver,
            List<Ride> waitingRidesAsDriver,
            List<Ride> expiredRidesAsDriver,
            Map<Ride, int> activeRidesAsPassenger,
            Map<Ride, int> expiredRidesAsPassenger,
            Map<Ride, int> waitingRidesAsPassenger)?
        scheduleLoaded,
    TResult? Function(bool isDarkMode, String message)? error,
    TResult? Function(bool isDarkMode, List<Ride> rides)? metricsLoaded,
    TResult? Function(bool isDarkMode, List<dynamic> chats)? chatsLoaded,
    TResult? Function(bool isDarkMode, List<Car> cars)? carsLoaded,
  }) {
    return chatsLoaded?.call(isDarkMode, chats);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isDarkMode)? loading,
    TResult Function(
            bool isDarkMode,
            List<Ride> activeRidesAsDriver,
            List<Ride> waitingRidesAsDriver,
            List<Ride> expiredRidesAsDriver,
            Map<Ride, int> activeRidesAsPassenger,
            Map<Ride, int> expiredRidesAsPassenger,
            Map<Ride, int> waitingRidesAsPassenger)?
        scheduleLoaded,
    TResult Function(bool isDarkMode, String message)? error,
    TResult Function(bool isDarkMode, List<Ride> rides)? metricsLoaded,
    TResult Function(bool isDarkMode, List<dynamic> chats)? chatsLoaded,
    TResult Function(bool isDarkMode, List<Car> cars)? carsLoaded,
    required TResult orElse(),
  }) {
    if (chatsLoaded != null) {
      return chatsLoaded(isDarkMode, chats);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomePageNavigationLoadingState value) loading,
    required TResult Function(HomePageNavigationScheduleLoadedState value)
        scheduleLoaded,
    required TResult Function(HomePageNavigationErrorState value) error,
    required TResult Function(HomePageNavigationMetricsLoadedState value)
        metricsLoaded,
    required TResult Function(HomePageNavigationChatLoadedState value)
        chatsLoaded,
    required TResult Function(HomePageNavigationCarsLoadedState value)
        carsLoaded,
  }) {
    return chatsLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HomePageNavigationLoadingState value)? loading,
    TResult? Function(HomePageNavigationScheduleLoadedState value)?
        scheduleLoaded,
    TResult? Function(HomePageNavigationErrorState value)? error,
    TResult? Function(HomePageNavigationMetricsLoadedState value)?
        metricsLoaded,
    TResult? Function(HomePageNavigationChatLoadedState value)? chatsLoaded,
    TResult? Function(HomePageNavigationCarsLoadedState value)? carsLoaded,
  }) {
    return chatsLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomePageNavigationLoadingState value)? loading,
    TResult Function(HomePageNavigationScheduleLoadedState value)?
        scheduleLoaded,
    TResult Function(HomePageNavigationErrorState value)? error,
    TResult Function(HomePageNavigationMetricsLoadedState value)? metricsLoaded,
    TResult Function(HomePageNavigationChatLoadedState value)? chatsLoaded,
    TResult Function(HomePageNavigationCarsLoadedState value)? carsLoaded,
    required TResult orElse(),
  }) {
    if (chatsLoaded != null) {
      return chatsLoaded(this);
    }
    return orElse();
  }
}

abstract class HomePageNavigationChatLoadedState
    implements HomePageNavigationState {
  const factory HomePageNavigationChatLoadedState(
          {final bool isDarkMode, required final List<dynamic> chats}) =
      _$HomePageNavigationChatLoadedStateImpl;

  @override
  bool get isDarkMode;
  List<dynamic> get chats;
  @override
  @JsonKey(ignore: true)
  _$$HomePageNavigationChatLoadedStateImplCopyWith<
          _$HomePageNavigationChatLoadedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HomePageNavigationCarsLoadedStateImplCopyWith<$Res>
    implements $HomePageNavigationStateCopyWith<$Res> {
  factory _$$HomePageNavigationCarsLoadedStateImplCopyWith(
          _$HomePageNavigationCarsLoadedStateImpl value,
          $Res Function(_$HomePageNavigationCarsLoadedStateImpl) then) =
      __$$HomePageNavigationCarsLoadedStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isDarkMode, List<Car> cars});
}

/// @nodoc
class __$$HomePageNavigationCarsLoadedStateImplCopyWithImpl<$Res>
    extends _$HomePageNavigationStateCopyWithImpl<$Res,
        _$HomePageNavigationCarsLoadedStateImpl>
    implements _$$HomePageNavigationCarsLoadedStateImplCopyWith<$Res> {
  __$$HomePageNavigationCarsLoadedStateImplCopyWithImpl(
      _$HomePageNavigationCarsLoadedStateImpl _value,
      $Res Function(_$HomePageNavigationCarsLoadedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isDarkMode = null,
    Object? cars = null,
  }) {
    return _then(_$HomePageNavigationCarsLoadedStateImpl(
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

class _$HomePageNavigationCarsLoadedStateImpl
    implements HomePageNavigationCarsLoadedState {
  const _$HomePageNavigationCarsLoadedStateImpl(
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
    return 'HomePageNavigationState.carsLoaded(isDarkMode: $isDarkMode, cars: $cars)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomePageNavigationCarsLoadedStateImpl &&
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
  _$$HomePageNavigationCarsLoadedStateImplCopyWith<
          _$HomePageNavigationCarsLoadedStateImpl>
      get copyWith => __$$HomePageNavigationCarsLoadedStateImplCopyWithImpl<
          _$HomePageNavigationCarsLoadedStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isDarkMode) loading,
    required TResult Function(
            bool isDarkMode,
            List<Ride> activeRidesAsDriver,
            List<Ride> waitingRidesAsDriver,
            List<Ride> expiredRidesAsDriver,
            Map<Ride, int> activeRidesAsPassenger,
            Map<Ride, int> expiredRidesAsPassenger,
            Map<Ride, int> waitingRidesAsPassenger)
        scheduleLoaded,
    required TResult Function(bool isDarkMode, String message) error,
    required TResult Function(bool isDarkMode, List<Ride> rides) metricsLoaded,
    required TResult Function(bool isDarkMode, List<dynamic> chats) chatsLoaded,
    required TResult Function(bool isDarkMode, List<Car> cars) carsLoaded,
  }) {
    return carsLoaded(isDarkMode, cars);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isDarkMode)? loading,
    TResult? Function(
            bool isDarkMode,
            List<Ride> activeRidesAsDriver,
            List<Ride> waitingRidesAsDriver,
            List<Ride> expiredRidesAsDriver,
            Map<Ride, int> activeRidesAsPassenger,
            Map<Ride, int> expiredRidesAsPassenger,
            Map<Ride, int> waitingRidesAsPassenger)?
        scheduleLoaded,
    TResult? Function(bool isDarkMode, String message)? error,
    TResult? Function(bool isDarkMode, List<Ride> rides)? metricsLoaded,
    TResult? Function(bool isDarkMode, List<dynamic> chats)? chatsLoaded,
    TResult? Function(bool isDarkMode, List<Car> cars)? carsLoaded,
  }) {
    return carsLoaded?.call(isDarkMode, cars);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isDarkMode)? loading,
    TResult Function(
            bool isDarkMode,
            List<Ride> activeRidesAsDriver,
            List<Ride> waitingRidesAsDriver,
            List<Ride> expiredRidesAsDriver,
            Map<Ride, int> activeRidesAsPassenger,
            Map<Ride, int> expiredRidesAsPassenger,
            Map<Ride, int> waitingRidesAsPassenger)?
        scheduleLoaded,
    TResult Function(bool isDarkMode, String message)? error,
    TResult Function(bool isDarkMode, List<Ride> rides)? metricsLoaded,
    TResult Function(bool isDarkMode, List<dynamic> chats)? chatsLoaded,
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
    required TResult Function(HomePageNavigationLoadingState value) loading,
    required TResult Function(HomePageNavigationScheduleLoadedState value)
        scheduleLoaded,
    required TResult Function(HomePageNavigationErrorState value) error,
    required TResult Function(HomePageNavigationMetricsLoadedState value)
        metricsLoaded,
    required TResult Function(HomePageNavigationChatLoadedState value)
        chatsLoaded,
    required TResult Function(HomePageNavigationCarsLoadedState value)
        carsLoaded,
  }) {
    return carsLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HomePageNavigationLoadingState value)? loading,
    TResult? Function(HomePageNavigationScheduleLoadedState value)?
        scheduleLoaded,
    TResult? Function(HomePageNavigationErrorState value)? error,
    TResult? Function(HomePageNavigationMetricsLoadedState value)?
        metricsLoaded,
    TResult? Function(HomePageNavigationChatLoadedState value)? chatsLoaded,
    TResult? Function(HomePageNavigationCarsLoadedState value)? carsLoaded,
  }) {
    return carsLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomePageNavigationLoadingState value)? loading,
    TResult Function(HomePageNavigationScheduleLoadedState value)?
        scheduleLoaded,
    TResult Function(HomePageNavigationErrorState value)? error,
    TResult Function(HomePageNavigationMetricsLoadedState value)? metricsLoaded,
    TResult Function(HomePageNavigationChatLoadedState value)? chatsLoaded,
    TResult Function(HomePageNavigationCarsLoadedState value)? carsLoaded,
    required TResult orElse(),
  }) {
    if (carsLoaded != null) {
      return carsLoaded(this);
    }
    return orElse();
  }
}

abstract class HomePageNavigationCarsLoadedState
    implements HomePageNavigationState {
  const factory HomePageNavigationCarsLoadedState(
      {final bool isDarkMode,
      required final List<Car> cars}) = _$HomePageNavigationCarsLoadedStateImpl;

  @override
  bool get isDarkMode;
  List<Car> get cars;
  @override
  @JsonKey(ignore: true)
  _$$HomePageNavigationCarsLoadedStateImplCopyWith<
          _$HomePageNavigationCarsLoadedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
