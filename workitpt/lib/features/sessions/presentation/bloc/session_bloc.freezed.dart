// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SessionEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SessionModel model) addSession,
    required TResult Function(SessionFilterModel? filter) getSession,
    required TResult Function(SessionFilterModel? filter) getPreviousSession,
    required TResult Function(SessionFilterModel? filter) getUpcomingSession,
    required TResult Function(String sessionID) deleteSession,
    required TResult Function(List<Date> timeList) validateSelectedTime,
    required TResult Function(String sessionID) viewSession,
    required TResult Function(SessionModel model, String referenceID)
        updateSession,
    required TResult Function(RatingModel model, String id) putRating,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SessionModel model)? addSession,
    TResult? Function(SessionFilterModel? filter)? getSession,
    TResult? Function(SessionFilterModel? filter)? getPreviousSession,
    TResult? Function(SessionFilterModel? filter)? getUpcomingSession,
    TResult? Function(String sessionID)? deleteSession,
    TResult? Function(List<Date> timeList)? validateSelectedTime,
    TResult? Function(String sessionID)? viewSession,
    TResult? Function(SessionModel model, String referenceID)? updateSession,
    TResult? Function(RatingModel model, String id)? putRating,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SessionModel model)? addSession,
    TResult Function(SessionFilterModel? filter)? getSession,
    TResult Function(SessionFilterModel? filter)? getPreviousSession,
    TResult Function(SessionFilterModel? filter)? getUpcomingSession,
    TResult Function(String sessionID)? deleteSession,
    TResult Function(List<Date> timeList)? validateSelectedTime,
    TResult Function(String sessionID)? viewSession,
    TResult Function(SessionModel model, String referenceID)? updateSession,
    TResult Function(RatingModel model, String id)? putRating,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_onAddSession value) addSession,
    required TResult Function(_onGetSession value) getSession,
    required TResult Function(_onGetPreviousSession value) getPreviousSession,
    required TResult Function(_onGetUpcomingSession value) getUpcomingSession,
    required TResult Function(_onDeleteSession value) deleteSession,
    required TResult Function(_onvalidateSelectedTime value)
        validateSelectedTime,
    required TResult Function(_onViewSession value) viewSession,
    required TResult Function(_onUpdateSession value) updateSession,
    required TResult Function(_onPutRating value) putRating,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_onAddSession value)? addSession,
    TResult? Function(_onGetSession value)? getSession,
    TResult? Function(_onGetPreviousSession value)? getPreviousSession,
    TResult? Function(_onGetUpcomingSession value)? getUpcomingSession,
    TResult? Function(_onDeleteSession value)? deleteSession,
    TResult? Function(_onvalidateSelectedTime value)? validateSelectedTime,
    TResult? Function(_onViewSession value)? viewSession,
    TResult? Function(_onUpdateSession value)? updateSession,
    TResult? Function(_onPutRating value)? putRating,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_onAddSession value)? addSession,
    TResult Function(_onGetSession value)? getSession,
    TResult Function(_onGetPreviousSession value)? getPreviousSession,
    TResult Function(_onGetUpcomingSession value)? getUpcomingSession,
    TResult Function(_onDeleteSession value)? deleteSession,
    TResult Function(_onvalidateSelectedTime value)? validateSelectedTime,
    TResult Function(_onViewSession value)? viewSession,
    TResult Function(_onUpdateSession value)? updateSession,
    TResult Function(_onPutRating value)? putRating,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionEventCopyWith<$Res> {
  factory $SessionEventCopyWith(
          SessionEvent value, $Res Function(SessionEvent) then) =
      _$SessionEventCopyWithImpl<$Res, SessionEvent>;
}

/// @nodoc
class _$SessionEventCopyWithImpl<$Res, $Val extends SessionEvent>
    implements $SessionEventCopyWith<$Res> {
  _$SessionEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$onAddSessionImplCopyWith<$Res> {
  factory _$$onAddSessionImplCopyWith(
          _$onAddSessionImpl value, $Res Function(_$onAddSessionImpl) then) =
      __$$onAddSessionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SessionModel model});
}

/// @nodoc
class __$$onAddSessionImplCopyWithImpl<$Res>
    extends _$SessionEventCopyWithImpl<$Res, _$onAddSessionImpl>
    implements _$$onAddSessionImplCopyWith<$Res> {
  __$$onAddSessionImplCopyWithImpl(
      _$onAddSessionImpl _value, $Res Function(_$onAddSessionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
  }) {
    return _then(_$onAddSessionImpl(
      null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as SessionModel,
    ));
  }
}

/// @nodoc

class _$onAddSessionImpl implements _onAddSession {
  const _$onAddSessionImpl(this.model);

  @override
  final SessionModel model;

  @override
  String toString() {
    return 'SessionEvent.addSession(model: $model)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$onAddSessionImpl &&
            (identical(other.model, model) || other.model == model));
  }

  @override
  int get hashCode => Object.hash(runtimeType, model);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$onAddSessionImplCopyWith<_$onAddSessionImpl> get copyWith =>
      __$$onAddSessionImplCopyWithImpl<_$onAddSessionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SessionModel model) addSession,
    required TResult Function(SessionFilterModel? filter) getSession,
    required TResult Function(SessionFilterModel? filter) getPreviousSession,
    required TResult Function(SessionFilterModel? filter) getUpcomingSession,
    required TResult Function(String sessionID) deleteSession,
    required TResult Function(List<Date> timeList) validateSelectedTime,
    required TResult Function(String sessionID) viewSession,
    required TResult Function(SessionModel model, String referenceID)
        updateSession,
    required TResult Function(RatingModel model, String id) putRating,
  }) {
    return addSession(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SessionModel model)? addSession,
    TResult? Function(SessionFilterModel? filter)? getSession,
    TResult? Function(SessionFilterModel? filter)? getPreviousSession,
    TResult? Function(SessionFilterModel? filter)? getUpcomingSession,
    TResult? Function(String sessionID)? deleteSession,
    TResult? Function(List<Date> timeList)? validateSelectedTime,
    TResult? Function(String sessionID)? viewSession,
    TResult? Function(SessionModel model, String referenceID)? updateSession,
    TResult? Function(RatingModel model, String id)? putRating,
  }) {
    return addSession?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SessionModel model)? addSession,
    TResult Function(SessionFilterModel? filter)? getSession,
    TResult Function(SessionFilterModel? filter)? getPreviousSession,
    TResult Function(SessionFilterModel? filter)? getUpcomingSession,
    TResult Function(String sessionID)? deleteSession,
    TResult Function(List<Date> timeList)? validateSelectedTime,
    TResult Function(String sessionID)? viewSession,
    TResult Function(SessionModel model, String referenceID)? updateSession,
    TResult Function(RatingModel model, String id)? putRating,
    required TResult orElse(),
  }) {
    if (addSession != null) {
      return addSession(model);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_onAddSession value) addSession,
    required TResult Function(_onGetSession value) getSession,
    required TResult Function(_onGetPreviousSession value) getPreviousSession,
    required TResult Function(_onGetUpcomingSession value) getUpcomingSession,
    required TResult Function(_onDeleteSession value) deleteSession,
    required TResult Function(_onvalidateSelectedTime value)
        validateSelectedTime,
    required TResult Function(_onViewSession value) viewSession,
    required TResult Function(_onUpdateSession value) updateSession,
    required TResult Function(_onPutRating value) putRating,
  }) {
    return addSession(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_onAddSession value)? addSession,
    TResult? Function(_onGetSession value)? getSession,
    TResult? Function(_onGetPreviousSession value)? getPreviousSession,
    TResult? Function(_onGetUpcomingSession value)? getUpcomingSession,
    TResult? Function(_onDeleteSession value)? deleteSession,
    TResult? Function(_onvalidateSelectedTime value)? validateSelectedTime,
    TResult? Function(_onViewSession value)? viewSession,
    TResult? Function(_onUpdateSession value)? updateSession,
    TResult? Function(_onPutRating value)? putRating,
  }) {
    return addSession?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_onAddSession value)? addSession,
    TResult Function(_onGetSession value)? getSession,
    TResult Function(_onGetPreviousSession value)? getPreviousSession,
    TResult Function(_onGetUpcomingSession value)? getUpcomingSession,
    TResult Function(_onDeleteSession value)? deleteSession,
    TResult Function(_onvalidateSelectedTime value)? validateSelectedTime,
    TResult Function(_onViewSession value)? viewSession,
    TResult Function(_onUpdateSession value)? updateSession,
    TResult Function(_onPutRating value)? putRating,
    required TResult orElse(),
  }) {
    if (addSession != null) {
      return addSession(this);
    }
    return orElse();
  }
}

abstract class _onAddSession implements SessionEvent {
  const factory _onAddSession(final SessionModel model) = _$onAddSessionImpl;

  SessionModel get model;
  @JsonKey(ignore: true)
  _$$onAddSessionImplCopyWith<_$onAddSessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$onGetSessionImplCopyWith<$Res> {
  factory _$$onGetSessionImplCopyWith(
          _$onGetSessionImpl value, $Res Function(_$onGetSessionImpl) then) =
      __$$onGetSessionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SessionFilterModel? filter});
}

/// @nodoc
class __$$onGetSessionImplCopyWithImpl<$Res>
    extends _$SessionEventCopyWithImpl<$Res, _$onGetSessionImpl>
    implements _$$onGetSessionImplCopyWith<$Res> {
  __$$onGetSessionImplCopyWithImpl(
      _$onGetSessionImpl _value, $Res Function(_$onGetSessionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filter = freezed,
  }) {
    return _then(_$onGetSessionImpl(
      filter: freezed == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as SessionFilterModel?,
    ));
  }
}

/// @nodoc

class _$onGetSessionImpl implements _onGetSession {
  const _$onGetSessionImpl({this.filter});

  @override
  final SessionFilterModel? filter;

  @override
  String toString() {
    return 'SessionEvent.getSession(filter: $filter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$onGetSessionImpl &&
            (identical(other.filter, filter) || other.filter == filter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$onGetSessionImplCopyWith<_$onGetSessionImpl> get copyWith =>
      __$$onGetSessionImplCopyWithImpl<_$onGetSessionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SessionModel model) addSession,
    required TResult Function(SessionFilterModel? filter) getSession,
    required TResult Function(SessionFilterModel? filter) getPreviousSession,
    required TResult Function(SessionFilterModel? filter) getUpcomingSession,
    required TResult Function(String sessionID) deleteSession,
    required TResult Function(List<Date> timeList) validateSelectedTime,
    required TResult Function(String sessionID) viewSession,
    required TResult Function(SessionModel model, String referenceID)
        updateSession,
    required TResult Function(RatingModel model, String id) putRating,
  }) {
    return getSession(filter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SessionModel model)? addSession,
    TResult? Function(SessionFilterModel? filter)? getSession,
    TResult? Function(SessionFilterModel? filter)? getPreviousSession,
    TResult? Function(SessionFilterModel? filter)? getUpcomingSession,
    TResult? Function(String sessionID)? deleteSession,
    TResult? Function(List<Date> timeList)? validateSelectedTime,
    TResult? Function(String sessionID)? viewSession,
    TResult? Function(SessionModel model, String referenceID)? updateSession,
    TResult? Function(RatingModel model, String id)? putRating,
  }) {
    return getSession?.call(filter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SessionModel model)? addSession,
    TResult Function(SessionFilterModel? filter)? getSession,
    TResult Function(SessionFilterModel? filter)? getPreviousSession,
    TResult Function(SessionFilterModel? filter)? getUpcomingSession,
    TResult Function(String sessionID)? deleteSession,
    TResult Function(List<Date> timeList)? validateSelectedTime,
    TResult Function(String sessionID)? viewSession,
    TResult Function(SessionModel model, String referenceID)? updateSession,
    TResult Function(RatingModel model, String id)? putRating,
    required TResult orElse(),
  }) {
    if (getSession != null) {
      return getSession(filter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_onAddSession value) addSession,
    required TResult Function(_onGetSession value) getSession,
    required TResult Function(_onGetPreviousSession value) getPreviousSession,
    required TResult Function(_onGetUpcomingSession value) getUpcomingSession,
    required TResult Function(_onDeleteSession value) deleteSession,
    required TResult Function(_onvalidateSelectedTime value)
        validateSelectedTime,
    required TResult Function(_onViewSession value) viewSession,
    required TResult Function(_onUpdateSession value) updateSession,
    required TResult Function(_onPutRating value) putRating,
  }) {
    return getSession(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_onAddSession value)? addSession,
    TResult? Function(_onGetSession value)? getSession,
    TResult? Function(_onGetPreviousSession value)? getPreviousSession,
    TResult? Function(_onGetUpcomingSession value)? getUpcomingSession,
    TResult? Function(_onDeleteSession value)? deleteSession,
    TResult? Function(_onvalidateSelectedTime value)? validateSelectedTime,
    TResult? Function(_onViewSession value)? viewSession,
    TResult? Function(_onUpdateSession value)? updateSession,
    TResult? Function(_onPutRating value)? putRating,
  }) {
    return getSession?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_onAddSession value)? addSession,
    TResult Function(_onGetSession value)? getSession,
    TResult Function(_onGetPreviousSession value)? getPreviousSession,
    TResult Function(_onGetUpcomingSession value)? getUpcomingSession,
    TResult Function(_onDeleteSession value)? deleteSession,
    TResult Function(_onvalidateSelectedTime value)? validateSelectedTime,
    TResult Function(_onViewSession value)? viewSession,
    TResult Function(_onUpdateSession value)? updateSession,
    TResult Function(_onPutRating value)? putRating,
    required TResult orElse(),
  }) {
    if (getSession != null) {
      return getSession(this);
    }
    return orElse();
  }
}

abstract class _onGetSession implements SessionEvent {
  const factory _onGetSession({final SessionFilterModel? filter}) =
      _$onGetSessionImpl;

  SessionFilterModel? get filter;
  @JsonKey(ignore: true)
  _$$onGetSessionImplCopyWith<_$onGetSessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$onGetPreviousSessionImplCopyWith<$Res> {
  factory _$$onGetPreviousSessionImplCopyWith(_$onGetPreviousSessionImpl value,
          $Res Function(_$onGetPreviousSessionImpl) then) =
      __$$onGetPreviousSessionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SessionFilterModel? filter});
}

/// @nodoc
class __$$onGetPreviousSessionImplCopyWithImpl<$Res>
    extends _$SessionEventCopyWithImpl<$Res, _$onGetPreviousSessionImpl>
    implements _$$onGetPreviousSessionImplCopyWith<$Res> {
  __$$onGetPreviousSessionImplCopyWithImpl(_$onGetPreviousSessionImpl _value,
      $Res Function(_$onGetPreviousSessionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filter = freezed,
  }) {
    return _then(_$onGetPreviousSessionImpl(
      filter: freezed == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as SessionFilterModel?,
    ));
  }
}

/// @nodoc

class _$onGetPreviousSessionImpl implements _onGetPreviousSession {
  const _$onGetPreviousSessionImpl({this.filter});

  @override
  final SessionFilterModel? filter;

  @override
  String toString() {
    return 'SessionEvent.getPreviousSession(filter: $filter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$onGetPreviousSessionImpl &&
            (identical(other.filter, filter) || other.filter == filter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$onGetPreviousSessionImplCopyWith<_$onGetPreviousSessionImpl>
      get copyWith =>
          __$$onGetPreviousSessionImplCopyWithImpl<_$onGetPreviousSessionImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SessionModel model) addSession,
    required TResult Function(SessionFilterModel? filter) getSession,
    required TResult Function(SessionFilterModel? filter) getPreviousSession,
    required TResult Function(SessionFilterModel? filter) getUpcomingSession,
    required TResult Function(String sessionID) deleteSession,
    required TResult Function(List<Date> timeList) validateSelectedTime,
    required TResult Function(String sessionID) viewSession,
    required TResult Function(SessionModel model, String referenceID)
        updateSession,
    required TResult Function(RatingModel model, String id) putRating,
  }) {
    return getPreviousSession(filter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SessionModel model)? addSession,
    TResult? Function(SessionFilterModel? filter)? getSession,
    TResult? Function(SessionFilterModel? filter)? getPreviousSession,
    TResult? Function(SessionFilterModel? filter)? getUpcomingSession,
    TResult? Function(String sessionID)? deleteSession,
    TResult? Function(List<Date> timeList)? validateSelectedTime,
    TResult? Function(String sessionID)? viewSession,
    TResult? Function(SessionModel model, String referenceID)? updateSession,
    TResult? Function(RatingModel model, String id)? putRating,
  }) {
    return getPreviousSession?.call(filter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SessionModel model)? addSession,
    TResult Function(SessionFilterModel? filter)? getSession,
    TResult Function(SessionFilterModel? filter)? getPreviousSession,
    TResult Function(SessionFilterModel? filter)? getUpcomingSession,
    TResult Function(String sessionID)? deleteSession,
    TResult Function(List<Date> timeList)? validateSelectedTime,
    TResult Function(String sessionID)? viewSession,
    TResult Function(SessionModel model, String referenceID)? updateSession,
    TResult Function(RatingModel model, String id)? putRating,
    required TResult orElse(),
  }) {
    if (getPreviousSession != null) {
      return getPreviousSession(filter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_onAddSession value) addSession,
    required TResult Function(_onGetSession value) getSession,
    required TResult Function(_onGetPreviousSession value) getPreviousSession,
    required TResult Function(_onGetUpcomingSession value) getUpcomingSession,
    required TResult Function(_onDeleteSession value) deleteSession,
    required TResult Function(_onvalidateSelectedTime value)
        validateSelectedTime,
    required TResult Function(_onViewSession value) viewSession,
    required TResult Function(_onUpdateSession value) updateSession,
    required TResult Function(_onPutRating value) putRating,
  }) {
    return getPreviousSession(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_onAddSession value)? addSession,
    TResult? Function(_onGetSession value)? getSession,
    TResult? Function(_onGetPreviousSession value)? getPreviousSession,
    TResult? Function(_onGetUpcomingSession value)? getUpcomingSession,
    TResult? Function(_onDeleteSession value)? deleteSession,
    TResult? Function(_onvalidateSelectedTime value)? validateSelectedTime,
    TResult? Function(_onViewSession value)? viewSession,
    TResult? Function(_onUpdateSession value)? updateSession,
    TResult? Function(_onPutRating value)? putRating,
  }) {
    return getPreviousSession?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_onAddSession value)? addSession,
    TResult Function(_onGetSession value)? getSession,
    TResult Function(_onGetPreviousSession value)? getPreviousSession,
    TResult Function(_onGetUpcomingSession value)? getUpcomingSession,
    TResult Function(_onDeleteSession value)? deleteSession,
    TResult Function(_onvalidateSelectedTime value)? validateSelectedTime,
    TResult Function(_onViewSession value)? viewSession,
    TResult Function(_onUpdateSession value)? updateSession,
    TResult Function(_onPutRating value)? putRating,
    required TResult orElse(),
  }) {
    if (getPreviousSession != null) {
      return getPreviousSession(this);
    }
    return orElse();
  }
}

abstract class _onGetPreviousSession implements SessionEvent {
  const factory _onGetPreviousSession({final SessionFilterModel? filter}) =
      _$onGetPreviousSessionImpl;

  SessionFilterModel? get filter;
  @JsonKey(ignore: true)
  _$$onGetPreviousSessionImplCopyWith<_$onGetPreviousSessionImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$onGetUpcomingSessionImplCopyWith<$Res> {
  factory _$$onGetUpcomingSessionImplCopyWith(_$onGetUpcomingSessionImpl value,
          $Res Function(_$onGetUpcomingSessionImpl) then) =
      __$$onGetUpcomingSessionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SessionFilterModel? filter});
}

/// @nodoc
class __$$onGetUpcomingSessionImplCopyWithImpl<$Res>
    extends _$SessionEventCopyWithImpl<$Res, _$onGetUpcomingSessionImpl>
    implements _$$onGetUpcomingSessionImplCopyWith<$Res> {
  __$$onGetUpcomingSessionImplCopyWithImpl(_$onGetUpcomingSessionImpl _value,
      $Res Function(_$onGetUpcomingSessionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filter = freezed,
  }) {
    return _then(_$onGetUpcomingSessionImpl(
      filter: freezed == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as SessionFilterModel?,
    ));
  }
}

/// @nodoc

class _$onGetUpcomingSessionImpl implements _onGetUpcomingSession {
  const _$onGetUpcomingSessionImpl({this.filter});

  @override
  final SessionFilterModel? filter;

  @override
  String toString() {
    return 'SessionEvent.getUpcomingSession(filter: $filter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$onGetUpcomingSessionImpl &&
            (identical(other.filter, filter) || other.filter == filter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$onGetUpcomingSessionImplCopyWith<_$onGetUpcomingSessionImpl>
      get copyWith =>
          __$$onGetUpcomingSessionImplCopyWithImpl<_$onGetUpcomingSessionImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SessionModel model) addSession,
    required TResult Function(SessionFilterModel? filter) getSession,
    required TResult Function(SessionFilterModel? filter) getPreviousSession,
    required TResult Function(SessionFilterModel? filter) getUpcomingSession,
    required TResult Function(String sessionID) deleteSession,
    required TResult Function(List<Date> timeList) validateSelectedTime,
    required TResult Function(String sessionID) viewSession,
    required TResult Function(SessionModel model, String referenceID)
        updateSession,
    required TResult Function(RatingModel model, String id) putRating,
  }) {
    return getUpcomingSession(filter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SessionModel model)? addSession,
    TResult? Function(SessionFilterModel? filter)? getSession,
    TResult? Function(SessionFilterModel? filter)? getPreviousSession,
    TResult? Function(SessionFilterModel? filter)? getUpcomingSession,
    TResult? Function(String sessionID)? deleteSession,
    TResult? Function(List<Date> timeList)? validateSelectedTime,
    TResult? Function(String sessionID)? viewSession,
    TResult? Function(SessionModel model, String referenceID)? updateSession,
    TResult? Function(RatingModel model, String id)? putRating,
  }) {
    return getUpcomingSession?.call(filter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SessionModel model)? addSession,
    TResult Function(SessionFilterModel? filter)? getSession,
    TResult Function(SessionFilterModel? filter)? getPreviousSession,
    TResult Function(SessionFilterModel? filter)? getUpcomingSession,
    TResult Function(String sessionID)? deleteSession,
    TResult Function(List<Date> timeList)? validateSelectedTime,
    TResult Function(String sessionID)? viewSession,
    TResult Function(SessionModel model, String referenceID)? updateSession,
    TResult Function(RatingModel model, String id)? putRating,
    required TResult orElse(),
  }) {
    if (getUpcomingSession != null) {
      return getUpcomingSession(filter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_onAddSession value) addSession,
    required TResult Function(_onGetSession value) getSession,
    required TResult Function(_onGetPreviousSession value) getPreviousSession,
    required TResult Function(_onGetUpcomingSession value) getUpcomingSession,
    required TResult Function(_onDeleteSession value) deleteSession,
    required TResult Function(_onvalidateSelectedTime value)
        validateSelectedTime,
    required TResult Function(_onViewSession value) viewSession,
    required TResult Function(_onUpdateSession value) updateSession,
    required TResult Function(_onPutRating value) putRating,
  }) {
    return getUpcomingSession(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_onAddSession value)? addSession,
    TResult? Function(_onGetSession value)? getSession,
    TResult? Function(_onGetPreviousSession value)? getPreviousSession,
    TResult? Function(_onGetUpcomingSession value)? getUpcomingSession,
    TResult? Function(_onDeleteSession value)? deleteSession,
    TResult? Function(_onvalidateSelectedTime value)? validateSelectedTime,
    TResult? Function(_onViewSession value)? viewSession,
    TResult? Function(_onUpdateSession value)? updateSession,
    TResult? Function(_onPutRating value)? putRating,
  }) {
    return getUpcomingSession?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_onAddSession value)? addSession,
    TResult Function(_onGetSession value)? getSession,
    TResult Function(_onGetPreviousSession value)? getPreviousSession,
    TResult Function(_onGetUpcomingSession value)? getUpcomingSession,
    TResult Function(_onDeleteSession value)? deleteSession,
    TResult Function(_onvalidateSelectedTime value)? validateSelectedTime,
    TResult Function(_onViewSession value)? viewSession,
    TResult Function(_onUpdateSession value)? updateSession,
    TResult Function(_onPutRating value)? putRating,
    required TResult orElse(),
  }) {
    if (getUpcomingSession != null) {
      return getUpcomingSession(this);
    }
    return orElse();
  }
}

abstract class _onGetUpcomingSession implements SessionEvent {
  const factory _onGetUpcomingSession({final SessionFilterModel? filter}) =
      _$onGetUpcomingSessionImpl;

  SessionFilterModel? get filter;
  @JsonKey(ignore: true)
  _$$onGetUpcomingSessionImplCopyWith<_$onGetUpcomingSessionImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$onDeleteSessionImplCopyWith<$Res> {
  factory _$$onDeleteSessionImplCopyWith(_$onDeleteSessionImpl value,
          $Res Function(_$onDeleteSessionImpl) then) =
      __$$onDeleteSessionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String sessionID});
}

/// @nodoc
class __$$onDeleteSessionImplCopyWithImpl<$Res>
    extends _$SessionEventCopyWithImpl<$Res, _$onDeleteSessionImpl>
    implements _$$onDeleteSessionImplCopyWith<$Res> {
  __$$onDeleteSessionImplCopyWithImpl(
      _$onDeleteSessionImpl _value, $Res Function(_$onDeleteSessionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionID = null,
  }) {
    return _then(_$onDeleteSessionImpl(
      null == sessionID
          ? _value.sessionID
          : sessionID // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$onDeleteSessionImpl implements _onDeleteSession {
  const _$onDeleteSessionImpl(this.sessionID);

  @override
  final String sessionID;

  @override
  String toString() {
    return 'SessionEvent.deleteSession(sessionID: $sessionID)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$onDeleteSessionImpl &&
            (identical(other.sessionID, sessionID) ||
                other.sessionID == sessionID));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sessionID);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$onDeleteSessionImplCopyWith<_$onDeleteSessionImpl> get copyWith =>
      __$$onDeleteSessionImplCopyWithImpl<_$onDeleteSessionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SessionModel model) addSession,
    required TResult Function(SessionFilterModel? filter) getSession,
    required TResult Function(SessionFilterModel? filter) getPreviousSession,
    required TResult Function(SessionFilterModel? filter) getUpcomingSession,
    required TResult Function(String sessionID) deleteSession,
    required TResult Function(List<Date> timeList) validateSelectedTime,
    required TResult Function(String sessionID) viewSession,
    required TResult Function(SessionModel model, String referenceID)
        updateSession,
    required TResult Function(RatingModel model, String id) putRating,
  }) {
    return deleteSession(sessionID);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SessionModel model)? addSession,
    TResult? Function(SessionFilterModel? filter)? getSession,
    TResult? Function(SessionFilterModel? filter)? getPreviousSession,
    TResult? Function(SessionFilterModel? filter)? getUpcomingSession,
    TResult? Function(String sessionID)? deleteSession,
    TResult? Function(List<Date> timeList)? validateSelectedTime,
    TResult? Function(String sessionID)? viewSession,
    TResult? Function(SessionModel model, String referenceID)? updateSession,
    TResult? Function(RatingModel model, String id)? putRating,
  }) {
    return deleteSession?.call(sessionID);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SessionModel model)? addSession,
    TResult Function(SessionFilterModel? filter)? getSession,
    TResult Function(SessionFilterModel? filter)? getPreviousSession,
    TResult Function(SessionFilterModel? filter)? getUpcomingSession,
    TResult Function(String sessionID)? deleteSession,
    TResult Function(List<Date> timeList)? validateSelectedTime,
    TResult Function(String sessionID)? viewSession,
    TResult Function(SessionModel model, String referenceID)? updateSession,
    TResult Function(RatingModel model, String id)? putRating,
    required TResult orElse(),
  }) {
    if (deleteSession != null) {
      return deleteSession(sessionID);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_onAddSession value) addSession,
    required TResult Function(_onGetSession value) getSession,
    required TResult Function(_onGetPreviousSession value) getPreviousSession,
    required TResult Function(_onGetUpcomingSession value) getUpcomingSession,
    required TResult Function(_onDeleteSession value) deleteSession,
    required TResult Function(_onvalidateSelectedTime value)
        validateSelectedTime,
    required TResult Function(_onViewSession value) viewSession,
    required TResult Function(_onUpdateSession value) updateSession,
    required TResult Function(_onPutRating value) putRating,
  }) {
    return deleteSession(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_onAddSession value)? addSession,
    TResult? Function(_onGetSession value)? getSession,
    TResult? Function(_onGetPreviousSession value)? getPreviousSession,
    TResult? Function(_onGetUpcomingSession value)? getUpcomingSession,
    TResult? Function(_onDeleteSession value)? deleteSession,
    TResult? Function(_onvalidateSelectedTime value)? validateSelectedTime,
    TResult? Function(_onViewSession value)? viewSession,
    TResult? Function(_onUpdateSession value)? updateSession,
    TResult? Function(_onPutRating value)? putRating,
  }) {
    return deleteSession?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_onAddSession value)? addSession,
    TResult Function(_onGetSession value)? getSession,
    TResult Function(_onGetPreviousSession value)? getPreviousSession,
    TResult Function(_onGetUpcomingSession value)? getUpcomingSession,
    TResult Function(_onDeleteSession value)? deleteSession,
    TResult Function(_onvalidateSelectedTime value)? validateSelectedTime,
    TResult Function(_onViewSession value)? viewSession,
    TResult Function(_onUpdateSession value)? updateSession,
    TResult Function(_onPutRating value)? putRating,
    required TResult orElse(),
  }) {
    if (deleteSession != null) {
      return deleteSession(this);
    }
    return orElse();
  }
}

abstract class _onDeleteSession implements SessionEvent {
  const factory _onDeleteSession(final String sessionID) =
      _$onDeleteSessionImpl;

  String get sessionID;
  @JsonKey(ignore: true)
  _$$onDeleteSessionImplCopyWith<_$onDeleteSessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$onvalidateSelectedTimeImplCopyWith<$Res> {
  factory _$$onvalidateSelectedTimeImplCopyWith(
          _$onvalidateSelectedTimeImpl value,
          $Res Function(_$onvalidateSelectedTimeImpl) then) =
      __$$onvalidateSelectedTimeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Date> timeList});
}

/// @nodoc
class __$$onvalidateSelectedTimeImplCopyWithImpl<$Res>
    extends _$SessionEventCopyWithImpl<$Res, _$onvalidateSelectedTimeImpl>
    implements _$$onvalidateSelectedTimeImplCopyWith<$Res> {
  __$$onvalidateSelectedTimeImplCopyWithImpl(
      _$onvalidateSelectedTimeImpl _value,
      $Res Function(_$onvalidateSelectedTimeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timeList = null,
  }) {
    return _then(_$onvalidateSelectedTimeImpl(
      null == timeList
          ? _value._timeList
          : timeList // ignore: cast_nullable_to_non_nullable
              as List<Date>,
    ));
  }
}

/// @nodoc

class _$onvalidateSelectedTimeImpl implements _onvalidateSelectedTime {
  const _$onvalidateSelectedTimeImpl(final List<Date> timeList)
      : _timeList = timeList;

  final List<Date> _timeList;
  @override
  List<Date> get timeList {
    if (_timeList is EqualUnmodifiableListView) return _timeList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_timeList);
  }

  @override
  String toString() {
    return 'SessionEvent.validateSelectedTime(timeList: $timeList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$onvalidateSelectedTimeImpl &&
            const DeepCollectionEquality().equals(other._timeList, _timeList));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_timeList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$onvalidateSelectedTimeImplCopyWith<_$onvalidateSelectedTimeImpl>
      get copyWith => __$$onvalidateSelectedTimeImplCopyWithImpl<
          _$onvalidateSelectedTimeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SessionModel model) addSession,
    required TResult Function(SessionFilterModel? filter) getSession,
    required TResult Function(SessionFilterModel? filter) getPreviousSession,
    required TResult Function(SessionFilterModel? filter) getUpcomingSession,
    required TResult Function(String sessionID) deleteSession,
    required TResult Function(List<Date> timeList) validateSelectedTime,
    required TResult Function(String sessionID) viewSession,
    required TResult Function(SessionModel model, String referenceID)
        updateSession,
    required TResult Function(RatingModel model, String id) putRating,
  }) {
    return validateSelectedTime(timeList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SessionModel model)? addSession,
    TResult? Function(SessionFilterModel? filter)? getSession,
    TResult? Function(SessionFilterModel? filter)? getPreviousSession,
    TResult? Function(SessionFilterModel? filter)? getUpcomingSession,
    TResult? Function(String sessionID)? deleteSession,
    TResult? Function(List<Date> timeList)? validateSelectedTime,
    TResult? Function(String sessionID)? viewSession,
    TResult? Function(SessionModel model, String referenceID)? updateSession,
    TResult? Function(RatingModel model, String id)? putRating,
  }) {
    return validateSelectedTime?.call(timeList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SessionModel model)? addSession,
    TResult Function(SessionFilterModel? filter)? getSession,
    TResult Function(SessionFilterModel? filter)? getPreviousSession,
    TResult Function(SessionFilterModel? filter)? getUpcomingSession,
    TResult Function(String sessionID)? deleteSession,
    TResult Function(List<Date> timeList)? validateSelectedTime,
    TResult Function(String sessionID)? viewSession,
    TResult Function(SessionModel model, String referenceID)? updateSession,
    TResult Function(RatingModel model, String id)? putRating,
    required TResult orElse(),
  }) {
    if (validateSelectedTime != null) {
      return validateSelectedTime(timeList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_onAddSession value) addSession,
    required TResult Function(_onGetSession value) getSession,
    required TResult Function(_onGetPreviousSession value) getPreviousSession,
    required TResult Function(_onGetUpcomingSession value) getUpcomingSession,
    required TResult Function(_onDeleteSession value) deleteSession,
    required TResult Function(_onvalidateSelectedTime value)
        validateSelectedTime,
    required TResult Function(_onViewSession value) viewSession,
    required TResult Function(_onUpdateSession value) updateSession,
    required TResult Function(_onPutRating value) putRating,
  }) {
    return validateSelectedTime(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_onAddSession value)? addSession,
    TResult? Function(_onGetSession value)? getSession,
    TResult? Function(_onGetPreviousSession value)? getPreviousSession,
    TResult? Function(_onGetUpcomingSession value)? getUpcomingSession,
    TResult? Function(_onDeleteSession value)? deleteSession,
    TResult? Function(_onvalidateSelectedTime value)? validateSelectedTime,
    TResult? Function(_onViewSession value)? viewSession,
    TResult? Function(_onUpdateSession value)? updateSession,
    TResult? Function(_onPutRating value)? putRating,
  }) {
    return validateSelectedTime?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_onAddSession value)? addSession,
    TResult Function(_onGetSession value)? getSession,
    TResult Function(_onGetPreviousSession value)? getPreviousSession,
    TResult Function(_onGetUpcomingSession value)? getUpcomingSession,
    TResult Function(_onDeleteSession value)? deleteSession,
    TResult Function(_onvalidateSelectedTime value)? validateSelectedTime,
    TResult Function(_onViewSession value)? viewSession,
    TResult Function(_onUpdateSession value)? updateSession,
    TResult Function(_onPutRating value)? putRating,
    required TResult orElse(),
  }) {
    if (validateSelectedTime != null) {
      return validateSelectedTime(this);
    }
    return orElse();
  }
}

abstract class _onvalidateSelectedTime implements SessionEvent {
  const factory _onvalidateSelectedTime(final List<Date> timeList) =
      _$onvalidateSelectedTimeImpl;

  List<Date> get timeList;
  @JsonKey(ignore: true)
  _$$onvalidateSelectedTimeImplCopyWith<_$onvalidateSelectedTimeImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$onViewSessionImplCopyWith<$Res> {
  factory _$$onViewSessionImplCopyWith(
          _$onViewSessionImpl value, $Res Function(_$onViewSessionImpl) then) =
      __$$onViewSessionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String sessionID});
}

/// @nodoc
class __$$onViewSessionImplCopyWithImpl<$Res>
    extends _$SessionEventCopyWithImpl<$Res, _$onViewSessionImpl>
    implements _$$onViewSessionImplCopyWith<$Res> {
  __$$onViewSessionImplCopyWithImpl(
      _$onViewSessionImpl _value, $Res Function(_$onViewSessionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionID = null,
  }) {
    return _then(_$onViewSessionImpl(
      null == sessionID
          ? _value.sessionID
          : sessionID // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$onViewSessionImpl implements _onViewSession {
  const _$onViewSessionImpl(this.sessionID);

  @override
  final String sessionID;

  @override
  String toString() {
    return 'SessionEvent.viewSession(sessionID: $sessionID)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$onViewSessionImpl &&
            (identical(other.sessionID, sessionID) ||
                other.sessionID == sessionID));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sessionID);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$onViewSessionImplCopyWith<_$onViewSessionImpl> get copyWith =>
      __$$onViewSessionImplCopyWithImpl<_$onViewSessionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SessionModel model) addSession,
    required TResult Function(SessionFilterModel? filter) getSession,
    required TResult Function(SessionFilterModel? filter) getPreviousSession,
    required TResult Function(SessionFilterModel? filter) getUpcomingSession,
    required TResult Function(String sessionID) deleteSession,
    required TResult Function(List<Date> timeList) validateSelectedTime,
    required TResult Function(String sessionID) viewSession,
    required TResult Function(SessionModel model, String referenceID)
        updateSession,
    required TResult Function(RatingModel model, String id) putRating,
  }) {
    return viewSession(sessionID);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SessionModel model)? addSession,
    TResult? Function(SessionFilterModel? filter)? getSession,
    TResult? Function(SessionFilterModel? filter)? getPreviousSession,
    TResult? Function(SessionFilterModel? filter)? getUpcomingSession,
    TResult? Function(String sessionID)? deleteSession,
    TResult? Function(List<Date> timeList)? validateSelectedTime,
    TResult? Function(String sessionID)? viewSession,
    TResult? Function(SessionModel model, String referenceID)? updateSession,
    TResult? Function(RatingModel model, String id)? putRating,
  }) {
    return viewSession?.call(sessionID);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SessionModel model)? addSession,
    TResult Function(SessionFilterModel? filter)? getSession,
    TResult Function(SessionFilterModel? filter)? getPreviousSession,
    TResult Function(SessionFilterModel? filter)? getUpcomingSession,
    TResult Function(String sessionID)? deleteSession,
    TResult Function(List<Date> timeList)? validateSelectedTime,
    TResult Function(String sessionID)? viewSession,
    TResult Function(SessionModel model, String referenceID)? updateSession,
    TResult Function(RatingModel model, String id)? putRating,
    required TResult orElse(),
  }) {
    if (viewSession != null) {
      return viewSession(sessionID);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_onAddSession value) addSession,
    required TResult Function(_onGetSession value) getSession,
    required TResult Function(_onGetPreviousSession value) getPreviousSession,
    required TResult Function(_onGetUpcomingSession value) getUpcomingSession,
    required TResult Function(_onDeleteSession value) deleteSession,
    required TResult Function(_onvalidateSelectedTime value)
        validateSelectedTime,
    required TResult Function(_onViewSession value) viewSession,
    required TResult Function(_onUpdateSession value) updateSession,
    required TResult Function(_onPutRating value) putRating,
  }) {
    return viewSession(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_onAddSession value)? addSession,
    TResult? Function(_onGetSession value)? getSession,
    TResult? Function(_onGetPreviousSession value)? getPreviousSession,
    TResult? Function(_onGetUpcomingSession value)? getUpcomingSession,
    TResult? Function(_onDeleteSession value)? deleteSession,
    TResult? Function(_onvalidateSelectedTime value)? validateSelectedTime,
    TResult? Function(_onViewSession value)? viewSession,
    TResult? Function(_onUpdateSession value)? updateSession,
    TResult? Function(_onPutRating value)? putRating,
  }) {
    return viewSession?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_onAddSession value)? addSession,
    TResult Function(_onGetSession value)? getSession,
    TResult Function(_onGetPreviousSession value)? getPreviousSession,
    TResult Function(_onGetUpcomingSession value)? getUpcomingSession,
    TResult Function(_onDeleteSession value)? deleteSession,
    TResult Function(_onvalidateSelectedTime value)? validateSelectedTime,
    TResult Function(_onViewSession value)? viewSession,
    TResult Function(_onUpdateSession value)? updateSession,
    TResult Function(_onPutRating value)? putRating,
    required TResult orElse(),
  }) {
    if (viewSession != null) {
      return viewSession(this);
    }
    return orElse();
  }
}

abstract class _onViewSession implements SessionEvent {
  const factory _onViewSession(final String sessionID) = _$onViewSessionImpl;

  String get sessionID;
  @JsonKey(ignore: true)
  _$$onViewSessionImplCopyWith<_$onViewSessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$onUpdateSessionImplCopyWith<$Res> {
  factory _$$onUpdateSessionImplCopyWith(_$onUpdateSessionImpl value,
          $Res Function(_$onUpdateSessionImpl) then) =
      __$$onUpdateSessionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SessionModel model, String referenceID});
}

/// @nodoc
class __$$onUpdateSessionImplCopyWithImpl<$Res>
    extends _$SessionEventCopyWithImpl<$Res, _$onUpdateSessionImpl>
    implements _$$onUpdateSessionImplCopyWith<$Res> {
  __$$onUpdateSessionImplCopyWithImpl(
      _$onUpdateSessionImpl _value, $Res Function(_$onUpdateSessionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
    Object? referenceID = null,
  }) {
    return _then(_$onUpdateSessionImpl(
      null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as SessionModel,
      null == referenceID
          ? _value.referenceID
          : referenceID // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$onUpdateSessionImpl implements _onUpdateSession {
  const _$onUpdateSessionImpl(this.model, this.referenceID);

  @override
  final SessionModel model;
  @override
  final String referenceID;

  @override
  String toString() {
    return 'SessionEvent.updateSession(model: $model, referenceID: $referenceID)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$onUpdateSessionImpl &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.referenceID, referenceID) ||
                other.referenceID == referenceID));
  }

  @override
  int get hashCode => Object.hash(runtimeType, model, referenceID);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$onUpdateSessionImplCopyWith<_$onUpdateSessionImpl> get copyWith =>
      __$$onUpdateSessionImplCopyWithImpl<_$onUpdateSessionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SessionModel model) addSession,
    required TResult Function(SessionFilterModel? filter) getSession,
    required TResult Function(SessionFilterModel? filter) getPreviousSession,
    required TResult Function(SessionFilterModel? filter) getUpcomingSession,
    required TResult Function(String sessionID) deleteSession,
    required TResult Function(List<Date> timeList) validateSelectedTime,
    required TResult Function(String sessionID) viewSession,
    required TResult Function(SessionModel model, String referenceID)
        updateSession,
    required TResult Function(RatingModel model, String id) putRating,
  }) {
    return updateSession(model, referenceID);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SessionModel model)? addSession,
    TResult? Function(SessionFilterModel? filter)? getSession,
    TResult? Function(SessionFilterModel? filter)? getPreviousSession,
    TResult? Function(SessionFilterModel? filter)? getUpcomingSession,
    TResult? Function(String sessionID)? deleteSession,
    TResult? Function(List<Date> timeList)? validateSelectedTime,
    TResult? Function(String sessionID)? viewSession,
    TResult? Function(SessionModel model, String referenceID)? updateSession,
    TResult? Function(RatingModel model, String id)? putRating,
  }) {
    return updateSession?.call(model, referenceID);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SessionModel model)? addSession,
    TResult Function(SessionFilterModel? filter)? getSession,
    TResult Function(SessionFilterModel? filter)? getPreviousSession,
    TResult Function(SessionFilterModel? filter)? getUpcomingSession,
    TResult Function(String sessionID)? deleteSession,
    TResult Function(List<Date> timeList)? validateSelectedTime,
    TResult Function(String sessionID)? viewSession,
    TResult Function(SessionModel model, String referenceID)? updateSession,
    TResult Function(RatingModel model, String id)? putRating,
    required TResult orElse(),
  }) {
    if (updateSession != null) {
      return updateSession(model, referenceID);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_onAddSession value) addSession,
    required TResult Function(_onGetSession value) getSession,
    required TResult Function(_onGetPreviousSession value) getPreviousSession,
    required TResult Function(_onGetUpcomingSession value) getUpcomingSession,
    required TResult Function(_onDeleteSession value) deleteSession,
    required TResult Function(_onvalidateSelectedTime value)
        validateSelectedTime,
    required TResult Function(_onViewSession value) viewSession,
    required TResult Function(_onUpdateSession value) updateSession,
    required TResult Function(_onPutRating value) putRating,
  }) {
    return updateSession(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_onAddSession value)? addSession,
    TResult? Function(_onGetSession value)? getSession,
    TResult? Function(_onGetPreviousSession value)? getPreviousSession,
    TResult? Function(_onGetUpcomingSession value)? getUpcomingSession,
    TResult? Function(_onDeleteSession value)? deleteSession,
    TResult? Function(_onvalidateSelectedTime value)? validateSelectedTime,
    TResult? Function(_onViewSession value)? viewSession,
    TResult? Function(_onUpdateSession value)? updateSession,
    TResult? Function(_onPutRating value)? putRating,
  }) {
    return updateSession?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_onAddSession value)? addSession,
    TResult Function(_onGetSession value)? getSession,
    TResult Function(_onGetPreviousSession value)? getPreviousSession,
    TResult Function(_onGetUpcomingSession value)? getUpcomingSession,
    TResult Function(_onDeleteSession value)? deleteSession,
    TResult Function(_onvalidateSelectedTime value)? validateSelectedTime,
    TResult Function(_onViewSession value)? viewSession,
    TResult Function(_onUpdateSession value)? updateSession,
    TResult Function(_onPutRating value)? putRating,
    required TResult orElse(),
  }) {
    if (updateSession != null) {
      return updateSession(this);
    }
    return orElse();
  }
}

abstract class _onUpdateSession implements SessionEvent {
  const factory _onUpdateSession(
          final SessionModel model, final String referenceID) =
      _$onUpdateSessionImpl;

  SessionModel get model;
  String get referenceID;
  @JsonKey(ignore: true)
  _$$onUpdateSessionImplCopyWith<_$onUpdateSessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$onPutRatingImplCopyWith<$Res> {
  factory _$$onPutRatingImplCopyWith(
          _$onPutRatingImpl value, $Res Function(_$onPutRatingImpl) then) =
      __$$onPutRatingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({RatingModel model, String id});
}

/// @nodoc
class __$$onPutRatingImplCopyWithImpl<$Res>
    extends _$SessionEventCopyWithImpl<$Res, _$onPutRatingImpl>
    implements _$$onPutRatingImplCopyWith<$Res> {
  __$$onPutRatingImplCopyWithImpl(
      _$onPutRatingImpl _value, $Res Function(_$onPutRatingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
    Object? id = null,
  }) {
    return _then(_$onPutRatingImpl(
      null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as RatingModel,
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$onPutRatingImpl implements _onPutRating {
  const _$onPutRatingImpl(this.model, this.id);

  @override
  final RatingModel model;
  @override
  final String id;

  @override
  String toString() {
    return 'SessionEvent.putRating(model: $model, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$onPutRatingImpl &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, model, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$onPutRatingImplCopyWith<_$onPutRatingImpl> get copyWith =>
      __$$onPutRatingImplCopyWithImpl<_$onPutRatingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SessionModel model) addSession,
    required TResult Function(SessionFilterModel? filter) getSession,
    required TResult Function(SessionFilterModel? filter) getPreviousSession,
    required TResult Function(SessionFilterModel? filter) getUpcomingSession,
    required TResult Function(String sessionID) deleteSession,
    required TResult Function(List<Date> timeList) validateSelectedTime,
    required TResult Function(String sessionID) viewSession,
    required TResult Function(SessionModel model, String referenceID)
        updateSession,
    required TResult Function(RatingModel model, String id) putRating,
  }) {
    return putRating(model, id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SessionModel model)? addSession,
    TResult? Function(SessionFilterModel? filter)? getSession,
    TResult? Function(SessionFilterModel? filter)? getPreviousSession,
    TResult? Function(SessionFilterModel? filter)? getUpcomingSession,
    TResult? Function(String sessionID)? deleteSession,
    TResult? Function(List<Date> timeList)? validateSelectedTime,
    TResult? Function(String sessionID)? viewSession,
    TResult? Function(SessionModel model, String referenceID)? updateSession,
    TResult? Function(RatingModel model, String id)? putRating,
  }) {
    return putRating?.call(model, id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SessionModel model)? addSession,
    TResult Function(SessionFilterModel? filter)? getSession,
    TResult Function(SessionFilterModel? filter)? getPreviousSession,
    TResult Function(SessionFilterModel? filter)? getUpcomingSession,
    TResult Function(String sessionID)? deleteSession,
    TResult Function(List<Date> timeList)? validateSelectedTime,
    TResult Function(String sessionID)? viewSession,
    TResult Function(SessionModel model, String referenceID)? updateSession,
    TResult Function(RatingModel model, String id)? putRating,
    required TResult orElse(),
  }) {
    if (putRating != null) {
      return putRating(model, id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_onAddSession value) addSession,
    required TResult Function(_onGetSession value) getSession,
    required TResult Function(_onGetPreviousSession value) getPreviousSession,
    required TResult Function(_onGetUpcomingSession value) getUpcomingSession,
    required TResult Function(_onDeleteSession value) deleteSession,
    required TResult Function(_onvalidateSelectedTime value)
        validateSelectedTime,
    required TResult Function(_onViewSession value) viewSession,
    required TResult Function(_onUpdateSession value) updateSession,
    required TResult Function(_onPutRating value) putRating,
  }) {
    return putRating(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_onAddSession value)? addSession,
    TResult? Function(_onGetSession value)? getSession,
    TResult? Function(_onGetPreviousSession value)? getPreviousSession,
    TResult? Function(_onGetUpcomingSession value)? getUpcomingSession,
    TResult? Function(_onDeleteSession value)? deleteSession,
    TResult? Function(_onvalidateSelectedTime value)? validateSelectedTime,
    TResult? Function(_onViewSession value)? viewSession,
    TResult? Function(_onUpdateSession value)? updateSession,
    TResult? Function(_onPutRating value)? putRating,
  }) {
    return putRating?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_onAddSession value)? addSession,
    TResult Function(_onGetSession value)? getSession,
    TResult Function(_onGetPreviousSession value)? getPreviousSession,
    TResult Function(_onGetUpcomingSession value)? getUpcomingSession,
    TResult Function(_onDeleteSession value)? deleteSession,
    TResult Function(_onvalidateSelectedTime value)? validateSelectedTime,
    TResult Function(_onViewSession value)? viewSession,
    TResult Function(_onUpdateSession value)? updateSession,
    TResult Function(_onPutRating value)? putRating,
    required TResult orElse(),
  }) {
    if (putRating != null) {
      return putRating(this);
    }
    return orElse();
  }
}

abstract class _onPutRating implements SessionEvent {
  const factory _onPutRating(final RatingModel model, final String id) =
      _$onPutRatingImpl;

  RatingModel get model;
  String get id;
  @JsonKey(ignore: true)
  _$$onPutRatingImplCopyWith<_$onPutRatingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SessionState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() onLoading,
    required TResult Function(CommonModel<List<SessionResponseModel>> model)
        onGetSessionSuccess,
    required TResult Function(String message) onRatingSuccess,
    required TResult Function(CommonModel<List<SessionResponseModel>> model)
        onGetPreviousSessionSuccess,
    required TResult Function(SessionResponseModel model)
        onGetSessionDetailsSuccess,
    required TResult Function(CommonModel<List<SessionResponseModel>> model)
        onGetUpcomingSessionSuccess,
    required TResult Function(CommonModel<List<SessionResponseModel>> model)
        onGetUpcomingBookingsSuccess,
    required TResult Function(String? message) onFailure,
    required TResult Function() onTimeValidateSuccess,
    required TResult Function(String? message) onTimeValidateFailure,
    required TResult Function(List<SessionResponseModel> model)
        onUpdateSessionSuccess,
    required TResult Function(String model) onAddSessionSuccess,
    required TResult Function(SessionModel model) onDeleteSessionSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? onLoading,
    TResult? Function(CommonModel<List<SessionResponseModel>> model)?
        onGetSessionSuccess,
    TResult? Function(String message)? onRatingSuccess,
    TResult? Function(CommonModel<List<SessionResponseModel>> model)?
        onGetPreviousSessionSuccess,
    TResult? Function(SessionResponseModel model)? onGetSessionDetailsSuccess,
    TResult? Function(CommonModel<List<SessionResponseModel>> model)?
        onGetUpcomingSessionSuccess,
    TResult? Function(CommonModel<List<SessionResponseModel>> model)?
        onGetUpcomingBookingsSuccess,
    TResult? Function(String? message)? onFailure,
    TResult? Function()? onTimeValidateSuccess,
    TResult? Function(String? message)? onTimeValidateFailure,
    TResult? Function(List<SessionResponseModel> model)? onUpdateSessionSuccess,
    TResult? Function(String model)? onAddSessionSuccess,
    TResult? Function(SessionModel model)? onDeleteSessionSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onLoading,
    TResult Function(CommonModel<List<SessionResponseModel>> model)?
        onGetSessionSuccess,
    TResult Function(String message)? onRatingSuccess,
    TResult Function(CommonModel<List<SessionResponseModel>> model)?
        onGetPreviousSessionSuccess,
    TResult Function(SessionResponseModel model)? onGetSessionDetailsSuccess,
    TResult Function(CommonModel<List<SessionResponseModel>> model)?
        onGetUpcomingSessionSuccess,
    TResult Function(CommonModel<List<SessionResponseModel>> model)?
        onGetUpcomingBookingsSuccess,
    TResult Function(String? message)? onFailure,
    TResult Function()? onTimeValidateSuccess,
    TResult Function(String? message)? onTimeValidateFailure,
    TResult Function(List<SessionResponseModel> model)? onUpdateSessionSuccess,
    TResult Function(String model)? onAddSessionSuccess,
    TResult Function(SessionModel model)? onDeleteSessionSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_onLoading value) onLoading,
    required TResult Function(_onGetSessionSuccess value) onGetSessionSuccess,
    required TResult Function(_onRatingSuccess value) onRatingSuccess,
    required TResult Function(_onGetPreviousSessionSuccess value)
        onGetPreviousSessionSuccess,
    required TResult Function(_onGetSessionDetailsSuccess value)
        onGetSessionDetailsSuccess,
    required TResult Function(_onGetUpcomingSessionSuccess value)
        onGetUpcomingSessionSuccess,
    required TResult Function(_onGetUpcomingBookingsSuccess value)
        onGetUpcomingBookingsSuccess,
    required TResult Function(_onFailure value) onFailure,
    required TResult Function(_onTimeValidateSuccess value)
        onTimeValidateSuccess,
    required TResult Function(_onTimeValidateFailure value)
        onTimeValidateFailure,
    required TResult Function(_onUpdateSessionSuccess value)
        onUpdateSessionSuccess,
    required TResult Function(_onAddSessionSuccess value) onAddSessionSuccess,
    required TResult Function(_onDeleteSessionSuccess value)
        onDeleteSessionSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_onLoading value)? onLoading,
    TResult? Function(_onGetSessionSuccess value)? onGetSessionSuccess,
    TResult? Function(_onRatingSuccess value)? onRatingSuccess,
    TResult? Function(_onGetPreviousSessionSuccess value)?
        onGetPreviousSessionSuccess,
    TResult? Function(_onGetSessionDetailsSuccess value)?
        onGetSessionDetailsSuccess,
    TResult? Function(_onGetUpcomingSessionSuccess value)?
        onGetUpcomingSessionSuccess,
    TResult? Function(_onGetUpcomingBookingsSuccess value)?
        onGetUpcomingBookingsSuccess,
    TResult? Function(_onFailure value)? onFailure,
    TResult? Function(_onTimeValidateSuccess value)? onTimeValidateSuccess,
    TResult? Function(_onTimeValidateFailure value)? onTimeValidateFailure,
    TResult? Function(_onUpdateSessionSuccess value)? onUpdateSessionSuccess,
    TResult? Function(_onAddSessionSuccess value)? onAddSessionSuccess,
    TResult? Function(_onDeleteSessionSuccess value)? onDeleteSessionSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_onLoading value)? onLoading,
    TResult Function(_onGetSessionSuccess value)? onGetSessionSuccess,
    TResult Function(_onRatingSuccess value)? onRatingSuccess,
    TResult Function(_onGetPreviousSessionSuccess value)?
        onGetPreviousSessionSuccess,
    TResult Function(_onGetSessionDetailsSuccess value)?
        onGetSessionDetailsSuccess,
    TResult Function(_onGetUpcomingSessionSuccess value)?
        onGetUpcomingSessionSuccess,
    TResult Function(_onGetUpcomingBookingsSuccess value)?
        onGetUpcomingBookingsSuccess,
    TResult Function(_onFailure value)? onFailure,
    TResult Function(_onTimeValidateSuccess value)? onTimeValidateSuccess,
    TResult Function(_onTimeValidateFailure value)? onTimeValidateFailure,
    TResult Function(_onUpdateSessionSuccess value)? onUpdateSessionSuccess,
    TResult Function(_onAddSessionSuccess value)? onAddSessionSuccess,
    TResult Function(_onDeleteSessionSuccess value)? onDeleteSessionSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionStateCopyWith<$Res> {
  factory $SessionStateCopyWith(
          SessionState value, $Res Function(SessionState) then) =
      _$SessionStateCopyWithImpl<$Res, SessionState>;
}

/// @nodoc
class _$SessionStateCopyWithImpl<$Res, $Val extends SessionState>
    implements $SessionStateCopyWith<$Res> {
  _$SessionStateCopyWithImpl(this._value, this._then);

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
    extends _$SessionStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'SessionState.initial()';
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
    required TResult Function(CommonModel<List<SessionResponseModel>> model)
        onGetSessionSuccess,
    required TResult Function(String message) onRatingSuccess,
    required TResult Function(CommonModel<List<SessionResponseModel>> model)
        onGetPreviousSessionSuccess,
    required TResult Function(SessionResponseModel model)
        onGetSessionDetailsSuccess,
    required TResult Function(CommonModel<List<SessionResponseModel>> model)
        onGetUpcomingSessionSuccess,
    required TResult Function(CommonModel<List<SessionResponseModel>> model)
        onGetUpcomingBookingsSuccess,
    required TResult Function(String? message) onFailure,
    required TResult Function() onTimeValidateSuccess,
    required TResult Function(String? message) onTimeValidateFailure,
    required TResult Function(List<SessionResponseModel> model)
        onUpdateSessionSuccess,
    required TResult Function(String model) onAddSessionSuccess,
    required TResult Function(SessionModel model) onDeleteSessionSuccess,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? onLoading,
    TResult? Function(CommonModel<List<SessionResponseModel>> model)?
        onGetSessionSuccess,
    TResult? Function(String message)? onRatingSuccess,
    TResult? Function(CommonModel<List<SessionResponseModel>> model)?
        onGetPreviousSessionSuccess,
    TResult? Function(SessionResponseModel model)? onGetSessionDetailsSuccess,
    TResult? Function(CommonModel<List<SessionResponseModel>> model)?
        onGetUpcomingSessionSuccess,
    TResult? Function(CommonModel<List<SessionResponseModel>> model)?
        onGetUpcomingBookingsSuccess,
    TResult? Function(String? message)? onFailure,
    TResult? Function()? onTimeValidateSuccess,
    TResult? Function(String? message)? onTimeValidateFailure,
    TResult? Function(List<SessionResponseModel> model)? onUpdateSessionSuccess,
    TResult? Function(String model)? onAddSessionSuccess,
    TResult? Function(SessionModel model)? onDeleteSessionSuccess,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onLoading,
    TResult Function(CommonModel<List<SessionResponseModel>> model)?
        onGetSessionSuccess,
    TResult Function(String message)? onRatingSuccess,
    TResult Function(CommonModel<List<SessionResponseModel>> model)?
        onGetPreviousSessionSuccess,
    TResult Function(SessionResponseModel model)? onGetSessionDetailsSuccess,
    TResult Function(CommonModel<List<SessionResponseModel>> model)?
        onGetUpcomingSessionSuccess,
    TResult Function(CommonModel<List<SessionResponseModel>> model)?
        onGetUpcomingBookingsSuccess,
    TResult Function(String? message)? onFailure,
    TResult Function()? onTimeValidateSuccess,
    TResult Function(String? message)? onTimeValidateFailure,
    TResult Function(List<SessionResponseModel> model)? onUpdateSessionSuccess,
    TResult Function(String model)? onAddSessionSuccess,
    TResult Function(SessionModel model)? onDeleteSessionSuccess,
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
    required TResult Function(_onGetSessionSuccess value) onGetSessionSuccess,
    required TResult Function(_onRatingSuccess value) onRatingSuccess,
    required TResult Function(_onGetPreviousSessionSuccess value)
        onGetPreviousSessionSuccess,
    required TResult Function(_onGetSessionDetailsSuccess value)
        onGetSessionDetailsSuccess,
    required TResult Function(_onGetUpcomingSessionSuccess value)
        onGetUpcomingSessionSuccess,
    required TResult Function(_onGetUpcomingBookingsSuccess value)
        onGetUpcomingBookingsSuccess,
    required TResult Function(_onFailure value) onFailure,
    required TResult Function(_onTimeValidateSuccess value)
        onTimeValidateSuccess,
    required TResult Function(_onTimeValidateFailure value)
        onTimeValidateFailure,
    required TResult Function(_onUpdateSessionSuccess value)
        onUpdateSessionSuccess,
    required TResult Function(_onAddSessionSuccess value) onAddSessionSuccess,
    required TResult Function(_onDeleteSessionSuccess value)
        onDeleteSessionSuccess,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_onLoading value)? onLoading,
    TResult? Function(_onGetSessionSuccess value)? onGetSessionSuccess,
    TResult? Function(_onRatingSuccess value)? onRatingSuccess,
    TResult? Function(_onGetPreviousSessionSuccess value)?
        onGetPreviousSessionSuccess,
    TResult? Function(_onGetSessionDetailsSuccess value)?
        onGetSessionDetailsSuccess,
    TResult? Function(_onGetUpcomingSessionSuccess value)?
        onGetUpcomingSessionSuccess,
    TResult? Function(_onGetUpcomingBookingsSuccess value)?
        onGetUpcomingBookingsSuccess,
    TResult? Function(_onFailure value)? onFailure,
    TResult? Function(_onTimeValidateSuccess value)? onTimeValidateSuccess,
    TResult? Function(_onTimeValidateFailure value)? onTimeValidateFailure,
    TResult? Function(_onUpdateSessionSuccess value)? onUpdateSessionSuccess,
    TResult? Function(_onAddSessionSuccess value)? onAddSessionSuccess,
    TResult? Function(_onDeleteSessionSuccess value)? onDeleteSessionSuccess,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_onLoading value)? onLoading,
    TResult Function(_onGetSessionSuccess value)? onGetSessionSuccess,
    TResult Function(_onRatingSuccess value)? onRatingSuccess,
    TResult Function(_onGetPreviousSessionSuccess value)?
        onGetPreviousSessionSuccess,
    TResult Function(_onGetSessionDetailsSuccess value)?
        onGetSessionDetailsSuccess,
    TResult Function(_onGetUpcomingSessionSuccess value)?
        onGetUpcomingSessionSuccess,
    TResult Function(_onGetUpcomingBookingsSuccess value)?
        onGetUpcomingBookingsSuccess,
    TResult Function(_onFailure value)? onFailure,
    TResult Function(_onTimeValidateSuccess value)? onTimeValidateSuccess,
    TResult Function(_onTimeValidateFailure value)? onTimeValidateFailure,
    TResult Function(_onUpdateSessionSuccess value)? onUpdateSessionSuccess,
    TResult Function(_onAddSessionSuccess value)? onAddSessionSuccess,
    TResult Function(_onDeleteSessionSuccess value)? onDeleteSessionSuccess,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements SessionState {
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
    extends _$SessionStateCopyWithImpl<$Res, _$onLoadingImpl>
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
    return 'SessionState.onLoading()';
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
    required TResult Function(CommonModel<List<SessionResponseModel>> model)
        onGetSessionSuccess,
    required TResult Function(String message) onRatingSuccess,
    required TResult Function(CommonModel<List<SessionResponseModel>> model)
        onGetPreviousSessionSuccess,
    required TResult Function(SessionResponseModel model)
        onGetSessionDetailsSuccess,
    required TResult Function(CommonModel<List<SessionResponseModel>> model)
        onGetUpcomingSessionSuccess,
    required TResult Function(CommonModel<List<SessionResponseModel>> model)
        onGetUpcomingBookingsSuccess,
    required TResult Function(String? message) onFailure,
    required TResult Function() onTimeValidateSuccess,
    required TResult Function(String? message) onTimeValidateFailure,
    required TResult Function(List<SessionResponseModel> model)
        onUpdateSessionSuccess,
    required TResult Function(String model) onAddSessionSuccess,
    required TResult Function(SessionModel model) onDeleteSessionSuccess,
  }) {
    return onLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? onLoading,
    TResult? Function(CommonModel<List<SessionResponseModel>> model)?
        onGetSessionSuccess,
    TResult? Function(String message)? onRatingSuccess,
    TResult? Function(CommonModel<List<SessionResponseModel>> model)?
        onGetPreviousSessionSuccess,
    TResult? Function(SessionResponseModel model)? onGetSessionDetailsSuccess,
    TResult? Function(CommonModel<List<SessionResponseModel>> model)?
        onGetUpcomingSessionSuccess,
    TResult? Function(CommonModel<List<SessionResponseModel>> model)?
        onGetUpcomingBookingsSuccess,
    TResult? Function(String? message)? onFailure,
    TResult? Function()? onTimeValidateSuccess,
    TResult? Function(String? message)? onTimeValidateFailure,
    TResult? Function(List<SessionResponseModel> model)? onUpdateSessionSuccess,
    TResult? Function(String model)? onAddSessionSuccess,
    TResult? Function(SessionModel model)? onDeleteSessionSuccess,
  }) {
    return onLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onLoading,
    TResult Function(CommonModel<List<SessionResponseModel>> model)?
        onGetSessionSuccess,
    TResult Function(String message)? onRatingSuccess,
    TResult Function(CommonModel<List<SessionResponseModel>> model)?
        onGetPreviousSessionSuccess,
    TResult Function(SessionResponseModel model)? onGetSessionDetailsSuccess,
    TResult Function(CommonModel<List<SessionResponseModel>> model)?
        onGetUpcomingSessionSuccess,
    TResult Function(CommonModel<List<SessionResponseModel>> model)?
        onGetUpcomingBookingsSuccess,
    TResult Function(String? message)? onFailure,
    TResult Function()? onTimeValidateSuccess,
    TResult Function(String? message)? onTimeValidateFailure,
    TResult Function(List<SessionResponseModel> model)? onUpdateSessionSuccess,
    TResult Function(String model)? onAddSessionSuccess,
    TResult Function(SessionModel model)? onDeleteSessionSuccess,
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
    required TResult Function(_onGetSessionSuccess value) onGetSessionSuccess,
    required TResult Function(_onRatingSuccess value) onRatingSuccess,
    required TResult Function(_onGetPreviousSessionSuccess value)
        onGetPreviousSessionSuccess,
    required TResult Function(_onGetSessionDetailsSuccess value)
        onGetSessionDetailsSuccess,
    required TResult Function(_onGetUpcomingSessionSuccess value)
        onGetUpcomingSessionSuccess,
    required TResult Function(_onGetUpcomingBookingsSuccess value)
        onGetUpcomingBookingsSuccess,
    required TResult Function(_onFailure value) onFailure,
    required TResult Function(_onTimeValidateSuccess value)
        onTimeValidateSuccess,
    required TResult Function(_onTimeValidateFailure value)
        onTimeValidateFailure,
    required TResult Function(_onUpdateSessionSuccess value)
        onUpdateSessionSuccess,
    required TResult Function(_onAddSessionSuccess value) onAddSessionSuccess,
    required TResult Function(_onDeleteSessionSuccess value)
        onDeleteSessionSuccess,
  }) {
    return onLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_onLoading value)? onLoading,
    TResult? Function(_onGetSessionSuccess value)? onGetSessionSuccess,
    TResult? Function(_onRatingSuccess value)? onRatingSuccess,
    TResult? Function(_onGetPreviousSessionSuccess value)?
        onGetPreviousSessionSuccess,
    TResult? Function(_onGetSessionDetailsSuccess value)?
        onGetSessionDetailsSuccess,
    TResult? Function(_onGetUpcomingSessionSuccess value)?
        onGetUpcomingSessionSuccess,
    TResult? Function(_onGetUpcomingBookingsSuccess value)?
        onGetUpcomingBookingsSuccess,
    TResult? Function(_onFailure value)? onFailure,
    TResult? Function(_onTimeValidateSuccess value)? onTimeValidateSuccess,
    TResult? Function(_onTimeValidateFailure value)? onTimeValidateFailure,
    TResult? Function(_onUpdateSessionSuccess value)? onUpdateSessionSuccess,
    TResult? Function(_onAddSessionSuccess value)? onAddSessionSuccess,
    TResult? Function(_onDeleteSessionSuccess value)? onDeleteSessionSuccess,
  }) {
    return onLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_onLoading value)? onLoading,
    TResult Function(_onGetSessionSuccess value)? onGetSessionSuccess,
    TResult Function(_onRatingSuccess value)? onRatingSuccess,
    TResult Function(_onGetPreviousSessionSuccess value)?
        onGetPreviousSessionSuccess,
    TResult Function(_onGetSessionDetailsSuccess value)?
        onGetSessionDetailsSuccess,
    TResult Function(_onGetUpcomingSessionSuccess value)?
        onGetUpcomingSessionSuccess,
    TResult Function(_onGetUpcomingBookingsSuccess value)?
        onGetUpcomingBookingsSuccess,
    TResult Function(_onFailure value)? onFailure,
    TResult Function(_onTimeValidateSuccess value)? onTimeValidateSuccess,
    TResult Function(_onTimeValidateFailure value)? onTimeValidateFailure,
    TResult Function(_onUpdateSessionSuccess value)? onUpdateSessionSuccess,
    TResult Function(_onAddSessionSuccess value)? onAddSessionSuccess,
    TResult Function(_onDeleteSessionSuccess value)? onDeleteSessionSuccess,
    required TResult orElse(),
  }) {
    if (onLoading != null) {
      return onLoading(this);
    }
    return orElse();
  }
}

abstract class _onLoading implements SessionState {
  const factory _onLoading() = _$onLoadingImpl;
}

/// @nodoc
abstract class _$$onGetSessionSuccessImplCopyWith<$Res> {
  factory _$$onGetSessionSuccessImplCopyWith(_$onGetSessionSuccessImpl value,
          $Res Function(_$onGetSessionSuccessImpl) then) =
      __$$onGetSessionSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CommonModel<List<SessionResponseModel>> model});
}

/// @nodoc
class __$$onGetSessionSuccessImplCopyWithImpl<$Res>
    extends _$SessionStateCopyWithImpl<$Res, _$onGetSessionSuccessImpl>
    implements _$$onGetSessionSuccessImplCopyWith<$Res> {
  __$$onGetSessionSuccessImplCopyWithImpl(_$onGetSessionSuccessImpl _value,
      $Res Function(_$onGetSessionSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
  }) {
    return _then(_$onGetSessionSuccessImpl(
      null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as CommonModel<List<SessionResponseModel>>,
    ));
  }
}

/// @nodoc

class _$onGetSessionSuccessImpl implements _onGetSessionSuccess {
  const _$onGetSessionSuccessImpl(this.model);

  @override
  final CommonModel<List<SessionResponseModel>> model;

  @override
  String toString() {
    return 'SessionState.onGetSessionSuccess(model: $model)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$onGetSessionSuccessImpl &&
            (identical(other.model, model) || other.model == model));
  }

  @override
  int get hashCode => Object.hash(runtimeType, model);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$onGetSessionSuccessImplCopyWith<_$onGetSessionSuccessImpl> get copyWith =>
      __$$onGetSessionSuccessImplCopyWithImpl<_$onGetSessionSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() onLoading,
    required TResult Function(CommonModel<List<SessionResponseModel>> model)
        onGetSessionSuccess,
    required TResult Function(String message) onRatingSuccess,
    required TResult Function(CommonModel<List<SessionResponseModel>> model)
        onGetPreviousSessionSuccess,
    required TResult Function(SessionResponseModel model)
        onGetSessionDetailsSuccess,
    required TResult Function(CommonModel<List<SessionResponseModel>> model)
        onGetUpcomingSessionSuccess,
    required TResult Function(CommonModel<List<SessionResponseModel>> model)
        onGetUpcomingBookingsSuccess,
    required TResult Function(String? message) onFailure,
    required TResult Function() onTimeValidateSuccess,
    required TResult Function(String? message) onTimeValidateFailure,
    required TResult Function(List<SessionResponseModel> model)
        onUpdateSessionSuccess,
    required TResult Function(String model) onAddSessionSuccess,
    required TResult Function(SessionModel model) onDeleteSessionSuccess,
  }) {
    return onGetSessionSuccess(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? onLoading,
    TResult? Function(CommonModel<List<SessionResponseModel>> model)?
        onGetSessionSuccess,
    TResult? Function(String message)? onRatingSuccess,
    TResult? Function(CommonModel<List<SessionResponseModel>> model)?
        onGetPreviousSessionSuccess,
    TResult? Function(SessionResponseModel model)? onGetSessionDetailsSuccess,
    TResult? Function(CommonModel<List<SessionResponseModel>> model)?
        onGetUpcomingSessionSuccess,
    TResult? Function(CommonModel<List<SessionResponseModel>> model)?
        onGetUpcomingBookingsSuccess,
    TResult? Function(String? message)? onFailure,
    TResult? Function()? onTimeValidateSuccess,
    TResult? Function(String? message)? onTimeValidateFailure,
    TResult? Function(List<SessionResponseModel> model)? onUpdateSessionSuccess,
    TResult? Function(String model)? onAddSessionSuccess,
    TResult? Function(SessionModel model)? onDeleteSessionSuccess,
  }) {
    return onGetSessionSuccess?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onLoading,
    TResult Function(CommonModel<List<SessionResponseModel>> model)?
        onGetSessionSuccess,
    TResult Function(String message)? onRatingSuccess,
    TResult Function(CommonModel<List<SessionResponseModel>> model)?
        onGetPreviousSessionSuccess,
    TResult Function(SessionResponseModel model)? onGetSessionDetailsSuccess,
    TResult Function(CommonModel<List<SessionResponseModel>> model)?
        onGetUpcomingSessionSuccess,
    TResult Function(CommonModel<List<SessionResponseModel>> model)?
        onGetUpcomingBookingsSuccess,
    TResult Function(String? message)? onFailure,
    TResult Function()? onTimeValidateSuccess,
    TResult Function(String? message)? onTimeValidateFailure,
    TResult Function(List<SessionResponseModel> model)? onUpdateSessionSuccess,
    TResult Function(String model)? onAddSessionSuccess,
    TResult Function(SessionModel model)? onDeleteSessionSuccess,
    required TResult orElse(),
  }) {
    if (onGetSessionSuccess != null) {
      return onGetSessionSuccess(model);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_onLoading value) onLoading,
    required TResult Function(_onGetSessionSuccess value) onGetSessionSuccess,
    required TResult Function(_onRatingSuccess value) onRatingSuccess,
    required TResult Function(_onGetPreviousSessionSuccess value)
        onGetPreviousSessionSuccess,
    required TResult Function(_onGetSessionDetailsSuccess value)
        onGetSessionDetailsSuccess,
    required TResult Function(_onGetUpcomingSessionSuccess value)
        onGetUpcomingSessionSuccess,
    required TResult Function(_onGetUpcomingBookingsSuccess value)
        onGetUpcomingBookingsSuccess,
    required TResult Function(_onFailure value) onFailure,
    required TResult Function(_onTimeValidateSuccess value)
        onTimeValidateSuccess,
    required TResult Function(_onTimeValidateFailure value)
        onTimeValidateFailure,
    required TResult Function(_onUpdateSessionSuccess value)
        onUpdateSessionSuccess,
    required TResult Function(_onAddSessionSuccess value) onAddSessionSuccess,
    required TResult Function(_onDeleteSessionSuccess value)
        onDeleteSessionSuccess,
  }) {
    return onGetSessionSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_onLoading value)? onLoading,
    TResult? Function(_onGetSessionSuccess value)? onGetSessionSuccess,
    TResult? Function(_onRatingSuccess value)? onRatingSuccess,
    TResult? Function(_onGetPreviousSessionSuccess value)?
        onGetPreviousSessionSuccess,
    TResult? Function(_onGetSessionDetailsSuccess value)?
        onGetSessionDetailsSuccess,
    TResult? Function(_onGetUpcomingSessionSuccess value)?
        onGetUpcomingSessionSuccess,
    TResult? Function(_onGetUpcomingBookingsSuccess value)?
        onGetUpcomingBookingsSuccess,
    TResult? Function(_onFailure value)? onFailure,
    TResult? Function(_onTimeValidateSuccess value)? onTimeValidateSuccess,
    TResult? Function(_onTimeValidateFailure value)? onTimeValidateFailure,
    TResult? Function(_onUpdateSessionSuccess value)? onUpdateSessionSuccess,
    TResult? Function(_onAddSessionSuccess value)? onAddSessionSuccess,
    TResult? Function(_onDeleteSessionSuccess value)? onDeleteSessionSuccess,
  }) {
    return onGetSessionSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_onLoading value)? onLoading,
    TResult Function(_onGetSessionSuccess value)? onGetSessionSuccess,
    TResult Function(_onRatingSuccess value)? onRatingSuccess,
    TResult Function(_onGetPreviousSessionSuccess value)?
        onGetPreviousSessionSuccess,
    TResult Function(_onGetSessionDetailsSuccess value)?
        onGetSessionDetailsSuccess,
    TResult Function(_onGetUpcomingSessionSuccess value)?
        onGetUpcomingSessionSuccess,
    TResult Function(_onGetUpcomingBookingsSuccess value)?
        onGetUpcomingBookingsSuccess,
    TResult Function(_onFailure value)? onFailure,
    TResult Function(_onTimeValidateSuccess value)? onTimeValidateSuccess,
    TResult Function(_onTimeValidateFailure value)? onTimeValidateFailure,
    TResult Function(_onUpdateSessionSuccess value)? onUpdateSessionSuccess,
    TResult Function(_onAddSessionSuccess value)? onAddSessionSuccess,
    TResult Function(_onDeleteSessionSuccess value)? onDeleteSessionSuccess,
    required TResult orElse(),
  }) {
    if (onGetSessionSuccess != null) {
      return onGetSessionSuccess(this);
    }
    return orElse();
  }
}

abstract class _onGetSessionSuccess implements SessionState {
  const factory _onGetSessionSuccess(
          final CommonModel<List<SessionResponseModel>> model) =
      _$onGetSessionSuccessImpl;

  CommonModel<List<SessionResponseModel>> get model;
  @JsonKey(ignore: true)
  _$$onGetSessionSuccessImplCopyWith<_$onGetSessionSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$onRatingSuccessImplCopyWith<$Res> {
  factory _$$onRatingSuccessImplCopyWith(_$onRatingSuccessImpl value,
          $Res Function(_$onRatingSuccessImpl) then) =
      __$$onRatingSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$onRatingSuccessImplCopyWithImpl<$Res>
    extends _$SessionStateCopyWithImpl<$Res, _$onRatingSuccessImpl>
    implements _$$onRatingSuccessImplCopyWith<$Res> {
  __$$onRatingSuccessImplCopyWithImpl(
      _$onRatingSuccessImpl _value, $Res Function(_$onRatingSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$onRatingSuccessImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$onRatingSuccessImpl implements _onRatingSuccess {
  const _$onRatingSuccessImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'SessionState.onRatingSuccess(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$onRatingSuccessImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$onRatingSuccessImplCopyWith<_$onRatingSuccessImpl> get copyWith =>
      __$$onRatingSuccessImplCopyWithImpl<_$onRatingSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() onLoading,
    required TResult Function(CommonModel<List<SessionResponseModel>> model)
        onGetSessionSuccess,
    required TResult Function(String message) onRatingSuccess,
    required TResult Function(CommonModel<List<SessionResponseModel>> model)
        onGetPreviousSessionSuccess,
    required TResult Function(SessionResponseModel model)
        onGetSessionDetailsSuccess,
    required TResult Function(CommonModel<List<SessionResponseModel>> model)
        onGetUpcomingSessionSuccess,
    required TResult Function(CommonModel<List<SessionResponseModel>> model)
        onGetUpcomingBookingsSuccess,
    required TResult Function(String? message) onFailure,
    required TResult Function() onTimeValidateSuccess,
    required TResult Function(String? message) onTimeValidateFailure,
    required TResult Function(List<SessionResponseModel> model)
        onUpdateSessionSuccess,
    required TResult Function(String model) onAddSessionSuccess,
    required TResult Function(SessionModel model) onDeleteSessionSuccess,
  }) {
    return onRatingSuccess(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? onLoading,
    TResult? Function(CommonModel<List<SessionResponseModel>> model)?
        onGetSessionSuccess,
    TResult? Function(String message)? onRatingSuccess,
    TResult? Function(CommonModel<List<SessionResponseModel>> model)?
        onGetPreviousSessionSuccess,
    TResult? Function(SessionResponseModel model)? onGetSessionDetailsSuccess,
    TResult? Function(CommonModel<List<SessionResponseModel>> model)?
        onGetUpcomingSessionSuccess,
    TResult? Function(CommonModel<List<SessionResponseModel>> model)?
        onGetUpcomingBookingsSuccess,
    TResult? Function(String? message)? onFailure,
    TResult? Function()? onTimeValidateSuccess,
    TResult? Function(String? message)? onTimeValidateFailure,
    TResult? Function(List<SessionResponseModel> model)? onUpdateSessionSuccess,
    TResult? Function(String model)? onAddSessionSuccess,
    TResult? Function(SessionModel model)? onDeleteSessionSuccess,
  }) {
    return onRatingSuccess?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onLoading,
    TResult Function(CommonModel<List<SessionResponseModel>> model)?
        onGetSessionSuccess,
    TResult Function(String message)? onRatingSuccess,
    TResult Function(CommonModel<List<SessionResponseModel>> model)?
        onGetPreviousSessionSuccess,
    TResult Function(SessionResponseModel model)? onGetSessionDetailsSuccess,
    TResult Function(CommonModel<List<SessionResponseModel>> model)?
        onGetUpcomingSessionSuccess,
    TResult Function(CommonModel<List<SessionResponseModel>> model)?
        onGetUpcomingBookingsSuccess,
    TResult Function(String? message)? onFailure,
    TResult Function()? onTimeValidateSuccess,
    TResult Function(String? message)? onTimeValidateFailure,
    TResult Function(List<SessionResponseModel> model)? onUpdateSessionSuccess,
    TResult Function(String model)? onAddSessionSuccess,
    TResult Function(SessionModel model)? onDeleteSessionSuccess,
    required TResult orElse(),
  }) {
    if (onRatingSuccess != null) {
      return onRatingSuccess(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_onLoading value) onLoading,
    required TResult Function(_onGetSessionSuccess value) onGetSessionSuccess,
    required TResult Function(_onRatingSuccess value) onRatingSuccess,
    required TResult Function(_onGetPreviousSessionSuccess value)
        onGetPreviousSessionSuccess,
    required TResult Function(_onGetSessionDetailsSuccess value)
        onGetSessionDetailsSuccess,
    required TResult Function(_onGetUpcomingSessionSuccess value)
        onGetUpcomingSessionSuccess,
    required TResult Function(_onGetUpcomingBookingsSuccess value)
        onGetUpcomingBookingsSuccess,
    required TResult Function(_onFailure value) onFailure,
    required TResult Function(_onTimeValidateSuccess value)
        onTimeValidateSuccess,
    required TResult Function(_onTimeValidateFailure value)
        onTimeValidateFailure,
    required TResult Function(_onUpdateSessionSuccess value)
        onUpdateSessionSuccess,
    required TResult Function(_onAddSessionSuccess value) onAddSessionSuccess,
    required TResult Function(_onDeleteSessionSuccess value)
        onDeleteSessionSuccess,
  }) {
    return onRatingSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_onLoading value)? onLoading,
    TResult? Function(_onGetSessionSuccess value)? onGetSessionSuccess,
    TResult? Function(_onRatingSuccess value)? onRatingSuccess,
    TResult? Function(_onGetPreviousSessionSuccess value)?
        onGetPreviousSessionSuccess,
    TResult? Function(_onGetSessionDetailsSuccess value)?
        onGetSessionDetailsSuccess,
    TResult? Function(_onGetUpcomingSessionSuccess value)?
        onGetUpcomingSessionSuccess,
    TResult? Function(_onGetUpcomingBookingsSuccess value)?
        onGetUpcomingBookingsSuccess,
    TResult? Function(_onFailure value)? onFailure,
    TResult? Function(_onTimeValidateSuccess value)? onTimeValidateSuccess,
    TResult? Function(_onTimeValidateFailure value)? onTimeValidateFailure,
    TResult? Function(_onUpdateSessionSuccess value)? onUpdateSessionSuccess,
    TResult? Function(_onAddSessionSuccess value)? onAddSessionSuccess,
    TResult? Function(_onDeleteSessionSuccess value)? onDeleteSessionSuccess,
  }) {
    return onRatingSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_onLoading value)? onLoading,
    TResult Function(_onGetSessionSuccess value)? onGetSessionSuccess,
    TResult Function(_onRatingSuccess value)? onRatingSuccess,
    TResult Function(_onGetPreviousSessionSuccess value)?
        onGetPreviousSessionSuccess,
    TResult Function(_onGetSessionDetailsSuccess value)?
        onGetSessionDetailsSuccess,
    TResult Function(_onGetUpcomingSessionSuccess value)?
        onGetUpcomingSessionSuccess,
    TResult Function(_onGetUpcomingBookingsSuccess value)?
        onGetUpcomingBookingsSuccess,
    TResult Function(_onFailure value)? onFailure,
    TResult Function(_onTimeValidateSuccess value)? onTimeValidateSuccess,
    TResult Function(_onTimeValidateFailure value)? onTimeValidateFailure,
    TResult Function(_onUpdateSessionSuccess value)? onUpdateSessionSuccess,
    TResult Function(_onAddSessionSuccess value)? onAddSessionSuccess,
    TResult Function(_onDeleteSessionSuccess value)? onDeleteSessionSuccess,
    required TResult orElse(),
  }) {
    if (onRatingSuccess != null) {
      return onRatingSuccess(this);
    }
    return orElse();
  }
}

abstract class _onRatingSuccess implements SessionState {
  const factory _onRatingSuccess(final String message) = _$onRatingSuccessImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$onRatingSuccessImplCopyWith<_$onRatingSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$onGetPreviousSessionSuccessImplCopyWith<$Res> {
  factory _$$onGetPreviousSessionSuccessImplCopyWith(
          _$onGetPreviousSessionSuccessImpl value,
          $Res Function(_$onGetPreviousSessionSuccessImpl) then) =
      __$$onGetPreviousSessionSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CommonModel<List<SessionResponseModel>> model});
}

/// @nodoc
class __$$onGetPreviousSessionSuccessImplCopyWithImpl<$Res>
    extends _$SessionStateCopyWithImpl<$Res, _$onGetPreviousSessionSuccessImpl>
    implements _$$onGetPreviousSessionSuccessImplCopyWith<$Res> {
  __$$onGetPreviousSessionSuccessImplCopyWithImpl(
      _$onGetPreviousSessionSuccessImpl _value,
      $Res Function(_$onGetPreviousSessionSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
  }) {
    return _then(_$onGetPreviousSessionSuccessImpl(
      null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as CommonModel<List<SessionResponseModel>>,
    ));
  }
}

/// @nodoc

class _$onGetPreviousSessionSuccessImpl
    implements _onGetPreviousSessionSuccess {
  const _$onGetPreviousSessionSuccessImpl(this.model);

  @override
  final CommonModel<List<SessionResponseModel>> model;

  @override
  String toString() {
    return 'SessionState.onGetPreviousSessionSuccess(model: $model)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$onGetPreviousSessionSuccessImpl &&
            (identical(other.model, model) || other.model == model));
  }

  @override
  int get hashCode => Object.hash(runtimeType, model);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$onGetPreviousSessionSuccessImplCopyWith<_$onGetPreviousSessionSuccessImpl>
      get copyWith => __$$onGetPreviousSessionSuccessImplCopyWithImpl<
          _$onGetPreviousSessionSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() onLoading,
    required TResult Function(CommonModel<List<SessionResponseModel>> model)
        onGetSessionSuccess,
    required TResult Function(String message) onRatingSuccess,
    required TResult Function(CommonModel<List<SessionResponseModel>> model)
        onGetPreviousSessionSuccess,
    required TResult Function(SessionResponseModel model)
        onGetSessionDetailsSuccess,
    required TResult Function(CommonModel<List<SessionResponseModel>> model)
        onGetUpcomingSessionSuccess,
    required TResult Function(CommonModel<List<SessionResponseModel>> model)
        onGetUpcomingBookingsSuccess,
    required TResult Function(String? message) onFailure,
    required TResult Function() onTimeValidateSuccess,
    required TResult Function(String? message) onTimeValidateFailure,
    required TResult Function(List<SessionResponseModel> model)
        onUpdateSessionSuccess,
    required TResult Function(String model) onAddSessionSuccess,
    required TResult Function(SessionModel model) onDeleteSessionSuccess,
  }) {
    return onGetPreviousSessionSuccess(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? onLoading,
    TResult? Function(CommonModel<List<SessionResponseModel>> model)?
        onGetSessionSuccess,
    TResult? Function(String message)? onRatingSuccess,
    TResult? Function(CommonModel<List<SessionResponseModel>> model)?
        onGetPreviousSessionSuccess,
    TResult? Function(SessionResponseModel model)? onGetSessionDetailsSuccess,
    TResult? Function(CommonModel<List<SessionResponseModel>> model)?
        onGetUpcomingSessionSuccess,
    TResult? Function(CommonModel<List<SessionResponseModel>> model)?
        onGetUpcomingBookingsSuccess,
    TResult? Function(String? message)? onFailure,
    TResult? Function()? onTimeValidateSuccess,
    TResult? Function(String? message)? onTimeValidateFailure,
    TResult? Function(List<SessionResponseModel> model)? onUpdateSessionSuccess,
    TResult? Function(String model)? onAddSessionSuccess,
    TResult? Function(SessionModel model)? onDeleteSessionSuccess,
  }) {
    return onGetPreviousSessionSuccess?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onLoading,
    TResult Function(CommonModel<List<SessionResponseModel>> model)?
        onGetSessionSuccess,
    TResult Function(String message)? onRatingSuccess,
    TResult Function(CommonModel<List<SessionResponseModel>> model)?
        onGetPreviousSessionSuccess,
    TResult Function(SessionResponseModel model)? onGetSessionDetailsSuccess,
    TResult Function(CommonModel<List<SessionResponseModel>> model)?
        onGetUpcomingSessionSuccess,
    TResult Function(CommonModel<List<SessionResponseModel>> model)?
        onGetUpcomingBookingsSuccess,
    TResult Function(String? message)? onFailure,
    TResult Function()? onTimeValidateSuccess,
    TResult Function(String? message)? onTimeValidateFailure,
    TResult Function(List<SessionResponseModel> model)? onUpdateSessionSuccess,
    TResult Function(String model)? onAddSessionSuccess,
    TResult Function(SessionModel model)? onDeleteSessionSuccess,
    required TResult orElse(),
  }) {
    if (onGetPreviousSessionSuccess != null) {
      return onGetPreviousSessionSuccess(model);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_onLoading value) onLoading,
    required TResult Function(_onGetSessionSuccess value) onGetSessionSuccess,
    required TResult Function(_onRatingSuccess value) onRatingSuccess,
    required TResult Function(_onGetPreviousSessionSuccess value)
        onGetPreviousSessionSuccess,
    required TResult Function(_onGetSessionDetailsSuccess value)
        onGetSessionDetailsSuccess,
    required TResult Function(_onGetUpcomingSessionSuccess value)
        onGetUpcomingSessionSuccess,
    required TResult Function(_onGetUpcomingBookingsSuccess value)
        onGetUpcomingBookingsSuccess,
    required TResult Function(_onFailure value) onFailure,
    required TResult Function(_onTimeValidateSuccess value)
        onTimeValidateSuccess,
    required TResult Function(_onTimeValidateFailure value)
        onTimeValidateFailure,
    required TResult Function(_onUpdateSessionSuccess value)
        onUpdateSessionSuccess,
    required TResult Function(_onAddSessionSuccess value) onAddSessionSuccess,
    required TResult Function(_onDeleteSessionSuccess value)
        onDeleteSessionSuccess,
  }) {
    return onGetPreviousSessionSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_onLoading value)? onLoading,
    TResult? Function(_onGetSessionSuccess value)? onGetSessionSuccess,
    TResult? Function(_onRatingSuccess value)? onRatingSuccess,
    TResult? Function(_onGetPreviousSessionSuccess value)?
        onGetPreviousSessionSuccess,
    TResult? Function(_onGetSessionDetailsSuccess value)?
        onGetSessionDetailsSuccess,
    TResult? Function(_onGetUpcomingSessionSuccess value)?
        onGetUpcomingSessionSuccess,
    TResult? Function(_onGetUpcomingBookingsSuccess value)?
        onGetUpcomingBookingsSuccess,
    TResult? Function(_onFailure value)? onFailure,
    TResult? Function(_onTimeValidateSuccess value)? onTimeValidateSuccess,
    TResult? Function(_onTimeValidateFailure value)? onTimeValidateFailure,
    TResult? Function(_onUpdateSessionSuccess value)? onUpdateSessionSuccess,
    TResult? Function(_onAddSessionSuccess value)? onAddSessionSuccess,
    TResult? Function(_onDeleteSessionSuccess value)? onDeleteSessionSuccess,
  }) {
    return onGetPreviousSessionSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_onLoading value)? onLoading,
    TResult Function(_onGetSessionSuccess value)? onGetSessionSuccess,
    TResult Function(_onRatingSuccess value)? onRatingSuccess,
    TResult Function(_onGetPreviousSessionSuccess value)?
        onGetPreviousSessionSuccess,
    TResult Function(_onGetSessionDetailsSuccess value)?
        onGetSessionDetailsSuccess,
    TResult Function(_onGetUpcomingSessionSuccess value)?
        onGetUpcomingSessionSuccess,
    TResult Function(_onGetUpcomingBookingsSuccess value)?
        onGetUpcomingBookingsSuccess,
    TResult Function(_onFailure value)? onFailure,
    TResult Function(_onTimeValidateSuccess value)? onTimeValidateSuccess,
    TResult Function(_onTimeValidateFailure value)? onTimeValidateFailure,
    TResult Function(_onUpdateSessionSuccess value)? onUpdateSessionSuccess,
    TResult Function(_onAddSessionSuccess value)? onAddSessionSuccess,
    TResult Function(_onDeleteSessionSuccess value)? onDeleteSessionSuccess,
    required TResult orElse(),
  }) {
    if (onGetPreviousSessionSuccess != null) {
      return onGetPreviousSessionSuccess(this);
    }
    return orElse();
  }
}

abstract class _onGetPreviousSessionSuccess implements SessionState {
  const factory _onGetPreviousSessionSuccess(
          final CommonModel<List<SessionResponseModel>> model) =
      _$onGetPreviousSessionSuccessImpl;

  CommonModel<List<SessionResponseModel>> get model;
  @JsonKey(ignore: true)
  _$$onGetPreviousSessionSuccessImplCopyWith<_$onGetPreviousSessionSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$onGetSessionDetailsSuccessImplCopyWith<$Res> {
  factory _$$onGetSessionDetailsSuccessImplCopyWith(
          _$onGetSessionDetailsSuccessImpl value,
          $Res Function(_$onGetSessionDetailsSuccessImpl) then) =
      __$$onGetSessionDetailsSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SessionResponseModel model});
}

/// @nodoc
class __$$onGetSessionDetailsSuccessImplCopyWithImpl<$Res>
    extends _$SessionStateCopyWithImpl<$Res, _$onGetSessionDetailsSuccessImpl>
    implements _$$onGetSessionDetailsSuccessImplCopyWith<$Res> {
  __$$onGetSessionDetailsSuccessImplCopyWithImpl(
      _$onGetSessionDetailsSuccessImpl _value,
      $Res Function(_$onGetSessionDetailsSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
  }) {
    return _then(_$onGetSessionDetailsSuccessImpl(
      null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as SessionResponseModel,
    ));
  }
}

/// @nodoc

class _$onGetSessionDetailsSuccessImpl implements _onGetSessionDetailsSuccess {
  const _$onGetSessionDetailsSuccessImpl(this.model);

  @override
  final SessionResponseModel model;

  @override
  String toString() {
    return 'SessionState.onGetSessionDetailsSuccess(model: $model)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$onGetSessionDetailsSuccessImpl &&
            (identical(other.model, model) || other.model == model));
  }

  @override
  int get hashCode => Object.hash(runtimeType, model);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$onGetSessionDetailsSuccessImplCopyWith<_$onGetSessionDetailsSuccessImpl>
      get copyWith => __$$onGetSessionDetailsSuccessImplCopyWithImpl<
          _$onGetSessionDetailsSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() onLoading,
    required TResult Function(CommonModel<List<SessionResponseModel>> model)
        onGetSessionSuccess,
    required TResult Function(String message) onRatingSuccess,
    required TResult Function(CommonModel<List<SessionResponseModel>> model)
        onGetPreviousSessionSuccess,
    required TResult Function(SessionResponseModel model)
        onGetSessionDetailsSuccess,
    required TResult Function(CommonModel<List<SessionResponseModel>> model)
        onGetUpcomingSessionSuccess,
    required TResult Function(CommonModel<List<SessionResponseModel>> model)
        onGetUpcomingBookingsSuccess,
    required TResult Function(String? message) onFailure,
    required TResult Function() onTimeValidateSuccess,
    required TResult Function(String? message) onTimeValidateFailure,
    required TResult Function(List<SessionResponseModel> model)
        onUpdateSessionSuccess,
    required TResult Function(String model) onAddSessionSuccess,
    required TResult Function(SessionModel model) onDeleteSessionSuccess,
  }) {
    return onGetSessionDetailsSuccess(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? onLoading,
    TResult? Function(CommonModel<List<SessionResponseModel>> model)?
        onGetSessionSuccess,
    TResult? Function(String message)? onRatingSuccess,
    TResult? Function(CommonModel<List<SessionResponseModel>> model)?
        onGetPreviousSessionSuccess,
    TResult? Function(SessionResponseModel model)? onGetSessionDetailsSuccess,
    TResult? Function(CommonModel<List<SessionResponseModel>> model)?
        onGetUpcomingSessionSuccess,
    TResult? Function(CommonModel<List<SessionResponseModel>> model)?
        onGetUpcomingBookingsSuccess,
    TResult? Function(String? message)? onFailure,
    TResult? Function()? onTimeValidateSuccess,
    TResult? Function(String? message)? onTimeValidateFailure,
    TResult? Function(List<SessionResponseModel> model)? onUpdateSessionSuccess,
    TResult? Function(String model)? onAddSessionSuccess,
    TResult? Function(SessionModel model)? onDeleteSessionSuccess,
  }) {
    return onGetSessionDetailsSuccess?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onLoading,
    TResult Function(CommonModel<List<SessionResponseModel>> model)?
        onGetSessionSuccess,
    TResult Function(String message)? onRatingSuccess,
    TResult Function(CommonModel<List<SessionResponseModel>> model)?
        onGetPreviousSessionSuccess,
    TResult Function(SessionResponseModel model)? onGetSessionDetailsSuccess,
    TResult Function(CommonModel<List<SessionResponseModel>> model)?
        onGetUpcomingSessionSuccess,
    TResult Function(CommonModel<List<SessionResponseModel>> model)?
        onGetUpcomingBookingsSuccess,
    TResult Function(String? message)? onFailure,
    TResult Function()? onTimeValidateSuccess,
    TResult Function(String? message)? onTimeValidateFailure,
    TResult Function(List<SessionResponseModel> model)? onUpdateSessionSuccess,
    TResult Function(String model)? onAddSessionSuccess,
    TResult Function(SessionModel model)? onDeleteSessionSuccess,
    required TResult orElse(),
  }) {
    if (onGetSessionDetailsSuccess != null) {
      return onGetSessionDetailsSuccess(model);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_onLoading value) onLoading,
    required TResult Function(_onGetSessionSuccess value) onGetSessionSuccess,
    required TResult Function(_onRatingSuccess value) onRatingSuccess,
    required TResult Function(_onGetPreviousSessionSuccess value)
        onGetPreviousSessionSuccess,
    required TResult Function(_onGetSessionDetailsSuccess value)
        onGetSessionDetailsSuccess,
    required TResult Function(_onGetUpcomingSessionSuccess value)
        onGetUpcomingSessionSuccess,
    required TResult Function(_onGetUpcomingBookingsSuccess value)
        onGetUpcomingBookingsSuccess,
    required TResult Function(_onFailure value) onFailure,
    required TResult Function(_onTimeValidateSuccess value)
        onTimeValidateSuccess,
    required TResult Function(_onTimeValidateFailure value)
        onTimeValidateFailure,
    required TResult Function(_onUpdateSessionSuccess value)
        onUpdateSessionSuccess,
    required TResult Function(_onAddSessionSuccess value) onAddSessionSuccess,
    required TResult Function(_onDeleteSessionSuccess value)
        onDeleteSessionSuccess,
  }) {
    return onGetSessionDetailsSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_onLoading value)? onLoading,
    TResult? Function(_onGetSessionSuccess value)? onGetSessionSuccess,
    TResult? Function(_onRatingSuccess value)? onRatingSuccess,
    TResult? Function(_onGetPreviousSessionSuccess value)?
        onGetPreviousSessionSuccess,
    TResult? Function(_onGetSessionDetailsSuccess value)?
        onGetSessionDetailsSuccess,
    TResult? Function(_onGetUpcomingSessionSuccess value)?
        onGetUpcomingSessionSuccess,
    TResult? Function(_onGetUpcomingBookingsSuccess value)?
        onGetUpcomingBookingsSuccess,
    TResult? Function(_onFailure value)? onFailure,
    TResult? Function(_onTimeValidateSuccess value)? onTimeValidateSuccess,
    TResult? Function(_onTimeValidateFailure value)? onTimeValidateFailure,
    TResult? Function(_onUpdateSessionSuccess value)? onUpdateSessionSuccess,
    TResult? Function(_onAddSessionSuccess value)? onAddSessionSuccess,
    TResult? Function(_onDeleteSessionSuccess value)? onDeleteSessionSuccess,
  }) {
    return onGetSessionDetailsSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_onLoading value)? onLoading,
    TResult Function(_onGetSessionSuccess value)? onGetSessionSuccess,
    TResult Function(_onRatingSuccess value)? onRatingSuccess,
    TResult Function(_onGetPreviousSessionSuccess value)?
        onGetPreviousSessionSuccess,
    TResult Function(_onGetSessionDetailsSuccess value)?
        onGetSessionDetailsSuccess,
    TResult Function(_onGetUpcomingSessionSuccess value)?
        onGetUpcomingSessionSuccess,
    TResult Function(_onGetUpcomingBookingsSuccess value)?
        onGetUpcomingBookingsSuccess,
    TResult Function(_onFailure value)? onFailure,
    TResult Function(_onTimeValidateSuccess value)? onTimeValidateSuccess,
    TResult Function(_onTimeValidateFailure value)? onTimeValidateFailure,
    TResult Function(_onUpdateSessionSuccess value)? onUpdateSessionSuccess,
    TResult Function(_onAddSessionSuccess value)? onAddSessionSuccess,
    TResult Function(_onDeleteSessionSuccess value)? onDeleteSessionSuccess,
    required TResult orElse(),
  }) {
    if (onGetSessionDetailsSuccess != null) {
      return onGetSessionDetailsSuccess(this);
    }
    return orElse();
  }
}

abstract class _onGetSessionDetailsSuccess implements SessionState {
  const factory _onGetSessionDetailsSuccess(final SessionResponseModel model) =
      _$onGetSessionDetailsSuccessImpl;

  SessionResponseModel get model;
  @JsonKey(ignore: true)
  _$$onGetSessionDetailsSuccessImplCopyWith<_$onGetSessionDetailsSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$onGetUpcomingSessionSuccessImplCopyWith<$Res> {
  factory _$$onGetUpcomingSessionSuccessImplCopyWith(
          _$onGetUpcomingSessionSuccessImpl value,
          $Res Function(_$onGetUpcomingSessionSuccessImpl) then) =
      __$$onGetUpcomingSessionSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CommonModel<List<SessionResponseModel>> model});
}

/// @nodoc
class __$$onGetUpcomingSessionSuccessImplCopyWithImpl<$Res>
    extends _$SessionStateCopyWithImpl<$Res, _$onGetUpcomingSessionSuccessImpl>
    implements _$$onGetUpcomingSessionSuccessImplCopyWith<$Res> {
  __$$onGetUpcomingSessionSuccessImplCopyWithImpl(
      _$onGetUpcomingSessionSuccessImpl _value,
      $Res Function(_$onGetUpcomingSessionSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
  }) {
    return _then(_$onGetUpcomingSessionSuccessImpl(
      null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as CommonModel<List<SessionResponseModel>>,
    ));
  }
}

/// @nodoc

class _$onGetUpcomingSessionSuccessImpl
    implements _onGetUpcomingSessionSuccess {
  const _$onGetUpcomingSessionSuccessImpl(this.model);

  @override
  final CommonModel<List<SessionResponseModel>> model;

  @override
  String toString() {
    return 'SessionState.onGetUpcomingSessionSuccess(model: $model)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$onGetUpcomingSessionSuccessImpl &&
            (identical(other.model, model) || other.model == model));
  }

  @override
  int get hashCode => Object.hash(runtimeType, model);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$onGetUpcomingSessionSuccessImplCopyWith<_$onGetUpcomingSessionSuccessImpl>
      get copyWith => __$$onGetUpcomingSessionSuccessImplCopyWithImpl<
          _$onGetUpcomingSessionSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() onLoading,
    required TResult Function(CommonModel<List<SessionResponseModel>> model)
        onGetSessionSuccess,
    required TResult Function(String message) onRatingSuccess,
    required TResult Function(CommonModel<List<SessionResponseModel>> model)
        onGetPreviousSessionSuccess,
    required TResult Function(SessionResponseModel model)
        onGetSessionDetailsSuccess,
    required TResult Function(CommonModel<List<SessionResponseModel>> model)
        onGetUpcomingSessionSuccess,
    required TResult Function(CommonModel<List<SessionResponseModel>> model)
        onGetUpcomingBookingsSuccess,
    required TResult Function(String? message) onFailure,
    required TResult Function() onTimeValidateSuccess,
    required TResult Function(String? message) onTimeValidateFailure,
    required TResult Function(List<SessionResponseModel> model)
        onUpdateSessionSuccess,
    required TResult Function(String model) onAddSessionSuccess,
    required TResult Function(SessionModel model) onDeleteSessionSuccess,
  }) {
    return onGetUpcomingSessionSuccess(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? onLoading,
    TResult? Function(CommonModel<List<SessionResponseModel>> model)?
        onGetSessionSuccess,
    TResult? Function(String message)? onRatingSuccess,
    TResult? Function(CommonModel<List<SessionResponseModel>> model)?
        onGetPreviousSessionSuccess,
    TResult? Function(SessionResponseModel model)? onGetSessionDetailsSuccess,
    TResult? Function(CommonModel<List<SessionResponseModel>> model)?
        onGetUpcomingSessionSuccess,
    TResult? Function(CommonModel<List<SessionResponseModel>> model)?
        onGetUpcomingBookingsSuccess,
    TResult? Function(String? message)? onFailure,
    TResult? Function()? onTimeValidateSuccess,
    TResult? Function(String? message)? onTimeValidateFailure,
    TResult? Function(List<SessionResponseModel> model)? onUpdateSessionSuccess,
    TResult? Function(String model)? onAddSessionSuccess,
    TResult? Function(SessionModel model)? onDeleteSessionSuccess,
  }) {
    return onGetUpcomingSessionSuccess?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onLoading,
    TResult Function(CommonModel<List<SessionResponseModel>> model)?
        onGetSessionSuccess,
    TResult Function(String message)? onRatingSuccess,
    TResult Function(CommonModel<List<SessionResponseModel>> model)?
        onGetPreviousSessionSuccess,
    TResult Function(SessionResponseModel model)? onGetSessionDetailsSuccess,
    TResult Function(CommonModel<List<SessionResponseModel>> model)?
        onGetUpcomingSessionSuccess,
    TResult Function(CommonModel<List<SessionResponseModel>> model)?
        onGetUpcomingBookingsSuccess,
    TResult Function(String? message)? onFailure,
    TResult Function()? onTimeValidateSuccess,
    TResult Function(String? message)? onTimeValidateFailure,
    TResult Function(List<SessionResponseModel> model)? onUpdateSessionSuccess,
    TResult Function(String model)? onAddSessionSuccess,
    TResult Function(SessionModel model)? onDeleteSessionSuccess,
    required TResult orElse(),
  }) {
    if (onGetUpcomingSessionSuccess != null) {
      return onGetUpcomingSessionSuccess(model);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_onLoading value) onLoading,
    required TResult Function(_onGetSessionSuccess value) onGetSessionSuccess,
    required TResult Function(_onRatingSuccess value) onRatingSuccess,
    required TResult Function(_onGetPreviousSessionSuccess value)
        onGetPreviousSessionSuccess,
    required TResult Function(_onGetSessionDetailsSuccess value)
        onGetSessionDetailsSuccess,
    required TResult Function(_onGetUpcomingSessionSuccess value)
        onGetUpcomingSessionSuccess,
    required TResult Function(_onGetUpcomingBookingsSuccess value)
        onGetUpcomingBookingsSuccess,
    required TResult Function(_onFailure value) onFailure,
    required TResult Function(_onTimeValidateSuccess value)
        onTimeValidateSuccess,
    required TResult Function(_onTimeValidateFailure value)
        onTimeValidateFailure,
    required TResult Function(_onUpdateSessionSuccess value)
        onUpdateSessionSuccess,
    required TResult Function(_onAddSessionSuccess value) onAddSessionSuccess,
    required TResult Function(_onDeleteSessionSuccess value)
        onDeleteSessionSuccess,
  }) {
    return onGetUpcomingSessionSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_onLoading value)? onLoading,
    TResult? Function(_onGetSessionSuccess value)? onGetSessionSuccess,
    TResult? Function(_onRatingSuccess value)? onRatingSuccess,
    TResult? Function(_onGetPreviousSessionSuccess value)?
        onGetPreviousSessionSuccess,
    TResult? Function(_onGetSessionDetailsSuccess value)?
        onGetSessionDetailsSuccess,
    TResult? Function(_onGetUpcomingSessionSuccess value)?
        onGetUpcomingSessionSuccess,
    TResult? Function(_onGetUpcomingBookingsSuccess value)?
        onGetUpcomingBookingsSuccess,
    TResult? Function(_onFailure value)? onFailure,
    TResult? Function(_onTimeValidateSuccess value)? onTimeValidateSuccess,
    TResult? Function(_onTimeValidateFailure value)? onTimeValidateFailure,
    TResult? Function(_onUpdateSessionSuccess value)? onUpdateSessionSuccess,
    TResult? Function(_onAddSessionSuccess value)? onAddSessionSuccess,
    TResult? Function(_onDeleteSessionSuccess value)? onDeleteSessionSuccess,
  }) {
    return onGetUpcomingSessionSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_onLoading value)? onLoading,
    TResult Function(_onGetSessionSuccess value)? onGetSessionSuccess,
    TResult Function(_onRatingSuccess value)? onRatingSuccess,
    TResult Function(_onGetPreviousSessionSuccess value)?
        onGetPreviousSessionSuccess,
    TResult Function(_onGetSessionDetailsSuccess value)?
        onGetSessionDetailsSuccess,
    TResult Function(_onGetUpcomingSessionSuccess value)?
        onGetUpcomingSessionSuccess,
    TResult Function(_onGetUpcomingBookingsSuccess value)?
        onGetUpcomingBookingsSuccess,
    TResult Function(_onFailure value)? onFailure,
    TResult Function(_onTimeValidateSuccess value)? onTimeValidateSuccess,
    TResult Function(_onTimeValidateFailure value)? onTimeValidateFailure,
    TResult Function(_onUpdateSessionSuccess value)? onUpdateSessionSuccess,
    TResult Function(_onAddSessionSuccess value)? onAddSessionSuccess,
    TResult Function(_onDeleteSessionSuccess value)? onDeleteSessionSuccess,
    required TResult orElse(),
  }) {
    if (onGetUpcomingSessionSuccess != null) {
      return onGetUpcomingSessionSuccess(this);
    }
    return orElse();
  }
}

abstract class _onGetUpcomingSessionSuccess implements SessionState {
  const factory _onGetUpcomingSessionSuccess(
          final CommonModel<List<SessionResponseModel>> model) =
      _$onGetUpcomingSessionSuccessImpl;

  CommonModel<List<SessionResponseModel>> get model;
  @JsonKey(ignore: true)
  _$$onGetUpcomingSessionSuccessImplCopyWith<_$onGetUpcomingSessionSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$onGetUpcomingBookingsSuccessImplCopyWith<$Res> {
  factory _$$onGetUpcomingBookingsSuccessImplCopyWith(
          _$onGetUpcomingBookingsSuccessImpl value,
          $Res Function(_$onGetUpcomingBookingsSuccessImpl) then) =
      __$$onGetUpcomingBookingsSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CommonModel<List<SessionResponseModel>> model});
}

/// @nodoc
class __$$onGetUpcomingBookingsSuccessImplCopyWithImpl<$Res>
    extends _$SessionStateCopyWithImpl<$Res, _$onGetUpcomingBookingsSuccessImpl>
    implements _$$onGetUpcomingBookingsSuccessImplCopyWith<$Res> {
  __$$onGetUpcomingBookingsSuccessImplCopyWithImpl(
      _$onGetUpcomingBookingsSuccessImpl _value,
      $Res Function(_$onGetUpcomingBookingsSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
  }) {
    return _then(_$onGetUpcomingBookingsSuccessImpl(
      null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as CommonModel<List<SessionResponseModel>>,
    ));
  }
}

/// @nodoc

class _$onGetUpcomingBookingsSuccessImpl
    implements _onGetUpcomingBookingsSuccess {
  const _$onGetUpcomingBookingsSuccessImpl(this.model);

  @override
  final CommonModel<List<SessionResponseModel>> model;

  @override
  String toString() {
    return 'SessionState.onGetUpcomingBookingsSuccess(model: $model)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$onGetUpcomingBookingsSuccessImpl &&
            (identical(other.model, model) || other.model == model));
  }

  @override
  int get hashCode => Object.hash(runtimeType, model);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$onGetUpcomingBookingsSuccessImplCopyWith<
          _$onGetUpcomingBookingsSuccessImpl>
      get copyWith => __$$onGetUpcomingBookingsSuccessImplCopyWithImpl<
          _$onGetUpcomingBookingsSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() onLoading,
    required TResult Function(CommonModel<List<SessionResponseModel>> model)
        onGetSessionSuccess,
    required TResult Function(String message) onRatingSuccess,
    required TResult Function(CommonModel<List<SessionResponseModel>> model)
        onGetPreviousSessionSuccess,
    required TResult Function(SessionResponseModel model)
        onGetSessionDetailsSuccess,
    required TResult Function(CommonModel<List<SessionResponseModel>> model)
        onGetUpcomingSessionSuccess,
    required TResult Function(CommonModel<List<SessionResponseModel>> model)
        onGetUpcomingBookingsSuccess,
    required TResult Function(String? message) onFailure,
    required TResult Function() onTimeValidateSuccess,
    required TResult Function(String? message) onTimeValidateFailure,
    required TResult Function(List<SessionResponseModel> model)
        onUpdateSessionSuccess,
    required TResult Function(String model) onAddSessionSuccess,
    required TResult Function(SessionModel model) onDeleteSessionSuccess,
  }) {
    return onGetUpcomingBookingsSuccess(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? onLoading,
    TResult? Function(CommonModel<List<SessionResponseModel>> model)?
        onGetSessionSuccess,
    TResult? Function(String message)? onRatingSuccess,
    TResult? Function(CommonModel<List<SessionResponseModel>> model)?
        onGetPreviousSessionSuccess,
    TResult? Function(SessionResponseModel model)? onGetSessionDetailsSuccess,
    TResult? Function(CommonModel<List<SessionResponseModel>> model)?
        onGetUpcomingSessionSuccess,
    TResult? Function(CommonModel<List<SessionResponseModel>> model)?
        onGetUpcomingBookingsSuccess,
    TResult? Function(String? message)? onFailure,
    TResult? Function()? onTimeValidateSuccess,
    TResult? Function(String? message)? onTimeValidateFailure,
    TResult? Function(List<SessionResponseModel> model)? onUpdateSessionSuccess,
    TResult? Function(String model)? onAddSessionSuccess,
    TResult? Function(SessionModel model)? onDeleteSessionSuccess,
  }) {
    return onGetUpcomingBookingsSuccess?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onLoading,
    TResult Function(CommonModel<List<SessionResponseModel>> model)?
        onGetSessionSuccess,
    TResult Function(String message)? onRatingSuccess,
    TResult Function(CommonModel<List<SessionResponseModel>> model)?
        onGetPreviousSessionSuccess,
    TResult Function(SessionResponseModel model)? onGetSessionDetailsSuccess,
    TResult Function(CommonModel<List<SessionResponseModel>> model)?
        onGetUpcomingSessionSuccess,
    TResult Function(CommonModel<List<SessionResponseModel>> model)?
        onGetUpcomingBookingsSuccess,
    TResult Function(String? message)? onFailure,
    TResult Function()? onTimeValidateSuccess,
    TResult Function(String? message)? onTimeValidateFailure,
    TResult Function(List<SessionResponseModel> model)? onUpdateSessionSuccess,
    TResult Function(String model)? onAddSessionSuccess,
    TResult Function(SessionModel model)? onDeleteSessionSuccess,
    required TResult orElse(),
  }) {
    if (onGetUpcomingBookingsSuccess != null) {
      return onGetUpcomingBookingsSuccess(model);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_onLoading value) onLoading,
    required TResult Function(_onGetSessionSuccess value) onGetSessionSuccess,
    required TResult Function(_onRatingSuccess value) onRatingSuccess,
    required TResult Function(_onGetPreviousSessionSuccess value)
        onGetPreviousSessionSuccess,
    required TResult Function(_onGetSessionDetailsSuccess value)
        onGetSessionDetailsSuccess,
    required TResult Function(_onGetUpcomingSessionSuccess value)
        onGetUpcomingSessionSuccess,
    required TResult Function(_onGetUpcomingBookingsSuccess value)
        onGetUpcomingBookingsSuccess,
    required TResult Function(_onFailure value) onFailure,
    required TResult Function(_onTimeValidateSuccess value)
        onTimeValidateSuccess,
    required TResult Function(_onTimeValidateFailure value)
        onTimeValidateFailure,
    required TResult Function(_onUpdateSessionSuccess value)
        onUpdateSessionSuccess,
    required TResult Function(_onAddSessionSuccess value) onAddSessionSuccess,
    required TResult Function(_onDeleteSessionSuccess value)
        onDeleteSessionSuccess,
  }) {
    return onGetUpcomingBookingsSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_onLoading value)? onLoading,
    TResult? Function(_onGetSessionSuccess value)? onGetSessionSuccess,
    TResult? Function(_onRatingSuccess value)? onRatingSuccess,
    TResult? Function(_onGetPreviousSessionSuccess value)?
        onGetPreviousSessionSuccess,
    TResult? Function(_onGetSessionDetailsSuccess value)?
        onGetSessionDetailsSuccess,
    TResult? Function(_onGetUpcomingSessionSuccess value)?
        onGetUpcomingSessionSuccess,
    TResult? Function(_onGetUpcomingBookingsSuccess value)?
        onGetUpcomingBookingsSuccess,
    TResult? Function(_onFailure value)? onFailure,
    TResult? Function(_onTimeValidateSuccess value)? onTimeValidateSuccess,
    TResult? Function(_onTimeValidateFailure value)? onTimeValidateFailure,
    TResult? Function(_onUpdateSessionSuccess value)? onUpdateSessionSuccess,
    TResult? Function(_onAddSessionSuccess value)? onAddSessionSuccess,
    TResult? Function(_onDeleteSessionSuccess value)? onDeleteSessionSuccess,
  }) {
    return onGetUpcomingBookingsSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_onLoading value)? onLoading,
    TResult Function(_onGetSessionSuccess value)? onGetSessionSuccess,
    TResult Function(_onRatingSuccess value)? onRatingSuccess,
    TResult Function(_onGetPreviousSessionSuccess value)?
        onGetPreviousSessionSuccess,
    TResult Function(_onGetSessionDetailsSuccess value)?
        onGetSessionDetailsSuccess,
    TResult Function(_onGetUpcomingSessionSuccess value)?
        onGetUpcomingSessionSuccess,
    TResult Function(_onGetUpcomingBookingsSuccess value)?
        onGetUpcomingBookingsSuccess,
    TResult Function(_onFailure value)? onFailure,
    TResult Function(_onTimeValidateSuccess value)? onTimeValidateSuccess,
    TResult Function(_onTimeValidateFailure value)? onTimeValidateFailure,
    TResult Function(_onUpdateSessionSuccess value)? onUpdateSessionSuccess,
    TResult Function(_onAddSessionSuccess value)? onAddSessionSuccess,
    TResult Function(_onDeleteSessionSuccess value)? onDeleteSessionSuccess,
    required TResult orElse(),
  }) {
    if (onGetUpcomingBookingsSuccess != null) {
      return onGetUpcomingBookingsSuccess(this);
    }
    return orElse();
  }
}

abstract class _onGetUpcomingBookingsSuccess implements SessionState {
  const factory _onGetUpcomingBookingsSuccess(
          final CommonModel<List<SessionResponseModel>> model) =
      _$onGetUpcomingBookingsSuccessImpl;

  CommonModel<List<SessionResponseModel>> get model;
  @JsonKey(ignore: true)
  _$$onGetUpcomingBookingsSuccessImplCopyWith<
          _$onGetUpcomingBookingsSuccessImpl>
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
    extends _$SessionStateCopyWithImpl<$Res, _$onFailureImpl>
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
    return 'SessionState.onFailure(message: $message)';
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
    required TResult Function(CommonModel<List<SessionResponseModel>> model)
        onGetSessionSuccess,
    required TResult Function(String message) onRatingSuccess,
    required TResult Function(CommonModel<List<SessionResponseModel>> model)
        onGetPreviousSessionSuccess,
    required TResult Function(SessionResponseModel model)
        onGetSessionDetailsSuccess,
    required TResult Function(CommonModel<List<SessionResponseModel>> model)
        onGetUpcomingSessionSuccess,
    required TResult Function(CommonModel<List<SessionResponseModel>> model)
        onGetUpcomingBookingsSuccess,
    required TResult Function(String? message) onFailure,
    required TResult Function() onTimeValidateSuccess,
    required TResult Function(String? message) onTimeValidateFailure,
    required TResult Function(List<SessionResponseModel> model)
        onUpdateSessionSuccess,
    required TResult Function(String model) onAddSessionSuccess,
    required TResult Function(SessionModel model) onDeleteSessionSuccess,
  }) {
    return onFailure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? onLoading,
    TResult? Function(CommonModel<List<SessionResponseModel>> model)?
        onGetSessionSuccess,
    TResult? Function(String message)? onRatingSuccess,
    TResult? Function(CommonModel<List<SessionResponseModel>> model)?
        onGetPreviousSessionSuccess,
    TResult? Function(SessionResponseModel model)? onGetSessionDetailsSuccess,
    TResult? Function(CommonModel<List<SessionResponseModel>> model)?
        onGetUpcomingSessionSuccess,
    TResult? Function(CommonModel<List<SessionResponseModel>> model)?
        onGetUpcomingBookingsSuccess,
    TResult? Function(String? message)? onFailure,
    TResult? Function()? onTimeValidateSuccess,
    TResult? Function(String? message)? onTimeValidateFailure,
    TResult? Function(List<SessionResponseModel> model)? onUpdateSessionSuccess,
    TResult? Function(String model)? onAddSessionSuccess,
    TResult? Function(SessionModel model)? onDeleteSessionSuccess,
  }) {
    return onFailure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onLoading,
    TResult Function(CommonModel<List<SessionResponseModel>> model)?
        onGetSessionSuccess,
    TResult Function(String message)? onRatingSuccess,
    TResult Function(CommonModel<List<SessionResponseModel>> model)?
        onGetPreviousSessionSuccess,
    TResult Function(SessionResponseModel model)? onGetSessionDetailsSuccess,
    TResult Function(CommonModel<List<SessionResponseModel>> model)?
        onGetUpcomingSessionSuccess,
    TResult Function(CommonModel<List<SessionResponseModel>> model)?
        onGetUpcomingBookingsSuccess,
    TResult Function(String? message)? onFailure,
    TResult Function()? onTimeValidateSuccess,
    TResult Function(String? message)? onTimeValidateFailure,
    TResult Function(List<SessionResponseModel> model)? onUpdateSessionSuccess,
    TResult Function(String model)? onAddSessionSuccess,
    TResult Function(SessionModel model)? onDeleteSessionSuccess,
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
    required TResult Function(_onGetSessionSuccess value) onGetSessionSuccess,
    required TResult Function(_onRatingSuccess value) onRatingSuccess,
    required TResult Function(_onGetPreviousSessionSuccess value)
        onGetPreviousSessionSuccess,
    required TResult Function(_onGetSessionDetailsSuccess value)
        onGetSessionDetailsSuccess,
    required TResult Function(_onGetUpcomingSessionSuccess value)
        onGetUpcomingSessionSuccess,
    required TResult Function(_onGetUpcomingBookingsSuccess value)
        onGetUpcomingBookingsSuccess,
    required TResult Function(_onFailure value) onFailure,
    required TResult Function(_onTimeValidateSuccess value)
        onTimeValidateSuccess,
    required TResult Function(_onTimeValidateFailure value)
        onTimeValidateFailure,
    required TResult Function(_onUpdateSessionSuccess value)
        onUpdateSessionSuccess,
    required TResult Function(_onAddSessionSuccess value) onAddSessionSuccess,
    required TResult Function(_onDeleteSessionSuccess value)
        onDeleteSessionSuccess,
  }) {
    return onFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_onLoading value)? onLoading,
    TResult? Function(_onGetSessionSuccess value)? onGetSessionSuccess,
    TResult? Function(_onRatingSuccess value)? onRatingSuccess,
    TResult? Function(_onGetPreviousSessionSuccess value)?
        onGetPreviousSessionSuccess,
    TResult? Function(_onGetSessionDetailsSuccess value)?
        onGetSessionDetailsSuccess,
    TResult? Function(_onGetUpcomingSessionSuccess value)?
        onGetUpcomingSessionSuccess,
    TResult? Function(_onGetUpcomingBookingsSuccess value)?
        onGetUpcomingBookingsSuccess,
    TResult? Function(_onFailure value)? onFailure,
    TResult? Function(_onTimeValidateSuccess value)? onTimeValidateSuccess,
    TResult? Function(_onTimeValidateFailure value)? onTimeValidateFailure,
    TResult? Function(_onUpdateSessionSuccess value)? onUpdateSessionSuccess,
    TResult? Function(_onAddSessionSuccess value)? onAddSessionSuccess,
    TResult? Function(_onDeleteSessionSuccess value)? onDeleteSessionSuccess,
  }) {
    return onFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_onLoading value)? onLoading,
    TResult Function(_onGetSessionSuccess value)? onGetSessionSuccess,
    TResult Function(_onRatingSuccess value)? onRatingSuccess,
    TResult Function(_onGetPreviousSessionSuccess value)?
        onGetPreviousSessionSuccess,
    TResult Function(_onGetSessionDetailsSuccess value)?
        onGetSessionDetailsSuccess,
    TResult Function(_onGetUpcomingSessionSuccess value)?
        onGetUpcomingSessionSuccess,
    TResult Function(_onGetUpcomingBookingsSuccess value)?
        onGetUpcomingBookingsSuccess,
    TResult Function(_onFailure value)? onFailure,
    TResult Function(_onTimeValidateSuccess value)? onTimeValidateSuccess,
    TResult Function(_onTimeValidateFailure value)? onTimeValidateFailure,
    TResult Function(_onUpdateSessionSuccess value)? onUpdateSessionSuccess,
    TResult Function(_onAddSessionSuccess value)? onAddSessionSuccess,
    TResult Function(_onDeleteSessionSuccess value)? onDeleteSessionSuccess,
    required TResult orElse(),
  }) {
    if (onFailure != null) {
      return onFailure(this);
    }
    return orElse();
  }
}

abstract class _onFailure implements SessionState {
  const factory _onFailure(final String? message) = _$onFailureImpl;

  String? get message;
  @JsonKey(ignore: true)
  _$$onFailureImplCopyWith<_$onFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$onTimeValidateSuccessImplCopyWith<$Res> {
  factory _$$onTimeValidateSuccessImplCopyWith(
          _$onTimeValidateSuccessImpl value,
          $Res Function(_$onTimeValidateSuccessImpl) then) =
      __$$onTimeValidateSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$onTimeValidateSuccessImplCopyWithImpl<$Res>
    extends _$SessionStateCopyWithImpl<$Res, _$onTimeValidateSuccessImpl>
    implements _$$onTimeValidateSuccessImplCopyWith<$Res> {
  __$$onTimeValidateSuccessImplCopyWithImpl(_$onTimeValidateSuccessImpl _value,
      $Res Function(_$onTimeValidateSuccessImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$onTimeValidateSuccessImpl implements _onTimeValidateSuccess {
  const _$onTimeValidateSuccessImpl();

  @override
  String toString() {
    return 'SessionState.onTimeValidateSuccess()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$onTimeValidateSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() onLoading,
    required TResult Function(CommonModel<List<SessionResponseModel>> model)
        onGetSessionSuccess,
    required TResult Function(String message) onRatingSuccess,
    required TResult Function(CommonModel<List<SessionResponseModel>> model)
        onGetPreviousSessionSuccess,
    required TResult Function(SessionResponseModel model)
        onGetSessionDetailsSuccess,
    required TResult Function(CommonModel<List<SessionResponseModel>> model)
        onGetUpcomingSessionSuccess,
    required TResult Function(CommonModel<List<SessionResponseModel>> model)
        onGetUpcomingBookingsSuccess,
    required TResult Function(String? message) onFailure,
    required TResult Function() onTimeValidateSuccess,
    required TResult Function(String? message) onTimeValidateFailure,
    required TResult Function(List<SessionResponseModel> model)
        onUpdateSessionSuccess,
    required TResult Function(String model) onAddSessionSuccess,
    required TResult Function(SessionModel model) onDeleteSessionSuccess,
  }) {
    return onTimeValidateSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? onLoading,
    TResult? Function(CommonModel<List<SessionResponseModel>> model)?
        onGetSessionSuccess,
    TResult? Function(String message)? onRatingSuccess,
    TResult? Function(CommonModel<List<SessionResponseModel>> model)?
        onGetPreviousSessionSuccess,
    TResult? Function(SessionResponseModel model)? onGetSessionDetailsSuccess,
    TResult? Function(CommonModel<List<SessionResponseModel>> model)?
        onGetUpcomingSessionSuccess,
    TResult? Function(CommonModel<List<SessionResponseModel>> model)?
        onGetUpcomingBookingsSuccess,
    TResult? Function(String? message)? onFailure,
    TResult? Function()? onTimeValidateSuccess,
    TResult? Function(String? message)? onTimeValidateFailure,
    TResult? Function(List<SessionResponseModel> model)? onUpdateSessionSuccess,
    TResult? Function(String model)? onAddSessionSuccess,
    TResult? Function(SessionModel model)? onDeleteSessionSuccess,
  }) {
    return onTimeValidateSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onLoading,
    TResult Function(CommonModel<List<SessionResponseModel>> model)?
        onGetSessionSuccess,
    TResult Function(String message)? onRatingSuccess,
    TResult Function(CommonModel<List<SessionResponseModel>> model)?
        onGetPreviousSessionSuccess,
    TResult Function(SessionResponseModel model)? onGetSessionDetailsSuccess,
    TResult Function(CommonModel<List<SessionResponseModel>> model)?
        onGetUpcomingSessionSuccess,
    TResult Function(CommonModel<List<SessionResponseModel>> model)?
        onGetUpcomingBookingsSuccess,
    TResult Function(String? message)? onFailure,
    TResult Function()? onTimeValidateSuccess,
    TResult Function(String? message)? onTimeValidateFailure,
    TResult Function(List<SessionResponseModel> model)? onUpdateSessionSuccess,
    TResult Function(String model)? onAddSessionSuccess,
    TResult Function(SessionModel model)? onDeleteSessionSuccess,
    required TResult orElse(),
  }) {
    if (onTimeValidateSuccess != null) {
      return onTimeValidateSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_onLoading value) onLoading,
    required TResult Function(_onGetSessionSuccess value) onGetSessionSuccess,
    required TResult Function(_onRatingSuccess value) onRatingSuccess,
    required TResult Function(_onGetPreviousSessionSuccess value)
        onGetPreviousSessionSuccess,
    required TResult Function(_onGetSessionDetailsSuccess value)
        onGetSessionDetailsSuccess,
    required TResult Function(_onGetUpcomingSessionSuccess value)
        onGetUpcomingSessionSuccess,
    required TResult Function(_onGetUpcomingBookingsSuccess value)
        onGetUpcomingBookingsSuccess,
    required TResult Function(_onFailure value) onFailure,
    required TResult Function(_onTimeValidateSuccess value)
        onTimeValidateSuccess,
    required TResult Function(_onTimeValidateFailure value)
        onTimeValidateFailure,
    required TResult Function(_onUpdateSessionSuccess value)
        onUpdateSessionSuccess,
    required TResult Function(_onAddSessionSuccess value) onAddSessionSuccess,
    required TResult Function(_onDeleteSessionSuccess value)
        onDeleteSessionSuccess,
  }) {
    return onTimeValidateSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_onLoading value)? onLoading,
    TResult? Function(_onGetSessionSuccess value)? onGetSessionSuccess,
    TResult? Function(_onRatingSuccess value)? onRatingSuccess,
    TResult? Function(_onGetPreviousSessionSuccess value)?
        onGetPreviousSessionSuccess,
    TResult? Function(_onGetSessionDetailsSuccess value)?
        onGetSessionDetailsSuccess,
    TResult? Function(_onGetUpcomingSessionSuccess value)?
        onGetUpcomingSessionSuccess,
    TResult? Function(_onGetUpcomingBookingsSuccess value)?
        onGetUpcomingBookingsSuccess,
    TResult? Function(_onFailure value)? onFailure,
    TResult? Function(_onTimeValidateSuccess value)? onTimeValidateSuccess,
    TResult? Function(_onTimeValidateFailure value)? onTimeValidateFailure,
    TResult? Function(_onUpdateSessionSuccess value)? onUpdateSessionSuccess,
    TResult? Function(_onAddSessionSuccess value)? onAddSessionSuccess,
    TResult? Function(_onDeleteSessionSuccess value)? onDeleteSessionSuccess,
  }) {
    return onTimeValidateSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_onLoading value)? onLoading,
    TResult Function(_onGetSessionSuccess value)? onGetSessionSuccess,
    TResult Function(_onRatingSuccess value)? onRatingSuccess,
    TResult Function(_onGetPreviousSessionSuccess value)?
        onGetPreviousSessionSuccess,
    TResult Function(_onGetSessionDetailsSuccess value)?
        onGetSessionDetailsSuccess,
    TResult Function(_onGetUpcomingSessionSuccess value)?
        onGetUpcomingSessionSuccess,
    TResult Function(_onGetUpcomingBookingsSuccess value)?
        onGetUpcomingBookingsSuccess,
    TResult Function(_onFailure value)? onFailure,
    TResult Function(_onTimeValidateSuccess value)? onTimeValidateSuccess,
    TResult Function(_onTimeValidateFailure value)? onTimeValidateFailure,
    TResult Function(_onUpdateSessionSuccess value)? onUpdateSessionSuccess,
    TResult Function(_onAddSessionSuccess value)? onAddSessionSuccess,
    TResult Function(_onDeleteSessionSuccess value)? onDeleteSessionSuccess,
    required TResult orElse(),
  }) {
    if (onTimeValidateSuccess != null) {
      return onTimeValidateSuccess(this);
    }
    return orElse();
  }
}

abstract class _onTimeValidateSuccess implements SessionState {
  const factory _onTimeValidateSuccess() = _$onTimeValidateSuccessImpl;
}

/// @nodoc
abstract class _$$onTimeValidateFailureImplCopyWith<$Res> {
  factory _$$onTimeValidateFailureImplCopyWith(
          _$onTimeValidateFailureImpl value,
          $Res Function(_$onTimeValidateFailureImpl) then) =
      __$$onTimeValidateFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$onTimeValidateFailureImplCopyWithImpl<$Res>
    extends _$SessionStateCopyWithImpl<$Res, _$onTimeValidateFailureImpl>
    implements _$$onTimeValidateFailureImplCopyWith<$Res> {
  __$$onTimeValidateFailureImplCopyWithImpl(_$onTimeValidateFailureImpl _value,
      $Res Function(_$onTimeValidateFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$onTimeValidateFailureImpl(
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$onTimeValidateFailureImpl implements _onTimeValidateFailure {
  const _$onTimeValidateFailureImpl(this.message);

  @override
  final String? message;

  @override
  String toString() {
    return 'SessionState.onTimeValidateFailure(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$onTimeValidateFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$onTimeValidateFailureImplCopyWith<_$onTimeValidateFailureImpl>
      get copyWith => __$$onTimeValidateFailureImplCopyWithImpl<
          _$onTimeValidateFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() onLoading,
    required TResult Function(CommonModel<List<SessionResponseModel>> model)
        onGetSessionSuccess,
    required TResult Function(String message) onRatingSuccess,
    required TResult Function(CommonModel<List<SessionResponseModel>> model)
        onGetPreviousSessionSuccess,
    required TResult Function(SessionResponseModel model)
        onGetSessionDetailsSuccess,
    required TResult Function(CommonModel<List<SessionResponseModel>> model)
        onGetUpcomingSessionSuccess,
    required TResult Function(CommonModel<List<SessionResponseModel>> model)
        onGetUpcomingBookingsSuccess,
    required TResult Function(String? message) onFailure,
    required TResult Function() onTimeValidateSuccess,
    required TResult Function(String? message) onTimeValidateFailure,
    required TResult Function(List<SessionResponseModel> model)
        onUpdateSessionSuccess,
    required TResult Function(String model) onAddSessionSuccess,
    required TResult Function(SessionModel model) onDeleteSessionSuccess,
  }) {
    return onTimeValidateFailure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? onLoading,
    TResult? Function(CommonModel<List<SessionResponseModel>> model)?
        onGetSessionSuccess,
    TResult? Function(String message)? onRatingSuccess,
    TResult? Function(CommonModel<List<SessionResponseModel>> model)?
        onGetPreviousSessionSuccess,
    TResult? Function(SessionResponseModel model)? onGetSessionDetailsSuccess,
    TResult? Function(CommonModel<List<SessionResponseModel>> model)?
        onGetUpcomingSessionSuccess,
    TResult? Function(CommonModel<List<SessionResponseModel>> model)?
        onGetUpcomingBookingsSuccess,
    TResult? Function(String? message)? onFailure,
    TResult? Function()? onTimeValidateSuccess,
    TResult? Function(String? message)? onTimeValidateFailure,
    TResult? Function(List<SessionResponseModel> model)? onUpdateSessionSuccess,
    TResult? Function(String model)? onAddSessionSuccess,
    TResult? Function(SessionModel model)? onDeleteSessionSuccess,
  }) {
    return onTimeValidateFailure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onLoading,
    TResult Function(CommonModel<List<SessionResponseModel>> model)?
        onGetSessionSuccess,
    TResult Function(String message)? onRatingSuccess,
    TResult Function(CommonModel<List<SessionResponseModel>> model)?
        onGetPreviousSessionSuccess,
    TResult Function(SessionResponseModel model)? onGetSessionDetailsSuccess,
    TResult Function(CommonModel<List<SessionResponseModel>> model)?
        onGetUpcomingSessionSuccess,
    TResult Function(CommonModel<List<SessionResponseModel>> model)?
        onGetUpcomingBookingsSuccess,
    TResult Function(String? message)? onFailure,
    TResult Function()? onTimeValidateSuccess,
    TResult Function(String? message)? onTimeValidateFailure,
    TResult Function(List<SessionResponseModel> model)? onUpdateSessionSuccess,
    TResult Function(String model)? onAddSessionSuccess,
    TResult Function(SessionModel model)? onDeleteSessionSuccess,
    required TResult orElse(),
  }) {
    if (onTimeValidateFailure != null) {
      return onTimeValidateFailure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_onLoading value) onLoading,
    required TResult Function(_onGetSessionSuccess value) onGetSessionSuccess,
    required TResult Function(_onRatingSuccess value) onRatingSuccess,
    required TResult Function(_onGetPreviousSessionSuccess value)
        onGetPreviousSessionSuccess,
    required TResult Function(_onGetSessionDetailsSuccess value)
        onGetSessionDetailsSuccess,
    required TResult Function(_onGetUpcomingSessionSuccess value)
        onGetUpcomingSessionSuccess,
    required TResult Function(_onGetUpcomingBookingsSuccess value)
        onGetUpcomingBookingsSuccess,
    required TResult Function(_onFailure value) onFailure,
    required TResult Function(_onTimeValidateSuccess value)
        onTimeValidateSuccess,
    required TResult Function(_onTimeValidateFailure value)
        onTimeValidateFailure,
    required TResult Function(_onUpdateSessionSuccess value)
        onUpdateSessionSuccess,
    required TResult Function(_onAddSessionSuccess value) onAddSessionSuccess,
    required TResult Function(_onDeleteSessionSuccess value)
        onDeleteSessionSuccess,
  }) {
    return onTimeValidateFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_onLoading value)? onLoading,
    TResult? Function(_onGetSessionSuccess value)? onGetSessionSuccess,
    TResult? Function(_onRatingSuccess value)? onRatingSuccess,
    TResult? Function(_onGetPreviousSessionSuccess value)?
        onGetPreviousSessionSuccess,
    TResult? Function(_onGetSessionDetailsSuccess value)?
        onGetSessionDetailsSuccess,
    TResult? Function(_onGetUpcomingSessionSuccess value)?
        onGetUpcomingSessionSuccess,
    TResult? Function(_onGetUpcomingBookingsSuccess value)?
        onGetUpcomingBookingsSuccess,
    TResult? Function(_onFailure value)? onFailure,
    TResult? Function(_onTimeValidateSuccess value)? onTimeValidateSuccess,
    TResult? Function(_onTimeValidateFailure value)? onTimeValidateFailure,
    TResult? Function(_onUpdateSessionSuccess value)? onUpdateSessionSuccess,
    TResult? Function(_onAddSessionSuccess value)? onAddSessionSuccess,
    TResult? Function(_onDeleteSessionSuccess value)? onDeleteSessionSuccess,
  }) {
    return onTimeValidateFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_onLoading value)? onLoading,
    TResult Function(_onGetSessionSuccess value)? onGetSessionSuccess,
    TResult Function(_onRatingSuccess value)? onRatingSuccess,
    TResult Function(_onGetPreviousSessionSuccess value)?
        onGetPreviousSessionSuccess,
    TResult Function(_onGetSessionDetailsSuccess value)?
        onGetSessionDetailsSuccess,
    TResult Function(_onGetUpcomingSessionSuccess value)?
        onGetUpcomingSessionSuccess,
    TResult Function(_onGetUpcomingBookingsSuccess value)?
        onGetUpcomingBookingsSuccess,
    TResult Function(_onFailure value)? onFailure,
    TResult Function(_onTimeValidateSuccess value)? onTimeValidateSuccess,
    TResult Function(_onTimeValidateFailure value)? onTimeValidateFailure,
    TResult Function(_onUpdateSessionSuccess value)? onUpdateSessionSuccess,
    TResult Function(_onAddSessionSuccess value)? onAddSessionSuccess,
    TResult Function(_onDeleteSessionSuccess value)? onDeleteSessionSuccess,
    required TResult orElse(),
  }) {
    if (onTimeValidateFailure != null) {
      return onTimeValidateFailure(this);
    }
    return orElse();
  }
}

abstract class _onTimeValidateFailure implements SessionState {
  const factory _onTimeValidateFailure(final String? message) =
      _$onTimeValidateFailureImpl;

  String? get message;
  @JsonKey(ignore: true)
  _$$onTimeValidateFailureImplCopyWith<_$onTimeValidateFailureImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$onUpdateSessionSuccessImplCopyWith<$Res> {
  factory _$$onUpdateSessionSuccessImplCopyWith(
          _$onUpdateSessionSuccessImpl value,
          $Res Function(_$onUpdateSessionSuccessImpl) then) =
      __$$onUpdateSessionSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<SessionResponseModel> model});
}

/// @nodoc
class __$$onUpdateSessionSuccessImplCopyWithImpl<$Res>
    extends _$SessionStateCopyWithImpl<$Res, _$onUpdateSessionSuccessImpl>
    implements _$$onUpdateSessionSuccessImplCopyWith<$Res> {
  __$$onUpdateSessionSuccessImplCopyWithImpl(
      _$onUpdateSessionSuccessImpl _value,
      $Res Function(_$onUpdateSessionSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
  }) {
    return _then(_$onUpdateSessionSuccessImpl(
      null == model
          ? _value._model
          : model // ignore: cast_nullable_to_non_nullable
              as List<SessionResponseModel>,
    ));
  }
}

/// @nodoc

class _$onUpdateSessionSuccessImpl implements _onUpdateSessionSuccess {
  const _$onUpdateSessionSuccessImpl(final List<SessionResponseModel> model)
      : _model = model;

  final List<SessionResponseModel> _model;
  @override
  List<SessionResponseModel> get model {
    if (_model is EqualUnmodifiableListView) return _model;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_model);
  }

  @override
  String toString() {
    return 'SessionState.onUpdateSessionSuccess(model: $model)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$onUpdateSessionSuccessImpl &&
            const DeepCollectionEquality().equals(other._model, _model));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_model));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$onUpdateSessionSuccessImplCopyWith<_$onUpdateSessionSuccessImpl>
      get copyWith => __$$onUpdateSessionSuccessImplCopyWithImpl<
          _$onUpdateSessionSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() onLoading,
    required TResult Function(CommonModel<List<SessionResponseModel>> model)
        onGetSessionSuccess,
    required TResult Function(String message) onRatingSuccess,
    required TResult Function(CommonModel<List<SessionResponseModel>> model)
        onGetPreviousSessionSuccess,
    required TResult Function(SessionResponseModel model)
        onGetSessionDetailsSuccess,
    required TResult Function(CommonModel<List<SessionResponseModel>> model)
        onGetUpcomingSessionSuccess,
    required TResult Function(CommonModel<List<SessionResponseModel>> model)
        onGetUpcomingBookingsSuccess,
    required TResult Function(String? message) onFailure,
    required TResult Function() onTimeValidateSuccess,
    required TResult Function(String? message) onTimeValidateFailure,
    required TResult Function(List<SessionResponseModel> model)
        onUpdateSessionSuccess,
    required TResult Function(String model) onAddSessionSuccess,
    required TResult Function(SessionModel model) onDeleteSessionSuccess,
  }) {
    return onUpdateSessionSuccess(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? onLoading,
    TResult? Function(CommonModel<List<SessionResponseModel>> model)?
        onGetSessionSuccess,
    TResult? Function(String message)? onRatingSuccess,
    TResult? Function(CommonModel<List<SessionResponseModel>> model)?
        onGetPreviousSessionSuccess,
    TResult? Function(SessionResponseModel model)? onGetSessionDetailsSuccess,
    TResult? Function(CommonModel<List<SessionResponseModel>> model)?
        onGetUpcomingSessionSuccess,
    TResult? Function(CommonModel<List<SessionResponseModel>> model)?
        onGetUpcomingBookingsSuccess,
    TResult? Function(String? message)? onFailure,
    TResult? Function()? onTimeValidateSuccess,
    TResult? Function(String? message)? onTimeValidateFailure,
    TResult? Function(List<SessionResponseModel> model)? onUpdateSessionSuccess,
    TResult? Function(String model)? onAddSessionSuccess,
    TResult? Function(SessionModel model)? onDeleteSessionSuccess,
  }) {
    return onUpdateSessionSuccess?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onLoading,
    TResult Function(CommonModel<List<SessionResponseModel>> model)?
        onGetSessionSuccess,
    TResult Function(String message)? onRatingSuccess,
    TResult Function(CommonModel<List<SessionResponseModel>> model)?
        onGetPreviousSessionSuccess,
    TResult Function(SessionResponseModel model)? onGetSessionDetailsSuccess,
    TResult Function(CommonModel<List<SessionResponseModel>> model)?
        onGetUpcomingSessionSuccess,
    TResult Function(CommonModel<List<SessionResponseModel>> model)?
        onGetUpcomingBookingsSuccess,
    TResult Function(String? message)? onFailure,
    TResult Function()? onTimeValidateSuccess,
    TResult Function(String? message)? onTimeValidateFailure,
    TResult Function(List<SessionResponseModel> model)? onUpdateSessionSuccess,
    TResult Function(String model)? onAddSessionSuccess,
    TResult Function(SessionModel model)? onDeleteSessionSuccess,
    required TResult orElse(),
  }) {
    if (onUpdateSessionSuccess != null) {
      return onUpdateSessionSuccess(model);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_onLoading value) onLoading,
    required TResult Function(_onGetSessionSuccess value) onGetSessionSuccess,
    required TResult Function(_onRatingSuccess value) onRatingSuccess,
    required TResult Function(_onGetPreviousSessionSuccess value)
        onGetPreviousSessionSuccess,
    required TResult Function(_onGetSessionDetailsSuccess value)
        onGetSessionDetailsSuccess,
    required TResult Function(_onGetUpcomingSessionSuccess value)
        onGetUpcomingSessionSuccess,
    required TResult Function(_onGetUpcomingBookingsSuccess value)
        onGetUpcomingBookingsSuccess,
    required TResult Function(_onFailure value) onFailure,
    required TResult Function(_onTimeValidateSuccess value)
        onTimeValidateSuccess,
    required TResult Function(_onTimeValidateFailure value)
        onTimeValidateFailure,
    required TResult Function(_onUpdateSessionSuccess value)
        onUpdateSessionSuccess,
    required TResult Function(_onAddSessionSuccess value) onAddSessionSuccess,
    required TResult Function(_onDeleteSessionSuccess value)
        onDeleteSessionSuccess,
  }) {
    return onUpdateSessionSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_onLoading value)? onLoading,
    TResult? Function(_onGetSessionSuccess value)? onGetSessionSuccess,
    TResult? Function(_onRatingSuccess value)? onRatingSuccess,
    TResult? Function(_onGetPreviousSessionSuccess value)?
        onGetPreviousSessionSuccess,
    TResult? Function(_onGetSessionDetailsSuccess value)?
        onGetSessionDetailsSuccess,
    TResult? Function(_onGetUpcomingSessionSuccess value)?
        onGetUpcomingSessionSuccess,
    TResult? Function(_onGetUpcomingBookingsSuccess value)?
        onGetUpcomingBookingsSuccess,
    TResult? Function(_onFailure value)? onFailure,
    TResult? Function(_onTimeValidateSuccess value)? onTimeValidateSuccess,
    TResult? Function(_onTimeValidateFailure value)? onTimeValidateFailure,
    TResult? Function(_onUpdateSessionSuccess value)? onUpdateSessionSuccess,
    TResult? Function(_onAddSessionSuccess value)? onAddSessionSuccess,
    TResult? Function(_onDeleteSessionSuccess value)? onDeleteSessionSuccess,
  }) {
    return onUpdateSessionSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_onLoading value)? onLoading,
    TResult Function(_onGetSessionSuccess value)? onGetSessionSuccess,
    TResult Function(_onRatingSuccess value)? onRatingSuccess,
    TResult Function(_onGetPreviousSessionSuccess value)?
        onGetPreviousSessionSuccess,
    TResult Function(_onGetSessionDetailsSuccess value)?
        onGetSessionDetailsSuccess,
    TResult Function(_onGetUpcomingSessionSuccess value)?
        onGetUpcomingSessionSuccess,
    TResult Function(_onGetUpcomingBookingsSuccess value)?
        onGetUpcomingBookingsSuccess,
    TResult Function(_onFailure value)? onFailure,
    TResult Function(_onTimeValidateSuccess value)? onTimeValidateSuccess,
    TResult Function(_onTimeValidateFailure value)? onTimeValidateFailure,
    TResult Function(_onUpdateSessionSuccess value)? onUpdateSessionSuccess,
    TResult Function(_onAddSessionSuccess value)? onAddSessionSuccess,
    TResult Function(_onDeleteSessionSuccess value)? onDeleteSessionSuccess,
    required TResult orElse(),
  }) {
    if (onUpdateSessionSuccess != null) {
      return onUpdateSessionSuccess(this);
    }
    return orElse();
  }
}

abstract class _onUpdateSessionSuccess implements SessionState {
  const factory _onUpdateSessionSuccess(
      final List<SessionResponseModel> model) = _$onUpdateSessionSuccessImpl;

  List<SessionResponseModel> get model;
  @JsonKey(ignore: true)
  _$$onUpdateSessionSuccessImplCopyWith<_$onUpdateSessionSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$onAddSessionSuccessImplCopyWith<$Res> {
  factory _$$onAddSessionSuccessImplCopyWith(_$onAddSessionSuccessImpl value,
          $Res Function(_$onAddSessionSuccessImpl) then) =
      __$$onAddSessionSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String model});
}

/// @nodoc
class __$$onAddSessionSuccessImplCopyWithImpl<$Res>
    extends _$SessionStateCopyWithImpl<$Res, _$onAddSessionSuccessImpl>
    implements _$$onAddSessionSuccessImplCopyWith<$Res> {
  __$$onAddSessionSuccessImplCopyWithImpl(_$onAddSessionSuccessImpl _value,
      $Res Function(_$onAddSessionSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
  }) {
    return _then(_$onAddSessionSuccessImpl(
      null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$onAddSessionSuccessImpl implements _onAddSessionSuccess {
  const _$onAddSessionSuccessImpl(this.model);

  @override
  final String model;

  @override
  String toString() {
    return 'SessionState.onAddSessionSuccess(model: $model)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$onAddSessionSuccessImpl &&
            (identical(other.model, model) || other.model == model));
  }

  @override
  int get hashCode => Object.hash(runtimeType, model);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$onAddSessionSuccessImplCopyWith<_$onAddSessionSuccessImpl> get copyWith =>
      __$$onAddSessionSuccessImplCopyWithImpl<_$onAddSessionSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() onLoading,
    required TResult Function(CommonModel<List<SessionResponseModel>> model)
        onGetSessionSuccess,
    required TResult Function(String message) onRatingSuccess,
    required TResult Function(CommonModel<List<SessionResponseModel>> model)
        onGetPreviousSessionSuccess,
    required TResult Function(SessionResponseModel model)
        onGetSessionDetailsSuccess,
    required TResult Function(CommonModel<List<SessionResponseModel>> model)
        onGetUpcomingSessionSuccess,
    required TResult Function(CommonModel<List<SessionResponseModel>> model)
        onGetUpcomingBookingsSuccess,
    required TResult Function(String? message) onFailure,
    required TResult Function() onTimeValidateSuccess,
    required TResult Function(String? message) onTimeValidateFailure,
    required TResult Function(List<SessionResponseModel> model)
        onUpdateSessionSuccess,
    required TResult Function(String model) onAddSessionSuccess,
    required TResult Function(SessionModel model) onDeleteSessionSuccess,
  }) {
    return onAddSessionSuccess(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? onLoading,
    TResult? Function(CommonModel<List<SessionResponseModel>> model)?
        onGetSessionSuccess,
    TResult? Function(String message)? onRatingSuccess,
    TResult? Function(CommonModel<List<SessionResponseModel>> model)?
        onGetPreviousSessionSuccess,
    TResult? Function(SessionResponseModel model)? onGetSessionDetailsSuccess,
    TResult? Function(CommonModel<List<SessionResponseModel>> model)?
        onGetUpcomingSessionSuccess,
    TResult? Function(CommonModel<List<SessionResponseModel>> model)?
        onGetUpcomingBookingsSuccess,
    TResult? Function(String? message)? onFailure,
    TResult? Function()? onTimeValidateSuccess,
    TResult? Function(String? message)? onTimeValidateFailure,
    TResult? Function(List<SessionResponseModel> model)? onUpdateSessionSuccess,
    TResult? Function(String model)? onAddSessionSuccess,
    TResult? Function(SessionModel model)? onDeleteSessionSuccess,
  }) {
    return onAddSessionSuccess?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onLoading,
    TResult Function(CommonModel<List<SessionResponseModel>> model)?
        onGetSessionSuccess,
    TResult Function(String message)? onRatingSuccess,
    TResult Function(CommonModel<List<SessionResponseModel>> model)?
        onGetPreviousSessionSuccess,
    TResult Function(SessionResponseModel model)? onGetSessionDetailsSuccess,
    TResult Function(CommonModel<List<SessionResponseModel>> model)?
        onGetUpcomingSessionSuccess,
    TResult Function(CommonModel<List<SessionResponseModel>> model)?
        onGetUpcomingBookingsSuccess,
    TResult Function(String? message)? onFailure,
    TResult Function()? onTimeValidateSuccess,
    TResult Function(String? message)? onTimeValidateFailure,
    TResult Function(List<SessionResponseModel> model)? onUpdateSessionSuccess,
    TResult Function(String model)? onAddSessionSuccess,
    TResult Function(SessionModel model)? onDeleteSessionSuccess,
    required TResult orElse(),
  }) {
    if (onAddSessionSuccess != null) {
      return onAddSessionSuccess(model);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_onLoading value) onLoading,
    required TResult Function(_onGetSessionSuccess value) onGetSessionSuccess,
    required TResult Function(_onRatingSuccess value) onRatingSuccess,
    required TResult Function(_onGetPreviousSessionSuccess value)
        onGetPreviousSessionSuccess,
    required TResult Function(_onGetSessionDetailsSuccess value)
        onGetSessionDetailsSuccess,
    required TResult Function(_onGetUpcomingSessionSuccess value)
        onGetUpcomingSessionSuccess,
    required TResult Function(_onGetUpcomingBookingsSuccess value)
        onGetUpcomingBookingsSuccess,
    required TResult Function(_onFailure value) onFailure,
    required TResult Function(_onTimeValidateSuccess value)
        onTimeValidateSuccess,
    required TResult Function(_onTimeValidateFailure value)
        onTimeValidateFailure,
    required TResult Function(_onUpdateSessionSuccess value)
        onUpdateSessionSuccess,
    required TResult Function(_onAddSessionSuccess value) onAddSessionSuccess,
    required TResult Function(_onDeleteSessionSuccess value)
        onDeleteSessionSuccess,
  }) {
    return onAddSessionSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_onLoading value)? onLoading,
    TResult? Function(_onGetSessionSuccess value)? onGetSessionSuccess,
    TResult? Function(_onRatingSuccess value)? onRatingSuccess,
    TResult? Function(_onGetPreviousSessionSuccess value)?
        onGetPreviousSessionSuccess,
    TResult? Function(_onGetSessionDetailsSuccess value)?
        onGetSessionDetailsSuccess,
    TResult? Function(_onGetUpcomingSessionSuccess value)?
        onGetUpcomingSessionSuccess,
    TResult? Function(_onGetUpcomingBookingsSuccess value)?
        onGetUpcomingBookingsSuccess,
    TResult? Function(_onFailure value)? onFailure,
    TResult? Function(_onTimeValidateSuccess value)? onTimeValidateSuccess,
    TResult? Function(_onTimeValidateFailure value)? onTimeValidateFailure,
    TResult? Function(_onUpdateSessionSuccess value)? onUpdateSessionSuccess,
    TResult? Function(_onAddSessionSuccess value)? onAddSessionSuccess,
    TResult? Function(_onDeleteSessionSuccess value)? onDeleteSessionSuccess,
  }) {
    return onAddSessionSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_onLoading value)? onLoading,
    TResult Function(_onGetSessionSuccess value)? onGetSessionSuccess,
    TResult Function(_onRatingSuccess value)? onRatingSuccess,
    TResult Function(_onGetPreviousSessionSuccess value)?
        onGetPreviousSessionSuccess,
    TResult Function(_onGetSessionDetailsSuccess value)?
        onGetSessionDetailsSuccess,
    TResult Function(_onGetUpcomingSessionSuccess value)?
        onGetUpcomingSessionSuccess,
    TResult Function(_onGetUpcomingBookingsSuccess value)?
        onGetUpcomingBookingsSuccess,
    TResult Function(_onFailure value)? onFailure,
    TResult Function(_onTimeValidateSuccess value)? onTimeValidateSuccess,
    TResult Function(_onTimeValidateFailure value)? onTimeValidateFailure,
    TResult Function(_onUpdateSessionSuccess value)? onUpdateSessionSuccess,
    TResult Function(_onAddSessionSuccess value)? onAddSessionSuccess,
    TResult Function(_onDeleteSessionSuccess value)? onDeleteSessionSuccess,
    required TResult orElse(),
  }) {
    if (onAddSessionSuccess != null) {
      return onAddSessionSuccess(this);
    }
    return orElse();
  }
}

abstract class _onAddSessionSuccess implements SessionState {
  const factory _onAddSessionSuccess(final String model) =
      _$onAddSessionSuccessImpl;

  String get model;
  @JsonKey(ignore: true)
  _$$onAddSessionSuccessImplCopyWith<_$onAddSessionSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$onDeleteSessionSuccessImplCopyWith<$Res> {
  factory _$$onDeleteSessionSuccessImplCopyWith(
          _$onDeleteSessionSuccessImpl value,
          $Res Function(_$onDeleteSessionSuccessImpl) then) =
      __$$onDeleteSessionSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SessionModel model});
}

/// @nodoc
class __$$onDeleteSessionSuccessImplCopyWithImpl<$Res>
    extends _$SessionStateCopyWithImpl<$Res, _$onDeleteSessionSuccessImpl>
    implements _$$onDeleteSessionSuccessImplCopyWith<$Res> {
  __$$onDeleteSessionSuccessImplCopyWithImpl(
      _$onDeleteSessionSuccessImpl _value,
      $Res Function(_$onDeleteSessionSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
  }) {
    return _then(_$onDeleteSessionSuccessImpl(
      null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as SessionModel,
    ));
  }
}

/// @nodoc

class _$onDeleteSessionSuccessImpl implements _onDeleteSessionSuccess {
  const _$onDeleteSessionSuccessImpl(this.model);

  @override
  final SessionModel model;

  @override
  String toString() {
    return 'SessionState.onDeleteSessionSuccess(model: $model)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$onDeleteSessionSuccessImpl &&
            (identical(other.model, model) || other.model == model));
  }

  @override
  int get hashCode => Object.hash(runtimeType, model);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$onDeleteSessionSuccessImplCopyWith<_$onDeleteSessionSuccessImpl>
      get copyWith => __$$onDeleteSessionSuccessImplCopyWithImpl<
          _$onDeleteSessionSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() onLoading,
    required TResult Function(CommonModel<List<SessionResponseModel>> model)
        onGetSessionSuccess,
    required TResult Function(String message) onRatingSuccess,
    required TResult Function(CommonModel<List<SessionResponseModel>> model)
        onGetPreviousSessionSuccess,
    required TResult Function(SessionResponseModel model)
        onGetSessionDetailsSuccess,
    required TResult Function(CommonModel<List<SessionResponseModel>> model)
        onGetUpcomingSessionSuccess,
    required TResult Function(CommonModel<List<SessionResponseModel>> model)
        onGetUpcomingBookingsSuccess,
    required TResult Function(String? message) onFailure,
    required TResult Function() onTimeValidateSuccess,
    required TResult Function(String? message) onTimeValidateFailure,
    required TResult Function(List<SessionResponseModel> model)
        onUpdateSessionSuccess,
    required TResult Function(String model) onAddSessionSuccess,
    required TResult Function(SessionModel model) onDeleteSessionSuccess,
  }) {
    return onDeleteSessionSuccess(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? onLoading,
    TResult? Function(CommonModel<List<SessionResponseModel>> model)?
        onGetSessionSuccess,
    TResult? Function(String message)? onRatingSuccess,
    TResult? Function(CommonModel<List<SessionResponseModel>> model)?
        onGetPreviousSessionSuccess,
    TResult? Function(SessionResponseModel model)? onGetSessionDetailsSuccess,
    TResult? Function(CommonModel<List<SessionResponseModel>> model)?
        onGetUpcomingSessionSuccess,
    TResult? Function(CommonModel<List<SessionResponseModel>> model)?
        onGetUpcomingBookingsSuccess,
    TResult? Function(String? message)? onFailure,
    TResult? Function()? onTimeValidateSuccess,
    TResult? Function(String? message)? onTimeValidateFailure,
    TResult? Function(List<SessionResponseModel> model)? onUpdateSessionSuccess,
    TResult? Function(String model)? onAddSessionSuccess,
    TResult? Function(SessionModel model)? onDeleteSessionSuccess,
  }) {
    return onDeleteSessionSuccess?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onLoading,
    TResult Function(CommonModel<List<SessionResponseModel>> model)?
        onGetSessionSuccess,
    TResult Function(String message)? onRatingSuccess,
    TResult Function(CommonModel<List<SessionResponseModel>> model)?
        onGetPreviousSessionSuccess,
    TResult Function(SessionResponseModel model)? onGetSessionDetailsSuccess,
    TResult Function(CommonModel<List<SessionResponseModel>> model)?
        onGetUpcomingSessionSuccess,
    TResult Function(CommonModel<List<SessionResponseModel>> model)?
        onGetUpcomingBookingsSuccess,
    TResult Function(String? message)? onFailure,
    TResult Function()? onTimeValidateSuccess,
    TResult Function(String? message)? onTimeValidateFailure,
    TResult Function(List<SessionResponseModel> model)? onUpdateSessionSuccess,
    TResult Function(String model)? onAddSessionSuccess,
    TResult Function(SessionModel model)? onDeleteSessionSuccess,
    required TResult orElse(),
  }) {
    if (onDeleteSessionSuccess != null) {
      return onDeleteSessionSuccess(model);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_onLoading value) onLoading,
    required TResult Function(_onGetSessionSuccess value) onGetSessionSuccess,
    required TResult Function(_onRatingSuccess value) onRatingSuccess,
    required TResult Function(_onGetPreviousSessionSuccess value)
        onGetPreviousSessionSuccess,
    required TResult Function(_onGetSessionDetailsSuccess value)
        onGetSessionDetailsSuccess,
    required TResult Function(_onGetUpcomingSessionSuccess value)
        onGetUpcomingSessionSuccess,
    required TResult Function(_onGetUpcomingBookingsSuccess value)
        onGetUpcomingBookingsSuccess,
    required TResult Function(_onFailure value) onFailure,
    required TResult Function(_onTimeValidateSuccess value)
        onTimeValidateSuccess,
    required TResult Function(_onTimeValidateFailure value)
        onTimeValidateFailure,
    required TResult Function(_onUpdateSessionSuccess value)
        onUpdateSessionSuccess,
    required TResult Function(_onAddSessionSuccess value) onAddSessionSuccess,
    required TResult Function(_onDeleteSessionSuccess value)
        onDeleteSessionSuccess,
  }) {
    return onDeleteSessionSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_onLoading value)? onLoading,
    TResult? Function(_onGetSessionSuccess value)? onGetSessionSuccess,
    TResult? Function(_onRatingSuccess value)? onRatingSuccess,
    TResult? Function(_onGetPreviousSessionSuccess value)?
        onGetPreviousSessionSuccess,
    TResult? Function(_onGetSessionDetailsSuccess value)?
        onGetSessionDetailsSuccess,
    TResult? Function(_onGetUpcomingSessionSuccess value)?
        onGetUpcomingSessionSuccess,
    TResult? Function(_onGetUpcomingBookingsSuccess value)?
        onGetUpcomingBookingsSuccess,
    TResult? Function(_onFailure value)? onFailure,
    TResult? Function(_onTimeValidateSuccess value)? onTimeValidateSuccess,
    TResult? Function(_onTimeValidateFailure value)? onTimeValidateFailure,
    TResult? Function(_onUpdateSessionSuccess value)? onUpdateSessionSuccess,
    TResult? Function(_onAddSessionSuccess value)? onAddSessionSuccess,
    TResult? Function(_onDeleteSessionSuccess value)? onDeleteSessionSuccess,
  }) {
    return onDeleteSessionSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_onLoading value)? onLoading,
    TResult Function(_onGetSessionSuccess value)? onGetSessionSuccess,
    TResult Function(_onRatingSuccess value)? onRatingSuccess,
    TResult Function(_onGetPreviousSessionSuccess value)?
        onGetPreviousSessionSuccess,
    TResult Function(_onGetSessionDetailsSuccess value)?
        onGetSessionDetailsSuccess,
    TResult Function(_onGetUpcomingSessionSuccess value)?
        onGetUpcomingSessionSuccess,
    TResult Function(_onGetUpcomingBookingsSuccess value)?
        onGetUpcomingBookingsSuccess,
    TResult Function(_onFailure value)? onFailure,
    TResult Function(_onTimeValidateSuccess value)? onTimeValidateSuccess,
    TResult Function(_onTimeValidateFailure value)? onTimeValidateFailure,
    TResult Function(_onUpdateSessionSuccess value)? onUpdateSessionSuccess,
    TResult Function(_onAddSessionSuccess value)? onAddSessionSuccess,
    TResult Function(_onDeleteSessionSuccess value)? onDeleteSessionSuccess,
    required TResult orElse(),
  }) {
    if (onDeleteSessionSuccess != null) {
      return onDeleteSessionSuccess(this);
    }
    return orElse();
  }
}

abstract class _onDeleteSessionSuccess implements SessionState {
  const factory _onDeleteSessionSuccess(final SessionModel model) =
      _$onDeleteSessionSuccessImpl;

  SessionModel get model;
  @JsonKey(ignore: true)
  _$$onDeleteSessionSuccessImplCopyWith<_$onDeleteSessionSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}
