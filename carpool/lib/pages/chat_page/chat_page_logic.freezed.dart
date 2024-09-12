// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_page_logic.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChatPageState {
  bool get isDarkMode => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isDarkMode) loading,
    required TResult Function(bool isDarkMode) error,
    required TResult Function(bool isDarkMode, List<dynamic> messages) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isDarkMode)? loading,
    TResult? Function(bool isDarkMode)? error,
    TResult? Function(bool isDarkMode, List<dynamic> messages)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isDarkMode)? loading,
    TResult Function(bool isDarkMode)? error,
    TResult Function(bool isDarkMode, List<dynamic> messages)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChatPageLoadingState value) loading,
    required TResult Function(ChatPageErrorState value) error,
    required TResult Function(ChatPageLoadedState value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChatPageLoadingState value)? loading,
    TResult? Function(ChatPageErrorState value)? error,
    TResult? Function(ChatPageLoadedState value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChatPageLoadingState value)? loading,
    TResult Function(ChatPageErrorState value)? error,
    TResult Function(ChatPageLoadedState value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChatPageStateCopyWith<ChatPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatPageStateCopyWith<$Res> {
  factory $ChatPageStateCopyWith(
          ChatPageState value, $Res Function(ChatPageState) then) =
      _$ChatPageStateCopyWithImpl<$Res, ChatPageState>;
  @useResult
  $Res call({bool isDarkMode});
}

/// @nodoc
class _$ChatPageStateCopyWithImpl<$Res, $Val extends ChatPageState>
    implements $ChatPageStateCopyWith<$Res> {
  _$ChatPageStateCopyWithImpl(this._value, this._then);

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
abstract class _$$ChatPageLoadingStateImplCopyWith<$Res>
    implements $ChatPageStateCopyWith<$Res> {
  factory _$$ChatPageLoadingStateImplCopyWith(_$ChatPageLoadingStateImpl value,
          $Res Function(_$ChatPageLoadingStateImpl) then) =
      __$$ChatPageLoadingStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isDarkMode});
}

/// @nodoc
class __$$ChatPageLoadingStateImplCopyWithImpl<$Res>
    extends _$ChatPageStateCopyWithImpl<$Res, _$ChatPageLoadingStateImpl>
    implements _$$ChatPageLoadingStateImplCopyWith<$Res> {
  __$$ChatPageLoadingStateImplCopyWithImpl(_$ChatPageLoadingStateImpl _value,
      $Res Function(_$ChatPageLoadingStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isDarkMode = null,
  }) {
    return _then(_$ChatPageLoadingStateImpl(
      isDarkMode: null == isDarkMode
          ? _value.isDarkMode
          : isDarkMode // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ChatPageLoadingStateImpl implements ChatPageLoadingState {
  const _$ChatPageLoadingStateImpl({this.isDarkMode = false});

  @override
  @JsonKey()
  final bool isDarkMode;

  @override
  String toString() {
    return 'ChatPageState.loading(isDarkMode: $isDarkMode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatPageLoadingStateImpl &&
            (identical(other.isDarkMode, isDarkMode) ||
                other.isDarkMode == isDarkMode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isDarkMode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatPageLoadingStateImplCopyWith<_$ChatPageLoadingStateImpl>
      get copyWith =>
          __$$ChatPageLoadingStateImplCopyWithImpl<_$ChatPageLoadingStateImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isDarkMode) loading,
    required TResult Function(bool isDarkMode) error,
    required TResult Function(bool isDarkMode, List<dynamic> messages) loaded,
  }) {
    return loading(isDarkMode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isDarkMode)? loading,
    TResult? Function(bool isDarkMode)? error,
    TResult? Function(bool isDarkMode, List<dynamic> messages)? loaded,
  }) {
    return loading?.call(isDarkMode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isDarkMode)? loading,
    TResult Function(bool isDarkMode)? error,
    TResult Function(bool isDarkMode, List<dynamic> messages)? loaded,
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
    required TResult Function(ChatPageLoadingState value) loading,
    required TResult Function(ChatPageErrorState value) error,
    required TResult Function(ChatPageLoadedState value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChatPageLoadingState value)? loading,
    TResult? Function(ChatPageErrorState value)? error,
    TResult? Function(ChatPageLoadedState value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChatPageLoadingState value)? loading,
    TResult Function(ChatPageErrorState value)? error,
    TResult Function(ChatPageLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ChatPageLoadingState implements ChatPageState {
  const factory ChatPageLoadingState({final bool isDarkMode}) =
      _$ChatPageLoadingStateImpl;

  @override
  bool get isDarkMode;
  @override
  @JsonKey(ignore: true)
  _$$ChatPageLoadingStateImplCopyWith<_$ChatPageLoadingStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChatPageErrorStateImplCopyWith<$Res>
    implements $ChatPageStateCopyWith<$Res> {
  factory _$$ChatPageErrorStateImplCopyWith(_$ChatPageErrorStateImpl value,
          $Res Function(_$ChatPageErrorStateImpl) then) =
      __$$ChatPageErrorStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isDarkMode});
}

/// @nodoc
class __$$ChatPageErrorStateImplCopyWithImpl<$Res>
    extends _$ChatPageStateCopyWithImpl<$Res, _$ChatPageErrorStateImpl>
    implements _$$ChatPageErrorStateImplCopyWith<$Res> {
  __$$ChatPageErrorStateImplCopyWithImpl(_$ChatPageErrorStateImpl _value,
      $Res Function(_$ChatPageErrorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isDarkMode = null,
  }) {
    return _then(_$ChatPageErrorStateImpl(
      isDarkMode: null == isDarkMode
          ? _value.isDarkMode
          : isDarkMode // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ChatPageErrorStateImpl implements ChatPageErrorState {
  const _$ChatPageErrorStateImpl({this.isDarkMode = false});

  @override
  @JsonKey()
  final bool isDarkMode;

  @override
  String toString() {
    return 'ChatPageState.error(isDarkMode: $isDarkMode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatPageErrorStateImpl &&
            (identical(other.isDarkMode, isDarkMode) ||
                other.isDarkMode == isDarkMode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isDarkMode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatPageErrorStateImplCopyWith<_$ChatPageErrorStateImpl> get copyWith =>
      __$$ChatPageErrorStateImplCopyWithImpl<_$ChatPageErrorStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isDarkMode) loading,
    required TResult Function(bool isDarkMode) error,
    required TResult Function(bool isDarkMode, List<dynamic> messages) loaded,
  }) {
    return error(isDarkMode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isDarkMode)? loading,
    TResult? Function(bool isDarkMode)? error,
    TResult? Function(bool isDarkMode, List<dynamic> messages)? loaded,
  }) {
    return error?.call(isDarkMode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isDarkMode)? loading,
    TResult Function(bool isDarkMode)? error,
    TResult Function(bool isDarkMode, List<dynamic> messages)? loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(isDarkMode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChatPageLoadingState value) loading,
    required TResult Function(ChatPageErrorState value) error,
    required TResult Function(ChatPageLoadedState value) loaded,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChatPageLoadingState value)? loading,
    TResult? Function(ChatPageErrorState value)? error,
    TResult? Function(ChatPageLoadedState value)? loaded,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChatPageLoadingState value)? loading,
    TResult Function(ChatPageErrorState value)? error,
    TResult Function(ChatPageLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ChatPageErrorState implements ChatPageState {
  const factory ChatPageErrorState({final bool isDarkMode}) =
      _$ChatPageErrorStateImpl;

  @override
  bool get isDarkMode;
  @override
  @JsonKey(ignore: true)
  _$$ChatPageErrorStateImplCopyWith<_$ChatPageErrorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChatPageLoadedStateImplCopyWith<$Res>
    implements $ChatPageStateCopyWith<$Res> {
  factory _$$ChatPageLoadedStateImplCopyWith(_$ChatPageLoadedStateImpl value,
          $Res Function(_$ChatPageLoadedStateImpl) then) =
      __$$ChatPageLoadedStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isDarkMode, List<dynamic> messages});
}

/// @nodoc
class __$$ChatPageLoadedStateImplCopyWithImpl<$Res>
    extends _$ChatPageStateCopyWithImpl<$Res, _$ChatPageLoadedStateImpl>
    implements _$$ChatPageLoadedStateImplCopyWith<$Res> {
  __$$ChatPageLoadedStateImplCopyWithImpl(_$ChatPageLoadedStateImpl _value,
      $Res Function(_$ChatPageLoadedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isDarkMode = null,
    Object? messages = null,
  }) {
    return _then(_$ChatPageLoadedStateImpl(
      isDarkMode: null == isDarkMode
          ? _value.isDarkMode
          : isDarkMode // ignore: cast_nullable_to_non_nullable
              as bool,
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc

class _$ChatPageLoadedStateImpl implements ChatPageLoadedState {
  const _$ChatPageLoadedStateImpl(
      {this.isDarkMode = false, required final List<dynamic> messages})
      : _messages = messages;

  @override
  @JsonKey()
  final bool isDarkMode;
  final List<dynamic> _messages;
  @override
  List<dynamic> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  String toString() {
    return 'ChatPageState.loaded(isDarkMode: $isDarkMode, messages: $messages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatPageLoadedStateImpl &&
            (identical(other.isDarkMode, isDarkMode) ||
                other.isDarkMode == isDarkMode) &&
            const DeepCollectionEquality().equals(other._messages, _messages));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isDarkMode, const DeepCollectionEquality().hash(_messages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatPageLoadedStateImplCopyWith<_$ChatPageLoadedStateImpl> get copyWith =>
      __$$ChatPageLoadedStateImplCopyWithImpl<_$ChatPageLoadedStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isDarkMode) loading,
    required TResult Function(bool isDarkMode) error,
    required TResult Function(bool isDarkMode, List<dynamic> messages) loaded,
  }) {
    return loaded(isDarkMode, messages);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isDarkMode)? loading,
    TResult? Function(bool isDarkMode)? error,
    TResult? Function(bool isDarkMode, List<dynamic> messages)? loaded,
  }) {
    return loaded?.call(isDarkMode, messages);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isDarkMode)? loading,
    TResult Function(bool isDarkMode)? error,
    TResult Function(bool isDarkMode, List<dynamic> messages)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(isDarkMode, messages);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChatPageLoadingState value) loading,
    required TResult Function(ChatPageErrorState value) error,
    required TResult Function(ChatPageLoadedState value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChatPageLoadingState value)? loading,
    TResult? Function(ChatPageErrorState value)? error,
    TResult? Function(ChatPageLoadedState value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChatPageLoadingState value)? loading,
    TResult Function(ChatPageErrorState value)? error,
    TResult Function(ChatPageLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class ChatPageLoadedState implements ChatPageState {
  const factory ChatPageLoadedState(
      {final bool isDarkMode,
      required final List<dynamic> messages}) = _$ChatPageLoadedStateImpl;

  @override
  bool get isDarkMode;
  List<dynamic> get messages;
  @override
  @JsonKey(ignore: true)
  _$$ChatPageLoadedStateImplCopyWith<_$ChatPageLoadedStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
