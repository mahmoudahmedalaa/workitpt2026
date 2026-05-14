// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NotificationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getNotifications,
    required TResult Function(String id) viewOneNotification,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getNotifications,
    TResult? Function(String id)? viewOneNotification,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getNotifications,
    TResult Function(String id)? viewOneNotification,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_getNotifications value) getNotifications,
    required TResult Function(_viewOneNotification value) viewOneNotification,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_getNotifications value)? getNotifications,
    TResult? Function(_viewOneNotification value)? viewOneNotification,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_getNotifications value)? getNotifications,
    TResult Function(_viewOneNotification value)? viewOneNotification,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationEventCopyWith<$Res> {
  factory $NotificationEventCopyWith(
          NotificationEvent value, $Res Function(NotificationEvent) then) =
      _$NotificationEventCopyWithImpl<$Res, NotificationEvent>;
}

/// @nodoc
class _$NotificationEventCopyWithImpl<$Res, $Val extends NotificationEvent>
    implements $NotificationEventCopyWith<$Res> {
  _$NotificationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$getNotificationsImplCopyWith<$Res> {
  factory _$$getNotificationsImplCopyWith(_$getNotificationsImpl value,
          $Res Function(_$getNotificationsImpl) then) =
      __$$getNotificationsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$getNotificationsImplCopyWithImpl<$Res>
    extends _$NotificationEventCopyWithImpl<$Res, _$getNotificationsImpl>
    implements _$$getNotificationsImplCopyWith<$Res> {
  __$$getNotificationsImplCopyWithImpl(_$getNotificationsImpl _value,
      $Res Function(_$getNotificationsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$getNotificationsImpl implements _getNotifications {
  const _$getNotificationsImpl();

  @override
  String toString() {
    return 'NotificationEvent.getNotifications()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$getNotificationsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getNotifications,
    required TResult Function(String id) viewOneNotification,
  }) {
    return getNotifications();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getNotifications,
    TResult? Function(String id)? viewOneNotification,
  }) {
    return getNotifications?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getNotifications,
    TResult Function(String id)? viewOneNotification,
    required TResult orElse(),
  }) {
    if (getNotifications != null) {
      return getNotifications();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_getNotifications value) getNotifications,
    required TResult Function(_viewOneNotification value) viewOneNotification,
  }) {
    return getNotifications(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_getNotifications value)? getNotifications,
    TResult? Function(_viewOneNotification value)? viewOneNotification,
  }) {
    return getNotifications?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_getNotifications value)? getNotifications,
    TResult Function(_viewOneNotification value)? viewOneNotification,
    required TResult orElse(),
  }) {
    if (getNotifications != null) {
      return getNotifications(this);
    }
    return orElse();
  }
}

abstract class _getNotifications implements NotificationEvent {
  const factory _getNotifications() = _$getNotificationsImpl;
}

/// @nodoc
abstract class _$$viewOneNotificationImplCopyWith<$Res> {
  factory _$$viewOneNotificationImplCopyWith(_$viewOneNotificationImpl value,
          $Res Function(_$viewOneNotificationImpl) then) =
      __$$viewOneNotificationImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$viewOneNotificationImplCopyWithImpl<$Res>
    extends _$NotificationEventCopyWithImpl<$Res, _$viewOneNotificationImpl>
    implements _$$viewOneNotificationImplCopyWith<$Res> {
  __$$viewOneNotificationImplCopyWithImpl(_$viewOneNotificationImpl _value,
      $Res Function(_$viewOneNotificationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$viewOneNotificationImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$viewOneNotificationImpl implements _viewOneNotification {
  const _$viewOneNotificationImpl(this.id);

  @override
  final String id;

  @override
  String toString() {
    return 'NotificationEvent.viewOneNotification(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$viewOneNotificationImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$viewOneNotificationImplCopyWith<_$viewOneNotificationImpl> get copyWith =>
      __$$viewOneNotificationImplCopyWithImpl<_$viewOneNotificationImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getNotifications,
    required TResult Function(String id) viewOneNotification,
  }) {
    return viewOneNotification(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getNotifications,
    TResult? Function(String id)? viewOneNotification,
  }) {
    return viewOneNotification?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getNotifications,
    TResult Function(String id)? viewOneNotification,
    required TResult orElse(),
  }) {
    if (viewOneNotification != null) {
      return viewOneNotification(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_getNotifications value) getNotifications,
    required TResult Function(_viewOneNotification value) viewOneNotification,
  }) {
    return viewOneNotification(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_getNotifications value)? getNotifications,
    TResult? Function(_viewOneNotification value)? viewOneNotification,
  }) {
    return viewOneNotification?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_getNotifications value)? getNotifications,
    TResult Function(_viewOneNotification value)? viewOneNotification,
    required TResult orElse(),
  }) {
    if (viewOneNotification != null) {
      return viewOneNotification(this);
    }
    return orElse();
  }
}

abstract class _viewOneNotification implements NotificationEvent {
  const factory _viewOneNotification(final String id) =
      _$viewOneNotificationImpl;

  String get id;
  @JsonKey(ignore: true)
  _$$viewOneNotificationImplCopyWith<_$viewOneNotificationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$NotificationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() onLoading,
    required TResult Function(List<NotificationModel> model)
        onGetNotificationSuccess,
    required TResult Function(NotificationModel model) onViewOneNotification,
    required TResult Function(String? message) onFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? onLoading,
    TResult? Function(List<NotificationModel> model)? onGetNotificationSuccess,
    TResult? Function(NotificationModel model)? onViewOneNotification,
    TResult? Function(String? message)? onFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onLoading,
    TResult Function(List<NotificationModel> model)? onGetNotificationSuccess,
    TResult Function(NotificationModel model)? onViewOneNotification,
    TResult Function(String? message)? onFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_onLoading value) onLoading,
    required TResult Function(_onGetNotificationSuccess value)
        onGetNotificationSuccess,
    required TResult Function(_onViewOneNotification value)
        onViewOneNotification,
    required TResult Function(_onFailure value) onFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_onLoading value)? onLoading,
    TResult? Function(_onGetNotificationSuccess value)?
        onGetNotificationSuccess,
    TResult? Function(_onViewOneNotification value)? onViewOneNotification,
    TResult? Function(_onFailure value)? onFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_onLoading value)? onLoading,
    TResult Function(_onGetNotificationSuccess value)? onGetNotificationSuccess,
    TResult Function(_onViewOneNotification value)? onViewOneNotification,
    TResult Function(_onFailure value)? onFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationStateCopyWith<$Res> {
  factory $NotificationStateCopyWith(
          NotificationState value, $Res Function(NotificationState) then) =
      _$NotificationStateCopyWithImpl<$Res, NotificationState>;
}

/// @nodoc
class _$NotificationStateCopyWithImpl<$Res, $Val extends NotificationState>
    implements $NotificationStateCopyWith<$Res> {
  _$NotificationStateCopyWithImpl(this._value, this._then);

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
    extends _$NotificationStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'NotificationState.initial()';
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
    required TResult Function(List<NotificationModel> model)
        onGetNotificationSuccess,
    required TResult Function(NotificationModel model) onViewOneNotification,
    required TResult Function(String? message) onFailure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? onLoading,
    TResult? Function(List<NotificationModel> model)? onGetNotificationSuccess,
    TResult? Function(NotificationModel model)? onViewOneNotification,
    TResult? Function(String? message)? onFailure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onLoading,
    TResult Function(List<NotificationModel> model)? onGetNotificationSuccess,
    TResult Function(NotificationModel model)? onViewOneNotification,
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
    required TResult Function(_onGetNotificationSuccess value)
        onGetNotificationSuccess,
    required TResult Function(_onViewOneNotification value)
        onViewOneNotification,
    required TResult Function(_onFailure value) onFailure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_onLoading value)? onLoading,
    TResult? Function(_onGetNotificationSuccess value)?
        onGetNotificationSuccess,
    TResult? Function(_onViewOneNotification value)? onViewOneNotification,
    TResult? Function(_onFailure value)? onFailure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_onLoading value)? onLoading,
    TResult Function(_onGetNotificationSuccess value)? onGetNotificationSuccess,
    TResult Function(_onViewOneNotification value)? onViewOneNotification,
    TResult Function(_onFailure value)? onFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements NotificationState {
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
    extends _$NotificationStateCopyWithImpl<$Res, _$onLoadingImpl>
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
    return 'NotificationState.onLoading()';
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
    required TResult Function(List<NotificationModel> model)
        onGetNotificationSuccess,
    required TResult Function(NotificationModel model) onViewOneNotification,
    required TResult Function(String? message) onFailure,
  }) {
    return onLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? onLoading,
    TResult? Function(List<NotificationModel> model)? onGetNotificationSuccess,
    TResult? Function(NotificationModel model)? onViewOneNotification,
    TResult? Function(String? message)? onFailure,
  }) {
    return onLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onLoading,
    TResult Function(List<NotificationModel> model)? onGetNotificationSuccess,
    TResult Function(NotificationModel model)? onViewOneNotification,
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
    required TResult Function(_onGetNotificationSuccess value)
        onGetNotificationSuccess,
    required TResult Function(_onViewOneNotification value)
        onViewOneNotification,
    required TResult Function(_onFailure value) onFailure,
  }) {
    return onLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_onLoading value)? onLoading,
    TResult? Function(_onGetNotificationSuccess value)?
        onGetNotificationSuccess,
    TResult? Function(_onViewOneNotification value)? onViewOneNotification,
    TResult? Function(_onFailure value)? onFailure,
  }) {
    return onLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_onLoading value)? onLoading,
    TResult Function(_onGetNotificationSuccess value)? onGetNotificationSuccess,
    TResult Function(_onViewOneNotification value)? onViewOneNotification,
    TResult Function(_onFailure value)? onFailure,
    required TResult orElse(),
  }) {
    if (onLoading != null) {
      return onLoading(this);
    }
    return orElse();
  }
}

abstract class _onLoading implements NotificationState {
  const factory _onLoading() = _$onLoadingImpl;
}

/// @nodoc
abstract class _$$onGetNotificationSuccessImplCopyWith<$Res> {
  factory _$$onGetNotificationSuccessImplCopyWith(
          _$onGetNotificationSuccessImpl value,
          $Res Function(_$onGetNotificationSuccessImpl) then) =
      __$$onGetNotificationSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<NotificationModel> model});
}

/// @nodoc
class __$$onGetNotificationSuccessImplCopyWithImpl<$Res>
    extends _$NotificationStateCopyWithImpl<$Res,
        _$onGetNotificationSuccessImpl>
    implements _$$onGetNotificationSuccessImplCopyWith<$Res> {
  __$$onGetNotificationSuccessImplCopyWithImpl(
      _$onGetNotificationSuccessImpl _value,
      $Res Function(_$onGetNotificationSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
  }) {
    return _then(_$onGetNotificationSuccessImpl(
      null == model
          ? _value._model
          : model // ignore: cast_nullable_to_non_nullable
              as List<NotificationModel>,
    ));
  }
}

/// @nodoc

class _$onGetNotificationSuccessImpl implements _onGetNotificationSuccess {
  const _$onGetNotificationSuccessImpl(final List<NotificationModel> model)
      : _model = model;

  final List<NotificationModel> _model;
  @override
  List<NotificationModel> get model {
    if (_model is EqualUnmodifiableListView) return _model;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_model);
  }

  @override
  String toString() {
    return 'NotificationState.onGetNotificationSuccess(model: $model)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$onGetNotificationSuccessImpl &&
            const DeepCollectionEquality().equals(other._model, _model));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_model));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$onGetNotificationSuccessImplCopyWith<_$onGetNotificationSuccessImpl>
      get copyWith => __$$onGetNotificationSuccessImplCopyWithImpl<
          _$onGetNotificationSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() onLoading,
    required TResult Function(List<NotificationModel> model)
        onGetNotificationSuccess,
    required TResult Function(NotificationModel model) onViewOneNotification,
    required TResult Function(String? message) onFailure,
  }) {
    return onGetNotificationSuccess(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? onLoading,
    TResult? Function(List<NotificationModel> model)? onGetNotificationSuccess,
    TResult? Function(NotificationModel model)? onViewOneNotification,
    TResult? Function(String? message)? onFailure,
  }) {
    return onGetNotificationSuccess?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onLoading,
    TResult Function(List<NotificationModel> model)? onGetNotificationSuccess,
    TResult Function(NotificationModel model)? onViewOneNotification,
    TResult Function(String? message)? onFailure,
    required TResult orElse(),
  }) {
    if (onGetNotificationSuccess != null) {
      return onGetNotificationSuccess(model);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_onLoading value) onLoading,
    required TResult Function(_onGetNotificationSuccess value)
        onGetNotificationSuccess,
    required TResult Function(_onViewOneNotification value)
        onViewOneNotification,
    required TResult Function(_onFailure value) onFailure,
  }) {
    return onGetNotificationSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_onLoading value)? onLoading,
    TResult? Function(_onGetNotificationSuccess value)?
        onGetNotificationSuccess,
    TResult? Function(_onViewOneNotification value)? onViewOneNotification,
    TResult? Function(_onFailure value)? onFailure,
  }) {
    return onGetNotificationSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_onLoading value)? onLoading,
    TResult Function(_onGetNotificationSuccess value)? onGetNotificationSuccess,
    TResult Function(_onViewOneNotification value)? onViewOneNotification,
    TResult Function(_onFailure value)? onFailure,
    required TResult orElse(),
  }) {
    if (onGetNotificationSuccess != null) {
      return onGetNotificationSuccess(this);
    }
    return orElse();
  }
}

abstract class _onGetNotificationSuccess implements NotificationState {
  const factory _onGetNotificationSuccess(final List<NotificationModel> model) =
      _$onGetNotificationSuccessImpl;

  List<NotificationModel> get model;
  @JsonKey(ignore: true)
  _$$onGetNotificationSuccessImplCopyWith<_$onGetNotificationSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$onViewOneNotificationImplCopyWith<$Res> {
  factory _$$onViewOneNotificationImplCopyWith(
          _$onViewOneNotificationImpl value,
          $Res Function(_$onViewOneNotificationImpl) then) =
      __$$onViewOneNotificationImplCopyWithImpl<$Res>;
  @useResult
  $Res call({NotificationModel model});
}

/// @nodoc
class __$$onViewOneNotificationImplCopyWithImpl<$Res>
    extends _$NotificationStateCopyWithImpl<$Res, _$onViewOneNotificationImpl>
    implements _$$onViewOneNotificationImplCopyWith<$Res> {
  __$$onViewOneNotificationImplCopyWithImpl(_$onViewOneNotificationImpl _value,
      $Res Function(_$onViewOneNotificationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
  }) {
    return _then(_$onViewOneNotificationImpl(
      null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as NotificationModel,
    ));
  }
}

/// @nodoc

class _$onViewOneNotificationImpl implements _onViewOneNotification {
  const _$onViewOneNotificationImpl(this.model);

  @override
  final NotificationModel model;

  @override
  String toString() {
    return 'NotificationState.onViewOneNotification(model: $model)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$onViewOneNotificationImpl &&
            (identical(other.model, model) || other.model == model));
  }

  @override
  int get hashCode => Object.hash(runtimeType, model);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$onViewOneNotificationImplCopyWith<_$onViewOneNotificationImpl>
      get copyWith => __$$onViewOneNotificationImplCopyWithImpl<
          _$onViewOneNotificationImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() onLoading,
    required TResult Function(List<NotificationModel> model)
        onGetNotificationSuccess,
    required TResult Function(NotificationModel model) onViewOneNotification,
    required TResult Function(String? message) onFailure,
  }) {
    return onViewOneNotification(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? onLoading,
    TResult? Function(List<NotificationModel> model)? onGetNotificationSuccess,
    TResult? Function(NotificationModel model)? onViewOneNotification,
    TResult? Function(String? message)? onFailure,
  }) {
    return onViewOneNotification?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onLoading,
    TResult Function(List<NotificationModel> model)? onGetNotificationSuccess,
    TResult Function(NotificationModel model)? onViewOneNotification,
    TResult Function(String? message)? onFailure,
    required TResult orElse(),
  }) {
    if (onViewOneNotification != null) {
      return onViewOneNotification(model);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_onLoading value) onLoading,
    required TResult Function(_onGetNotificationSuccess value)
        onGetNotificationSuccess,
    required TResult Function(_onViewOneNotification value)
        onViewOneNotification,
    required TResult Function(_onFailure value) onFailure,
  }) {
    return onViewOneNotification(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_onLoading value)? onLoading,
    TResult? Function(_onGetNotificationSuccess value)?
        onGetNotificationSuccess,
    TResult? Function(_onViewOneNotification value)? onViewOneNotification,
    TResult? Function(_onFailure value)? onFailure,
  }) {
    return onViewOneNotification?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_onLoading value)? onLoading,
    TResult Function(_onGetNotificationSuccess value)? onGetNotificationSuccess,
    TResult Function(_onViewOneNotification value)? onViewOneNotification,
    TResult Function(_onFailure value)? onFailure,
    required TResult orElse(),
  }) {
    if (onViewOneNotification != null) {
      return onViewOneNotification(this);
    }
    return orElse();
  }
}

abstract class _onViewOneNotification implements NotificationState {
  const factory _onViewOneNotification(final NotificationModel model) =
      _$onViewOneNotificationImpl;

  NotificationModel get model;
  @JsonKey(ignore: true)
  _$$onViewOneNotificationImplCopyWith<_$onViewOneNotificationImpl>
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
    extends _$NotificationStateCopyWithImpl<$Res, _$onFailureImpl>
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
    return 'NotificationState.onFailure(message: $message)';
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
    required TResult Function(List<NotificationModel> model)
        onGetNotificationSuccess,
    required TResult Function(NotificationModel model) onViewOneNotification,
    required TResult Function(String? message) onFailure,
  }) {
    return onFailure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? onLoading,
    TResult? Function(List<NotificationModel> model)? onGetNotificationSuccess,
    TResult? Function(NotificationModel model)? onViewOneNotification,
    TResult? Function(String? message)? onFailure,
  }) {
    return onFailure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onLoading,
    TResult Function(List<NotificationModel> model)? onGetNotificationSuccess,
    TResult Function(NotificationModel model)? onViewOneNotification,
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
    required TResult Function(_onGetNotificationSuccess value)
        onGetNotificationSuccess,
    required TResult Function(_onViewOneNotification value)
        onViewOneNotification,
    required TResult Function(_onFailure value) onFailure,
  }) {
    return onFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_onLoading value)? onLoading,
    TResult? Function(_onGetNotificationSuccess value)?
        onGetNotificationSuccess,
    TResult? Function(_onViewOneNotification value)? onViewOneNotification,
    TResult? Function(_onFailure value)? onFailure,
  }) {
    return onFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_onLoading value)? onLoading,
    TResult Function(_onGetNotificationSuccess value)? onGetNotificationSuccess,
    TResult Function(_onViewOneNotification value)? onViewOneNotification,
    TResult Function(_onFailure value)? onFailure,
    required TResult orElse(),
  }) {
    if (onFailure != null) {
      return onFailure(this);
    }
    return orElse();
  }
}

abstract class _onFailure implements NotificationState {
  const factory _onFailure(final String? message) = _$onFailureImpl;

  String? get message;
  @JsonKey(ignore: true)
  _$$onFailureImplCopyWith<_$onFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
