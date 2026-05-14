// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChatEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String id, int page) getChatHistory,
    required TResult Function() getUserChatHistory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String id, int page)? getChatHistory,
    TResult? Function()? getUserChatHistory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String id, int page)? getChatHistory,
    TResult Function()? getUserChatHistory,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_onGetChatHistory value) getChatHistory,
    required TResult Function(_onGetUserChatHistory value) getUserChatHistory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_onGetChatHistory value)? getChatHistory,
    TResult? Function(_onGetUserChatHistory value)? getUserChatHistory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_onGetChatHistory value)? getChatHistory,
    TResult Function(_onGetUserChatHistory value)? getUserChatHistory,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatEventCopyWith<$Res> {
  factory $ChatEventCopyWith(ChatEvent value, $Res Function(ChatEvent) then) =
      _$ChatEventCopyWithImpl<$Res, ChatEvent>;
}

/// @nodoc
class _$ChatEventCopyWithImpl<$Res, $Val extends ChatEvent>
    implements $ChatEventCopyWith<$Res> {
  _$ChatEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'ChatEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String id, int page) getChatHistory,
    required TResult Function() getUserChatHistory,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String id, int page)? getChatHistory,
    TResult? Function()? getUserChatHistory,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String id, int page)? getChatHistory,
    TResult Function()? getUserChatHistory,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_onGetChatHistory value) getChatHistory,
    required TResult Function(_onGetUserChatHistory value) getUserChatHistory,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_onGetChatHistory value)? getChatHistory,
    TResult? Function(_onGetUserChatHistory value)? getUserChatHistory,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_onGetChatHistory value)? getChatHistory,
    TResult Function(_onGetUserChatHistory value)? getUserChatHistory,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements ChatEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$onGetChatHistoryImplCopyWith<$Res> {
  factory _$$onGetChatHistoryImplCopyWith(_$onGetChatHistoryImpl value,
          $Res Function(_$onGetChatHistoryImpl) then) =
      __$$onGetChatHistoryImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id, int page});
}

/// @nodoc
class __$$onGetChatHistoryImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$onGetChatHistoryImpl>
    implements _$$onGetChatHistoryImplCopyWith<$Res> {
  __$$onGetChatHistoryImplCopyWithImpl(_$onGetChatHistoryImpl _value,
      $Res Function(_$onGetChatHistoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? page = null,
  }) {
    return _then(_$onGetChatHistoryImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$onGetChatHistoryImpl implements _onGetChatHistory {
  const _$onGetChatHistoryImpl(this.id, this.page);

  @override
  final String id;
  @override
  final int page;

  @override
  String toString() {
    return 'ChatEvent.getChatHistory(id: $id, page: $page)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$onGetChatHistoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, page);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$onGetChatHistoryImplCopyWith<_$onGetChatHistoryImpl> get copyWith =>
      __$$onGetChatHistoryImplCopyWithImpl<_$onGetChatHistoryImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String id, int page) getChatHistory,
    required TResult Function() getUserChatHistory,
  }) {
    return getChatHistory(id, page);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String id, int page)? getChatHistory,
    TResult? Function()? getUserChatHistory,
  }) {
    return getChatHistory?.call(id, page);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String id, int page)? getChatHistory,
    TResult Function()? getUserChatHistory,
    required TResult orElse(),
  }) {
    if (getChatHistory != null) {
      return getChatHistory(id, page);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_onGetChatHistory value) getChatHistory,
    required TResult Function(_onGetUserChatHistory value) getUserChatHistory,
  }) {
    return getChatHistory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_onGetChatHistory value)? getChatHistory,
    TResult? Function(_onGetUserChatHistory value)? getUserChatHistory,
  }) {
    return getChatHistory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_onGetChatHistory value)? getChatHistory,
    TResult Function(_onGetUserChatHistory value)? getUserChatHistory,
    required TResult orElse(),
  }) {
    if (getChatHistory != null) {
      return getChatHistory(this);
    }
    return orElse();
  }
}

abstract class _onGetChatHistory implements ChatEvent {
  const factory _onGetChatHistory(final String id, final int page) =
      _$onGetChatHistoryImpl;

  String get id;
  int get page;
  @JsonKey(ignore: true)
  _$$onGetChatHistoryImplCopyWith<_$onGetChatHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$onGetUserChatHistoryImplCopyWith<$Res> {
  factory _$$onGetUserChatHistoryImplCopyWith(_$onGetUserChatHistoryImpl value,
          $Res Function(_$onGetUserChatHistoryImpl) then) =
      __$$onGetUserChatHistoryImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$onGetUserChatHistoryImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$onGetUserChatHistoryImpl>
    implements _$$onGetUserChatHistoryImplCopyWith<$Res> {
  __$$onGetUserChatHistoryImplCopyWithImpl(_$onGetUserChatHistoryImpl _value,
      $Res Function(_$onGetUserChatHistoryImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$onGetUserChatHistoryImpl implements _onGetUserChatHistory {
  const _$onGetUserChatHistoryImpl();

  @override
  String toString() {
    return 'ChatEvent.getUserChatHistory()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$onGetUserChatHistoryImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String id, int page) getChatHistory,
    required TResult Function() getUserChatHistory,
  }) {
    return getUserChatHistory();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String id, int page)? getChatHistory,
    TResult? Function()? getUserChatHistory,
  }) {
    return getUserChatHistory?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String id, int page)? getChatHistory,
    TResult Function()? getUserChatHistory,
    required TResult orElse(),
  }) {
    if (getUserChatHistory != null) {
      return getUserChatHistory();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_onGetChatHistory value) getChatHistory,
    required TResult Function(_onGetUserChatHistory value) getUserChatHistory,
  }) {
    return getUserChatHistory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_onGetChatHistory value)? getChatHistory,
    TResult? Function(_onGetUserChatHistory value)? getUserChatHistory,
  }) {
    return getUserChatHistory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_onGetChatHistory value)? getChatHistory,
    TResult Function(_onGetUserChatHistory value)? getUserChatHistory,
    required TResult orElse(),
  }) {
    if (getUserChatHistory != null) {
      return getUserChatHistory(this);
    }
    return orElse();
  }
}

abstract class _onGetUserChatHistory implements ChatEvent {
  const factory _onGetUserChatHistory() = _$onGetUserChatHistoryImpl;
}

/// @nodoc
mixin _$ChatState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() onLoading,
    required TResult Function(CommonModel<List<ChatModel>> model)
        onGetChatHistorySuccess,
    required TResult Function(CommonModel<List<ChatModel>> model)
        onGetUserChatHistorySuccess,
    required TResult Function(String? message) onFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? onLoading,
    TResult? Function(CommonModel<List<ChatModel>> model)?
        onGetChatHistorySuccess,
    TResult? Function(CommonModel<List<ChatModel>> model)?
        onGetUserChatHistorySuccess,
    TResult? Function(String? message)? onFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onLoading,
    TResult Function(CommonModel<List<ChatModel>> model)?
        onGetChatHistorySuccess,
    TResult Function(CommonModel<List<ChatModel>> model)?
        onGetUserChatHistorySuccess,
    TResult Function(String? message)? onFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_onLoading value) onLoading,
    required TResult Function(_onGetChatHistorySuccess value)
        onGetChatHistorySuccess,
    required TResult Function(_onGetUserChatHistorySuccess value)
        onGetUserChatHistorySuccess,
    required TResult Function(_onFailure value) onFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_onLoading value)? onLoading,
    TResult? Function(_onGetChatHistorySuccess value)? onGetChatHistorySuccess,
    TResult? Function(_onGetUserChatHistorySuccess value)?
        onGetUserChatHistorySuccess,
    TResult? Function(_onFailure value)? onFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_onLoading value)? onLoading,
    TResult Function(_onGetChatHistorySuccess value)? onGetChatHistorySuccess,
    TResult Function(_onGetUserChatHistorySuccess value)?
        onGetUserChatHistorySuccess,
    TResult Function(_onFailure value)? onFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatStateCopyWith<$Res> {
  factory $ChatStateCopyWith(ChatState value, $Res Function(ChatState) then) =
      _$ChatStateCopyWithImpl<$Res, ChatState>;
}

/// @nodoc
class _$ChatStateCopyWithImpl<$Res, $Val extends ChatState>
    implements $ChatStateCopyWith<$Res> {
  _$ChatStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'ChatState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() onLoading,
    required TResult Function(CommonModel<List<ChatModel>> model)
        onGetChatHistorySuccess,
    required TResult Function(CommonModel<List<ChatModel>> model)
        onGetUserChatHistorySuccess,
    required TResult Function(String? message) onFailure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? onLoading,
    TResult? Function(CommonModel<List<ChatModel>> model)?
        onGetChatHistorySuccess,
    TResult? Function(CommonModel<List<ChatModel>> model)?
        onGetUserChatHistorySuccess,
    TResult? Function(String? message)? onFailure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onLoading,
    TResult Function(CommonModel<List<ChatModel>> model)?
        onGetChatHistorySuccess,
    TResult Function(CommonModel<List<ChatModel>> model)?
        onGetUserChatHistorySuccess,
    TResult Function(String? message)? onFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_onLoading value) onLoading,
    required TResult Function(_onGetChatHistorySuccess value)
        onGetChatHistorySuccess,
    required TResult Function(_onGetUserChatHistorySuccess value)
        onGetUserChatHistorySuccess,
    required TResult Function(_onFailure value) onFailure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_onLoading value)? onLoading,
    TResult? Function(_onGetChatHistorySuccess value)? onGetChatHistorySuccess,
    TResult? Function(_onGetUserChatHistorySuccess value)?
        onGetUserChatHistorySuccess,
    TResult? Function(_onFailure value)? onFailure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_onLoading value)? onLoading,
    TResult Function(_onGetChatHistorySuccess value)? onGetChatHistorySuccess,
    TResult Function(_onGetUserChatHistorySuccess value)?
        onGetUserChatHistorySuccess,
    TResult Function(_onFailure value)? onFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ChatState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$onLoadingImplCopyWith<$Res> {
  factory _$$onLoadingImplCopyWith(
          _$onLoadingImpl value, $Res Function(_$onLoadingImpl) then) =
      __$$onLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$onLoadingImplCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$onLoadingImpl>
    implements _$$onLoadingImplCopyWith<$Res> {
  __$$onLoadingImplCopyWithImpl(
      _$onLoadingImpl _value, $Res Function(_$onLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$onLoadingImpl implements _onLoading {
  const _$onLoadingImpl();

  @override
  String toString() {
    return 'ChatState.onLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$onLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() onLoading,
    required TResult Function(CommonModel<List<ChatModel>> model)
        onGetChatHistorySuccess,
    required TResult Function(CommonModel<List<ChatModel>> model)
        onGetUserChatHistorySuccess,
    required TResult Function(String? message) onFailure,
  }) {
    return onLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? onLoading,
    TResult? Function(CommonModel<List<ChatModel>> model)?
        onGetChatHistorySuccess,
    TResult? Function(CommonModel<List<ChatModel>> model)?
        onGetUserChatHistorySuccess,
    TResult? Function(String? message)? onFailure,
  }) {
    return onLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onLoading,
    TResult Function(CommonModel<List<ChatModel>> model)?
        onGetChatHistorySuccess,
    TResult Function(CommonModel<List<ChatModel>> model)?
        onGetUserChatHistorySuccess,
    TResult Function(String? message)? onFailure,
    required TResult orElse(),
  }) {
    if (onLoading != null) {
      return onLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_onLoading value) onLoading,
    required TResult Function(_onGetChatHistorySuccess value)
        onGetChatHistorySuccess,
    required TResult Function(_onGetUserChatHistorySuccess value)
        onGetUserChatHistorySuccess,
    required TResult Function(_onFailure value) onFailure,
  }) {
    return onLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_onLoading value)? onLoading,
    TResult? Function(_onGetChatHistorySuccess value)? onGetChatHistorySuccess,
    TResult? Function(_onGetUserChatHistorySuccess value)?
        onGetUserChatHistorySuccess,
    TResult? Function(_onFailure value)? onFailure,
  }) {
    return onLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_onLoading value)? onLoading,
    TResult Function(_onGetChatHistorySuccess value)? onGetChatHistorySuccess,
    TResult Function(_onGetUserChatHistorySuccess value)?
        onGetUserChatHistorySuccess,
    TResult Function(_onFailure value)? onFailure,
    required TResult orElse(),
  }) {
    if (onLoading != null) {
      return onLoading(this);
    }
    return orElse();
  }
}

abstract class _onLoading implements ChatState {
  const factory _onLoading() = _$onLoadingImpl;
}

/// @nodoc
abstract class _$$onGetChatHistorySuccessImplCopyWith<$Res> {
  factory _$$onGetChatHistorySuccessImplCopyWith(
          _$onGetChatHistorySuccessImpl value,
          $Res Function(_$onGetChatHistorySuccessImpl) then) =
      __$$onGetChatHistorySuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CommonModel<List<ChatModel>> model});
}

/// @nodoc
class __$$onGetChatHistorySuccessImplCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$onGetChatHistorySuccessImpl>
    implements _$$onGetChatHistorySuccessImplCopyWith<$Res> {
  __$$onGetChatHistorySuccessImplCopyWithImpl(
      _$onGetChatHistorySuccessImpl _value,
      $Res Function(_$onGetChatHistorySuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
  }) {
    return _then(_$onGetChatHistorySuccessImpl(
      null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as CommonModel<List<ChatModel>>,
    ));
  }
}

/// @nodoc

class _$onGetChatHistorySuccessImpl implements _onGetChatHistorySuccess {
  const _$onGetChatHistorySuccessImpl(this.model);

  @override
  final CommonModel<List<ChatModel>> model;

  @override
  String toString() {
    return 'ChatState.onGetChatHistorySuccess(model: $model)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$onGetChatHistorySuccessImpl &&
            (identical(other.model, model) || other.model == model));
  }

  @override
  int get hashCode => Object.hash(runtimeType, model);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$onGetChatHistorySuccessImplCopyWith<_$onGetChatHistorySuccessImpl>
      get copyWith => __$$onGetChatHistorySuccessImplCopyWithImpl<
          _$onGetChatHistorySuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() onLoading,
    required TResult Function(CommonModel<List<ChatModel>> model)
        onGetChatHistorySuccess,
    required TResult Function(CommonModel<List<ChatModel>> model)
        onGetUserChatHistorySuccess,
    required TResult Function(String? message) onFailure,
  }) {
    return onGetChatHistorySuccess(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? onLoading,
    TResult? Function(CommonModel<List<ChatModel>> model)?
        onGetChatHistorySuccess,
    TResult? Function(CommonModel<List<ChatModel>> model)?
        onGetUserChatHistorySuccess,
    TResult? Function(String? message)? onFailure,
  }) {
    return onGetChatHistorySuccess?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onLoading,
    TResult Function(CommonModel<List<ChatModel>> model)?
        onGetChatHistorySuccess,
    TResult Function(CommonModel<List<ChatModel>> model)?
        onGetUserChatHistorySuccess,
    TResult Function(String? message)? onFailure,
    required TResult orElse(),
  }) {
    if (onGetChatHistorySuccess != null) {
      return onGetChatHistorySuccess(model);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_onLoading value) onLoading,
    required TResult Function(_onGetChatHistorySuccess value)
        onGetChatHistorySuccess,
    required TResult Function(_onGetUserChatHistorySuccess value)
        onGetUserChatHistorySuccess,
    required TResult Function(_onFailure value) onFailure,
  }) {
    return onGetChatHistorySuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_onLoading value)? onLoading,
    TResult? Function(_onGetChatHistorySuccess value)? onGetChatHistorySuccess,
    TResult? Function(_onGetUserChatHistorySuccess value)?
        onGetUserChatHistorySuccess,
    TResult? Function(_onFailure value)? onFailure,
  }) {
    return onGetChatHistorySuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_onLoading value)? onLoading,
    TResult Function(_onGetChatHistorySuccess value)? onGetChatHistorySuccess,
    TResult Function(_onGetUserChatHistorySuccess value)?
        onGetUserChatHistorySuccess,
    TResult Function(_onFailure value)? onFailure,
    required TResult orElse(),
  }) {
    if (onGetChatHistorySuccess != null) {
      return onGetChatHistorySuccess(this);
    }
    return orElse();
  }
}

abstract class _onGetChatHistorySuccess implements ChatState {
  const factory _onGetChatHistorySuccess(
      final CommonModel<List<ChatModel>> model) = _$onGetChatHistorySuccessImpl;

  CommonModel<List<ChatModel>> get model;
  @JsonKey(ignore: true)
  _$$onGetChatHistorySuccessImplCopyWith<_$onGetChatHistorySuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$onGetUserChatHistorySuccessImplCopyWith<$Res> {
  factory _$$onGetUserChatHistorySuccessImplCopyWith(
          _$onGetUserChatHistorySuccessImpl value,
          $Res Function(_$onGetUserChatHistorySuccessImpl) then) =
      __$$onGetUserChatHistorySuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CommonModel<List<ChatModel>> model});
}

/// @nodoc
class __$$onGetUserChatHistorySuccessImplCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$onGetUserChatHistorySuccessImpl>
    implements _$$onGetUserChatHistorySuccessImplCopyWith<$Res> {
  __$$onGetUserChatHistorySuccessImplCopyWithImpl(
      _$onGetUserChatHistorySuccessImpl _value,
      $Res Function(_$onGetUserChatHistorySuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
  }) {
    return _then(_$onGetUserChatHistorySuccessImpl(
      null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as CommonModel<List<ChatModel>>,
    ));
  }
}

/// @nodoc

class _$onGetUserChatHistorySuccessImpl
    implements _onGetUserChatHistorySuccess {
  const _$onGetUserChatHistorySuccessImpl(this.model);

  @override
  final CommonModel<List<ChatModel>> model;

  @override
  String toString() {
    return 'ChatState.onGetUserChatHistorySuccess(model: $model)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$onGetUserChatHistorySuccessImpl &&
            (identical(other.model, model) || other.model == model));
  }

  @override
  int get hashCode => Object.hash(runtimeType, model);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$onGetUserChatHistorySuccessImplCopyWith<_$onGetUserChatHistorySuccessImpl>
      get copyWith => __$$onGetUserChatHistorySuccessImplCopyWithImpl<
          _$onGetUserChatHistorySuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() onLoading,
    required TResult Function(CommonModel<List<ChatModel>> model)
        onGetChatHistorySuccess,
    required TResult Function(CommonModel<List<ChatModel>> model)
        onGetUserChatHistorySuccess,
    required TResult Function(String? message) onFailure,
  }) {
    return onGetUserChatHistorySuccess(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? onLoading,
    TResult? Function(CommonModel<List<ChatModel>> model)?
        onGetChatHistorySuccess,
    TResult? Function(CommonModel<List<ChatModel>> model)?
        onGetUserChatHistorySuccess,
    TResult? Function(String? message)? onFailure,
  }) {
    return onGetUserChatHistorySuccess?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onLoading,
    TResult Function(CommonModel<List<ChatModel>> model)?
        onGetChatHistorySuccess,
    TResult Function(CommonModel<List<ChatModel>> model)?
        onGetUserChatHistorySuccess,
    TResult Function(String? message)? onFailure,
    required TResult orElse(),
  }) {
    if (onGetUserChatHistorySuccess != null) {
      return onGetUserChatHistorySuccess(model);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_onLoading value) onLoading,
    required TResult Function(_onGetChatHistorySuccess value)
        onGetChatHistorySuccess,
    required TResult Function(_onGetUserChatHistorySuccess value)
        onGetUserChatHistorySuccess,
    required TResult Function(_onFailure value) onFailure,
  }) {
    return onGetUserChatHistorySuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_onLoading value)? onLoading,
    TResult? Function(_onGetChatHistorySuccess value)? onGetChatHistorySuccess,
    TResult? Function(_onGetUserChatHistorySuccess value)?
        onGetUserChatHistorySuccess,
    TResult? Function(_onFailure value)? onFailure,
  }) {
    return onGetUserChatHistorySuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_onLoading value)? onLoading,
    TResult Function(_onGetChatHistorySuccess value)? onGetChatHistorySuccess,
    TResult Function(_onGetUserChatHistorySuccess value)?
        onGetUserChatHistorySuccess,
    TResult Function(_onFailure value)? onFailure,
    required TResult orElse(),
  }) {
    if (onGetUserChatHistorySuccess != null) {
      return onGetUserChatHistorySuccess(this);
    }
    return orElse();
  }
}

abstract class _onGetUserChatHistorySuccess implements ChatState {
  const factory _onGetUserChatHistorySuccess(
          final CommonModel<List<ChatModel>> model) =
      _$onGetUserChatHistorySuccessImpl;

  CommonModel<List<ChatModel>> get model;
  @JsonKey(ignore: true)
  _$$onGetUserChatHistorySuccessImplCopyWith<_$onGetUserChatHistorySuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$onFailureImplCopyWith<$Res> {
  factory _$$onFailureImplCopyWith(
          _$onFailureImpl value, $Res Function(_$onFailureImpl) then) =
      __$$onFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$onFailureImplCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$onFailureImpl>
    implements _$$onFailureImplCopyWith<$Res> {
  __$$onFailureImplCopyWithImpl(
      _$onFailureImpl _value, $Res Function(_$onFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$onFailureImpl(
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$onFailureImpl implements _onFailure {
  const _$onFailureImpl(this.message);

  @override
  final String? message;

  @override
  String toString() {
    return 'ChatState.onFailure(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$onFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$onFailureImplCopyWith<_$onFailureImpl> get copyWith =>
      __$$onFailureImplCopyWithImpl<_$onFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() onLoading,
    required TResult Function(CommonModel<List<ChatModel>> model)
        onGetChatHistorySuccess,
    required TResult Function(CommonModel<List<ChatModel>> model)
        onGetUserChatHistorySuccess,
    required TResult Function(String? message) onFailure,
  }) {
    return onFailure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? onLoading,
    TResult? Function(CommonModel<List<ChatModel>> model)?
        onGetChatHistorySuccess,
    TResult? Function(CommonModel<List<ChatModel>> model)?
        onGetUserChatHistorySuccess,
    TResult? Function(String? message)? onFailure,
  }) {
    return onFailure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onLoading,
    TResult Function(CommonModel<List<ChatModel>> model)?
        onGetChatHistorySuccess,
    TResult Function(CommonModel<List<ChatModel>> model)?
        onGetUserChatHistorySuccess,
    TResult Function(String? message)? onFailure,
    required TResult orElse(),
  }) {
    if (onFailure != null) {
      return onFailure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_onLoading value) onLoading,
    required TResult Function(_onGetChatHistorySuccess value)
        onGetChatHistorySuccess,
    required TResult Function(_onGetUserChatHistorySuccess value)
        onGetUserChatHistorySuccess,
    required TResult Function(_onFailure value) onFailure,
  }) {
    return onFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_onLoading value)? onLoading,
    TResult? Function(_onGetChatHistorySuccess value)? onGetChatHistorySuccess,
    TResult? Function(_onGetUserChatHistorySuccess value)?
        onGetUserChatHistorySuccess,
    TResult? Function(_onFailure value)? onFailure,
  }) {
    return onFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_onLoading value)? onLoading,
    TResult Function(_onGetChatHistorySuccess value)? onGetChatHistorySuccess,
    TResult Function(_onGetUserChatHistorySuccess value)?
        onGetUserChatHistorySuccess,
    TResult Function(_onFailure value)? onFailure,
    required TResult orElse(),
  }) {
    if (onFailure != null) {
      return onFailure(this);
    }
    return orElse();
  }
}

abstract class _onFailure implements ChatState {
  const factory _onFailure(final String? message) = _$onFailureImpl;

  String? get message;
  @JsonKey(ignore: true)
  _$$onFailureImplCopyWith<_$onFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
