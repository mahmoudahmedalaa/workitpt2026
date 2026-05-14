// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trainer_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TrainerEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TrainerFilterModel? filter) getTrainerList,
    required TResult Function(String id) getTrainerDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TrainerFilterModel? filter)? getTrainerList,
    TResult? Function(String id)? getTrainerDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TrainerFilterModel? filter)? getTrainerList,
    TResult Function(String id)? getTrainerDetail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_onGetTrainerList value) getTrainerList,
    required TResult Function(_onGetTrainerDetail value) getTrainerDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_onGetTrainerList value)? getTrainerList,
    TResult? Function(_onGetTrainerDetail value)? getTrainerDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_onGetTrainerList value)? getTrainerList,
    TResult Function(_onGetTrainerDetail value)? getTrainerDetail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrainerEventCopyWith<$Res> {
  factory $TrainerEventCopyWith(
          TrainerEvent value, $Res Function(TrainerEvent) then) =
      _$TrainerEventCopyWithImpl<$Res, TrainerEvent>;
}

/// @nodoc
class _$TrainerEventCopyWithImpl<$Res, $Val extends TrainerEvent>
    implements $TrainerEventCopyWith<$Res> {
  _$TrainerEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$onGetTrainerListImplCopyWith<$Res> {
  factory _$$onGetTrainerListImplCopyWith(_$onGetTrainerListImpl value,
          $Res Function(_$onGetTrainerListImpl) then) =
      __$$onGetTrainerListImplCopyWithImpl<$Res>;
  @useResult
  $Res call({TrainerFilterModel? filter});
}

/// @nodoc
class __$$onGetTrainerListImplCopyWithImpl<$Res>
    extends _$TrainerEventCopyWithImpl<$Res, _$onGetTrainerListImpl>
    implements _$$onGetTrainerListImplCopyWith<$Res> {
  __$$onGetTrainerListImplCopyWithImpl(_$onGetTrainerListImpl _value,
      $Res Function(_$onGetTrainerListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filter = freezed,
  }) {
    return _then(_$onGetTrainerListImpl(
      filter: freezed == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as TrainerFilterModel?,
    ));
  }
}

/// @nodoc

class _$onGetTrainerListImpl implements _onGetTrainerList {
  const _$onGetTrainerListImpl({this.filter});

  @override
  final TrainerFilterModel? filter;

  @override
  String toString() {
    return 'TrainerEvent.getTrainerList(filter: $filter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$onGetTrainerListImpl &&
            (identical(other.filter, filter) || other.filter == filter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$onGetTrainerListImplCopyWith<_$onGetTrainerListImpl> get copyWith =>
      __$$onGetTrainerListImplCopyWithImpl<_$onGetTrainerListImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TrainerFilterModel? filter) getTrainerList,
    required TResult Function(String id) getTrainerDetail,
  }) {
    return getTrainerList(filter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TrainerFilterModel? filter)? getTrainerList,
    TResult? Function(String id)? getTrainerDetail,
  }) {
    return getTrainerList?.call(filter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TrainerFilterModel? filter)? getTrainerList,
    TResult Function(String id)? getTrainerDetail,
    required TResult orElse(),
  }) {
    if (getTrainerList != null) {
      return getTrainerList(filter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_onGetTrainerList value) getTrainerList,
    required TResult Function(_onGetTrainerDetail value) getTrainerDetail,
  }) {
    return getTrainerList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_onGetTrainerList value)? getTrainerList,
    TResult? Function(_onGetTrainerDetail value)? getTrainerDetail,
  }) {
    return getTrainerList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_onGetTrainerList value)? getTrainerList,
    TResult Function(_onGetTrainerDetail value)? getTrainerDetail,
    required TResult orElse(),
  }) {
    if (getTrainerList != null) {
      return getTrainerList(this);
    }
    return orElse();
  }
}

abstract class _onGetTrainerList implements TrainerEvent {
  const factory _onGetTrainerList({final TrainerFilterModel? filter}) =
      _$onGetTrainerListImpl;

  TrainerFilterModel? get filter;
  @JsonKey(ignore: true)
  _$$onGetTrainerListImplCopyWith<_$onGetTrainerListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$onGetTrainerDetailImplCopyWith<$Res> {
  factory _$$onGetTrainerDetailImplCopyWith(_$onGetTrainerDetailImpl value,
          $Res Function(_$onGetTrainerDetailImpl) then) =
      __$$onGetTrainerDetailImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$onGetTrainerDetailImplCopyWithImpl<$Res>
    extends _$TrainerEventCopyWithImpl<$Res, _$onGetTrainerDetailImpl>
    implements _$$onGetTrainerDetailImplCopyWith<$Res> {
  __$$onGetTrainerDetailImplCopyWithImpl(_$onGetTrainerDetailImpl _value,
      $Res Function(_$onGetTrainerDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$onGetTrainerDetailImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$onGetTrainerDetailImpl implements _onGetTrainerDetail {
  const _$onGetTrainerDetailImpl(this.id);

  @override
  final String id;

  @override
  String toString() {
    return 'TrainerEvent.getTrainerDetail(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$onGetTrainerDetailImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$onGetTrainerDetailImplCopyWith<_$onGetTrainerDetailImpl> get copyWith =>
      __$$onGetTrainerDetailImplCopyWithImpl<_$onGetTrainerDetailImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TrainerFilterModel? filter) getTrainerList,
    required TResult Function(String id) getTrainerDetail,
  }) {
    return getTrainerDetail(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TrainerFilterModel? filter)? getTrainerList,
    TResult? Function(String id)? getTrainerDetail,
  }) {
    return getTrainerDetail?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TrainerFilterModel? filter)? getTrainerList,
    TResult Function(String id)? getTrainerDetail,
    required TResult orElse(),
  }) {
    if (getTrainerDetail != null) {
      return getTrainerDetail(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_onGetTrainerList value) getTrainerList,
    required TResult Function(_onGetTrainerDetail value) getTrainerDetail,
  }) {
    return getTrainerDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_onGetTrainerList value)? getTrainerList,
    TResult? Function(_onGetTrainerDetail value)? getTrainerDetail,
  }) {
    return getTrainerDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_onGetTrainerList value)? getTrainerList,
    TResult Function(_onGetTrainerDetail value)? getTrainerDetail,
    required TResult orElse(),
  }) {
    if (getTrainerDetail != null) {
      return getTrainerDetail(this);
    }
    return orElse();
  }
}

abstract class _onGetTrainerDetail implements TrainerEvent {
  const factory _onGetTrainerDetail(final String id) = _$onGetTrainerDetailImpl;

  String get id;
  @JsonKey(ignore: true)
  _$$onGetTrainerDetailImplCopyWith<_$onGetTrainerDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TrainerState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() onLoading,
    required TResult Function(String? message) onFailure,
    required TResult Function(TrainerListModel model) onGetTrainerListSuccess,
    required TResult Function(TrainerDetailModel model)
        onGetTrainerDetailSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? onLoading,
    TResult? Function(String? message)? onFailure,
    TResult? Function(TrainerListModel model)? onGetTrainerListSuccess,
    TResult? Function(TrainerDetailModel model)? onGetTrainerDetailSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onLoading,
    TResult Function(String? message)? onFailure,
    TResult Function(TrainerListModel model)? onGetTrainerListSuccess,
    TResult Function(TrainerDetailModel model)? onGetTrainerDetailSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_onLoading value) onLoading,
    required TResult Function(_onFailure value) onFailure,
    required TResult Function(_onGetTrainerListSuccess value)
        onGetTrainerListSuccess,
    required TResult Function(_onGetTrainerDetailSuccess value)
        onGetTrainerDetailSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_onLoading value)? onLoading,
    TResult? Function(_onFailure value)? onFailure,
    TResult? Function(_onGetTrainerListSuccess value)? onGetTrainerListSuccess,
    TResult? Function(_onGetTrainerDetailSuccess value)?
        onGetTrainerDetailSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_onLoading value)? onLoading,
    TResult Function(_onFailure value)? onFailure,
    TResult Function(_onGetTrainerListSuccess value)? onGetTrainerListSuccess,
    TResult Function(_onGetTrainerDetailSuccess value)?
        onGetTrainerDetailSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrainerStateCopyWith<$Res> {
  factory $TrainerStateCopyWith(
          TrainerState value, $Res Function(TrainerState) then) =
      _$TrainerStateCopyWithImpl<$Res, TrainerState>;
}

/// @nodoc
class _$TrainerStateCopyWithImpl<$Res, $Val extends TrainerState>
    implements $TrainerStateCopyWith<$Res> {
  _$TrainerStateCopyWithImpl(this._value, this._then);

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
    extends _$TrainerStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'TrainerState.initial()';
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
    required TResult Function(String? message) onFailure,
    required TResult Function(TrainerListModel model) onGetTrainerListSuccess,
    required TResult Function(TrainerDetailModel model)
        onGetTrainerDetailSuccess,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? onLoading,
    TResult? Function(String? message)? onFailure,
    TResult? Function(TrainerListModel model)? onGetTrainerListSuccess,
    TResult? Function(TrainerDetailModel model)? onGetTrainerDetailSuccess,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onLoading,
    TResult Function(String? message)? onFailure,
    TResult Function(TrainerListModel model)? onGetTrainerListSuccess,
    TResult Function(TrainerDetailModel model)? onGetTrainerDetailSuccess,
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
    required TResult Function(_onFailure value) onFailure,
    required TResult Function(_onGetTrainerListSuccess value)
        onGetTrainerListSuccess,
    required TResult Function(_onGetTrainerDetailSuccess value)
        onGetTrainerDetailSuccess,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_onLoading value)? onLoading,
    TResult? Function(_onFailure value)? onFailure,
    TResult? Function(_onGetTrainerListSuccess value)? onGetTrainerListSuccess,
    TResult? Function(_onGetTrainerDetailSuccess value)?
        onGetTrainerDetailSuccess,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_onLoading value)? onLoading,
    TResult Function(_onFailure value)? onFailure,
    TResult Function(_onGetTrainerListSuccess value)? onGetTrainerListSuccess,
    TResult Function(_onGetTrainerDetailSuccess value)?
        onGetTrainerDetailSuccess,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements TrainerState {
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
    extends _$TrainerStateCopyWithImpl<$Res, _$onLoadingImpl>
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
    return 'TrainerState.onLoading()';
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
    required TResult Function(String? message) onFailure,
    required TResult Function(TrainerListModel model) onGetTrainerListSuccess,
    required TResult Function(TrainerDetailModel model)
        onGetTrainerDetailSuccess,
  }) {
    return onLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? onLoading,
    TResult? Function(String? message)? onFailure,
    TResult? Function(TrainerListModel model)? onGetTrainerListSuccess,
    TResult? Function(TrainerDetailModel model)? onGetTrainerDetailSuccess,
  }) {
    return onLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onLoading,
    TResult Function(String? message)? onFailure,
    TResult Function(TrainerListModel model)? onGetTrainerListSuccess,
    TResult Function(TrainerDetailModel model)? onGetTrainerDetailSuccess,
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
    required TResult Function(_onFailure value) onFailure,
    required TResult Function(_onGetTrainerListSuccess value)
        onGetTrainerListSuccess,
    required TResult Function(_onGetTrainerDetailSuccess value)
        onGetTrainerDetailSuccess,
  }) {
    return onLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_onLoading value)? onLoading,
    TResult? Function(_onFailure value)? onFailure,
    TResult? Function(_onGetTrainerListSuccess value)? onGetTrainerListSuccess,
    TResult? Function(_onGetTrainerDetailSuccess value)?
        onGetTrainerDetailSuccess,
  }) {
    return onLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_onLoading value)? onLoading,
    TResult Function(_onFailure value)? onFailure,
    TResult Function(_onGetTrainerListSuccess value)? onGetTrainerListSuccess,
    TResult Function(_onGetTrainerDetailSuccess value)?
        onGetTrainerDetailSuccess,
    required TResult orElse(),
  }) {
    if (onLoading != null) {
      return onLoading(this);
    }
    return orElse();
  }
}

abstract class _onLoading implements TrainerState {
  const factory _onLoading() = _$onLoadingImpl;
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
    extends _$TrainerStateCopyWithImpl<$Res, _$onFailureImpl>
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
    return 'TrainerState.onFailure(message: $message)';
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
    required TResult Function(String? message) onFailure,
    required TResult Function(TrainerListModel model) onGetTrainerListSuccess,
    required TResult Function(TrainerDetailModel model)
        onGetTrainerDetailSuccess,
  }) {
    return onFailure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? onLoading,
    TResult? Function(String? message)? onFailure,
    TResult? Function(TrainerListModel model)? onGetTrainerListSuccess,
    TResult? Function(TrainerDetailModel model)? onGetTrainerDetailSuccess,
  }) {
    return onFailure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onLoading,
    TResult Function(String? message)? onFailure,
    TResult Function(TrainerListModel model)? onGetTrainerListSuccess,
    TResult Function(TrainerDetailModel model)? onGetTrainerDetailSuccess,
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
    required TResult Function(_onFailure value) onFailure,
    required TResult Function(_onGetTrainerListSuccess value)
        onGetTrainerListSuccess,
    required TResult Function(_onGetTrainerDetailSuccess value)
        onGetTrainerDetailSuccess,
  }) {
    return onFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_onLoading value)? onLoading,
    TResult? Function(_onFailure value)? onFailure,
    TResult? Function(_onGetTrainerListSuccess value)? onGetTrainerListSuccess,
    TResult? Function(_onGetTrainerDetailSuccess value)?
        onGetTrainerDetailSuccess,
  }) {
    return onFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_onLoading value)? onLoading,
    TResult Function(_onFailure value)? onFailure,
    TResult Function(_onGetTrainerListSuccess value)? onGetTrainerListSuccess,
    TResult Function(_onGetTrainerDetailSuccess value)?
        onGetTrainerDetailSuccess,
    required TResult orElse(),
  }) {
    if (onFailure != null) {
      return onFailure(this);
    }
    return orElse();
  }
}

abstract class _onFailure implements TrainerState {
  const factory _onFailure(final String? message) = _$onFailureImpl;

  String? get message;
  @JsonKey(ignore: true)
  _$$onFailureImplCopyWith<_$onFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$onGetTrainerListSuccessImplCopyWith<$Res> {
  factory _$$onGetTrainerListSuccessImplCopyWith(
          _$onGetTrainerListSuccessImpl value,
          $Res Function(_$onGetTrainerListSuccessImpl) then) =
      __$$onGetTrainerListSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({TrainerListModel model});
}

/// @nodoc
class __$$onGetTrainerListSuccessImplCopyWithImpl<$Res>
    extends _$TrainerStateCopyWithImpl<$Res, _$onGetTrainerListSuccessImpl>
    implements _$$onGetTrainerListSuccessImplCopyWith<$Res> {
  __$$onGetTrainerListSuccessImplCopyWithImpl(
      _$onGetTrainerListSuccessImpl _value,
      $Res Function(_$onGetTrainerListSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
  }) {
    return _then(_$onGetTrainerListSuccessImpl(
      null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as TrainerListModel,
    ));
  }
}

/// @nodoc

class _$onGetTrainerListSuccessImpl implements _onGetTrainerListSuccess {
  const _$onGetTrainerListSuccessImpl(this.model);

  @override
  final TrainerListModel model;

  @override
  String toString() {
    return 'TrainerState.onGetTrainerListSuccess(model: $model)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$onGetTrainerListSuccessImpl &&
            (identical(other.model, model) || other.model == model));
  }

  @override
  int get hashCode => Object.hash(runtimeType, model);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$onGetTrainerListSuccessImplCopyWith<_$onGetTrainerListSuccessImpl>
      get copyWith => __$$onGetTrainerListSuccessImplCopyWithImpl<
          _$onGetTrainerListSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() onLoading,
    required TResult Function(String? message) onFailure,
    required TResult Function(TrainerListModel model) onGetTrainerListSuccess,
    required TResult Function(TrainerDetailModel model)
        onGetTrainerDetailSuccess,
  }) {
    return onGetTrainerListSuccess(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? onLoading,
    TResult? Function(String? message)? onFailure,
    TResult? Function(TrainerListModel model)? onGetTrainerListSuccess,
    TResult? Function(TrainerDetailModel model)? onGetTrainerDetailSuccess,
  }) {
    return onGetTrainerListSuccess?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onLoading,
    TResult Function(String? message)? onFailure,
    TResult Function(TrainerListModel model)? onGetTrainerListSuccess,
    TResult Function(TrainerDetailModel model)? onGetTrainerDetailSuccess,
    required TResult orElse(),
  }) {
    if (onGetTrainerListSuccess != null) {
      return onGetTrainerListSuccess(model);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_onLoading value) onLoading,
    required TResult Function(_onFailure value) onFailure,
    required TResult Function(_onGetTrainerListSuccess value)
        onGetTrainerListSuccess,
    required TResult Function(_onGetTrainerDetailSuccess value)
        onGetTrainerDetailSuccess,
  }) {
    return onGetTrainerListSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_onLoading value)? onLoading,
    TResult? Function(_onFailure value)? onFailure,
    TResult? Function(_onGetTrainerListSuccess value)? onGetTrainerListSuccess,
    TResult? Function(_onGetTrainerDetailSuccess value)?
        onGetTrainerDetailSuccess,
  }) {
    return onGetTrainerListSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_onLoading value)? onLoading,
    TResult Function(_onFailure value)? onFailure,
    TResult Function(_onGetTrainerListSuccess value)? onGetTrainerListSuccess,
    TResult Function(_onGetTrainerDetailSuccess value)?
        onGetTrainerDetailSuccess,
    required TResult orElse(),
  }) {
    if (onGetTrainerListSuccess != null) {
      return onGetTrainerListSuccess(this);
    }
    return orElse();
  }
}

abstract class _onGetTrainerListSuccess implements TrainerState {
  const factory _onGetTrainerListSuccess(final TrainerListModel model) =
      _$onGetTrainerListSuccessImpl;

  TrainerListModel get model;
  @JsonKey(ignore: true)
  _$$onGetTrainerListSuccessImplCopyWith<_$onGetTrainerListSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$onGetTrainerDetailSuccessImplCopyWith<$Res> {
  factory _$$onGetTrainerDetailSuccessImplCopyWith(
          _$onGetTrainerDetailSuccessImpl value,
          $Res Function(_$onGetTrainerDetailSuccessImpl) then) =
      __$$onGetTrainerDetailSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({TrainerDetailModel model});
}

/// @nodoc
class __$$onGetTrainerDetailSuccessImplCopyWithImpl<$Res>
    extends _$TrainerStateCopyWithImpl<$Res, _$onGetTrainerDetailSuccessImpl>
    implements _$$onGetTrainerDetailSuccessImplCopyWith<$Res> {
  __$$onGetTrainerDetailSuccessImplCopyWithImpl(
      _$onGetTrainerDetailSuccessImpl _value,
      $Res Function(_$onGetTrainerDetailSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
  }) {
    return _then(_$onGetTrainerDetailSuccessImpl(
      null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as TrainerDetailModel,
    ));
  }
}

/// @nodoc

class _$onGetTrainerDetailSuccessImpl implements _onGetTrainerDetailSuccess {
  const _$onGetTrainerDetailSuccessImpl(this.model);

  @override
  final TrainerDetailModel model;

  @override
  String toString() {
    return 'TrainerState.onGetTrainerDetailSuccess(model: $model)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$onGetTrainerDetailSuccessImpl &&
            (identical(other.model, model) || other.model == model));
  }

  @override
  int get hashCode => Object.hash(runtimeType, model);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$onGetTrainerDetailSuccessImplCopyWith<_$onGetTrainerDetailSuccessImpl>
      get copyWith => __$$onGetTrainerDetailSuccessImplCopyWithImpl<
          _$onGetTrainerDetailSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() onLoading,
    required TResult Function(String? message) onFailure,
    required TResult Function(TrainerListModel model) onGetTrainerListSuccess,
    required TResult Function(TrainerDetailModel model)
        onGetTrainerDetailSuccess,
  }) {
    return onGetTrainerDetailSuccess(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? onLoading,
    TResult? Function(String? message)? onFailure,
    TResult? Function(TrainerListModel model)? onGetTrainerListSuccess,
    TResult? Function(TrainerDetailModel model)? onGetTrainerDetailSuccess,
  }) {
    return onGetTrainerDetailSuccess?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onLoading,
    TResult Function(String? message)? onFailure,
    TResult Function(TrainerListModel model)? onGetTrainerListSuccess,
    TResult Function(TrainerDetailModel model)? onGetTrainerDetailSuccess,
    required TResult orElse(),
  }) {
    if (onGetTrainerDetailSuccess != null) {
      return onGetTrainerDetailSuccess(model);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_onLoading value) onLoading,
    required TResult Function(_onFailure value) onFailure,
    required TResult Function(_onGetTrainerListSuccess value)
        onGetTrainerListSuccess,
    required TResult Function(_onGetTrainerDetailSuccess value)
        onGetTrainerDetailSuccess,
  }) {
    return onGetTrainerDetailSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_onLoading value)? onLoading,
    TResult? Function(_onFailure value)? onFailure,
    TResult? Function(_onGetTrainerListSuccess value)? onGetTrainerListSuccess,
    TResult? Function(_onGetTrainerDetailSuccess value)?
        onGetTrainerDetailSuccess,
  }) {
    return onGetTrainerDetailSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_onLoading value)? onLoading,
    TResult Function(_onFailure value)? onFailure,
    TResult Function(_onGetTrainerListSuccess value)? onGetTrainerListSuccess,
    TResult Function(_onGetTrainerDetailSuccess value)?
        onGetTrainerDetailSuccess,
    required TResult orElse(),
  }) {
    if (onGetTrainerDetailSuccess != null) {
      return onGetTrainerDetailSuccess(this);
    }
    return orElse();
  }
}

abstract class _onGetTrainerDetailSuccess implements TrainerState {
  const factory _onGetTrainerDetailSuccess(final TrainerDetailModel model) =
      _$onGetTrainerDetailSuccessImpl;

  TrainerDetailModel get model;
  @JsonKey(ignore: true)
  _$$onGetTrainerDetailSuccessImplCopyWith<_$onGetTrainerDetailSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}
