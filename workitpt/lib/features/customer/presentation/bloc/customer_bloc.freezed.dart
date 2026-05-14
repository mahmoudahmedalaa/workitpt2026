// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CustomerEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CustomerFilterModel? filter) getCustomerList,
    required TResult Function(String id) getCustomerDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CustomerFilterModel? filter)? getCustomerList,
    TResult? Function(String id)? getCustomerDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CustomerFilterModel? filter)? getCustomerList,
    TResult Function(String id)? getCustomerDetail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_onGetCustomerList value) getCustomerList,
    required TResult Function(_onGetCustomerDetail value) getCustomerDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_onGetCustomerList value)? getCustomerList,
    TResult? Function(_onGetCustomerDetail value)? getCustomerDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_onGetCustomerList value)? getCustomerList,
    TResult Function(_onGetCustomerDetail value)? getCustomerDetail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerEventCopyWith<$Res> {
  factory $CustomerEventCopyWith(
          CustomerEvent value, $Res Function(CustomerEvent) then) =
      _$CustomerEventCopyWithImpl<$Res, CustomerEvent>;
}

/// @nodoc
class _$CustomerEventCopyWithImpl<$Res, $Val extends CustomerEvent>
    implements $CustomerEventCopyWith<$Res> {
  _$CustomerEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$onGetCustomerListImplCopyWith<$Res> {
  factory _$$onGetCustomerListImplCopyWith(_$onGetCustomerListImpl value,
          $Res Function(_$onGetCustomerListImpl) then) =
      __$$onGetCustomerListImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CustomerFilterModel? filter});
}

/// @nodoc
class __$$onGetCustomerListImplCopyWithImpl<$Res>
    extends _$CustomerEventCopyWithImpl<$Res, _$onGetCustomerListImpl>
    implements _$$onGetCustomerListImplCopyWith<$Res> {
  __$$onGetCustomerListImplCopyWithImpl(_$onGetCustomerListImpl _value,
      $Res Function(_$onGetCustomerListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filter = freezed,
  }) {
    return _then(_$onGetCustomerListImpl(
      filter: freezed == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as CustomerFilterModel?,
    ));
  }
}

/// @nodoc

class _$onGetCustomerListImpl implements _onGetCustomerList {
  const _$onGetCustomerListImpl({this.filter});

  @override
  final CustomerFilterModel? filter;

  @override
  String toString() {
    return 'CustomerEvent.getCustomerList(filter: $filter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$onGetCustomerListImpl &&
            (identical(other.filter, filter) || other.filter == filter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$onGetCustomerListImplCopyWith<_$onGetCustomerListImpl> get copyWith =>
      __$$onGetCustomerListImplCopyWithImpl<_$onGetCustomerListImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CustomerFilterModel? filter) getCustomerList,
    required TResult Function(String id) getCustomerDetail,
  }) {
    return getCustomerList(filter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CustomerFilterModel? filter)? getCustomerList,
    TResult? Function(String id)? getCustomerDetail,
  }) {
    return getCustomerList?.call(filter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CustomerFilterModel? filter)? getCustomerList,
    TResult Function(String id)? getCustomerDetail,
    required TResult orElse(),
  }) {
    if (getCustomerList != null) {
      return getCustomerList(filter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_onGetCustomerList value) getCustomerList,
    required TResult Function(_onGetCustomerDetail value) getCustomerDetail,
  }) {
    return getCustomerList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_onGetCustomerList value)? getCustomerList,
    TResult? Function(_onGetCustomerDetail value)? getCustomerDetail,
  }) {
    return getCustomerList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_onGetCustomerList value)? getCustomerList,
    TResult Function(_onGetCustomerDetail value)? getCustomerDetail,
    required TResult orElse(),
  }) {
    if (getCustomerList != null) {
      return getCustomerList(this);
    }
    return orElse();
  }
}

abstract class _onGetCustomerList implements CustomerEvent {
  const factory _onGetCustomerList({final CustomerFilterModel? filter}) =
      _$onGetCustomerListImpl;

  CustomerFilterModel? get filter;
  @JsonKey(ignore: true)
  _$$onGetCustomerListImplCopyWith<_$onGetCustomerListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$onGetCustomerDetailImplCopyWith<$Res> {
  factory _$$onGetCustomerDetailImplCopyWith(_$onGetCustomerDetailImpl value,
          $Res Function(_$onGetCustomerDetailImpl) then) =
      __$$onGetCustomerDetailImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$onGetCustomerDetailImplCopyWithImpl<$Res>
    extends _$CustomerEventCopyWithImpl<$Res, _$onGetCustomerDetailImpl>
    implements _$$onGetCustomerDetailImplCopyWith<$Res> {
  __$$onGetCustomerDetailImplCopyWithImpl(_$onGetCustomerDetailImpl _value,
      $Res Function(_$onGetCustomerDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$onGetCustomerDetailImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$onGetCustomerDetailImpl implements _onGetCustomerDetail {
  const _$onGetCustomerDetailImpl(this.id);

  @override
  final String id;

  @override
  String toString() {
    return 'CustomerEvent.getCustomerDetail(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$onGetCustomerDetailImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$onGetCustomerDetailImplCopyWith<_$onGetCustomerDetailImpl> get copyWith =>
      __$$onGetCustomerDetailImplCopyWithImpl<_$onGetCustomerDetailImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CustomerFilterModel? filter) getCustomerList,
    required TResult Function(String id) getCustomerDetail,
  }) {
    return getCustomerDetail(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CustomerFilterModel? filter)? getCustomerList,
    TResult? Function(String id)? getCustomerDetail,
  }) {
    return getCustomerDetail?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CustomerFilterModel? filter)? getCustomerList,
    TResult Function(String id)? getCustomerDetail,
    required TResult orElse(),
  }) {
    if (getCustomerDetail != null) {
      return getCustomerDetail(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_onGetCustomerList value) getCustomerList,
    required TResult Function(_onGetCustomerDetail value) getCustomerDetail,
  }) {
    return getCustomerDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_onGetCustomerList value)? getCustomerList,
    TResult? Function(_onGetCustomerDetail value)? getCustomerDetail,
  }) {
    return getCustomerDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_onGetCustomerList value)? getCustomerList,
    TResult Function(_onGetCustomerDetail value)? getCustomerDetail,
    required TResult orElse(),
  }) {
    if (getCustomerDetail != null) {
      return getCustomerDetail(this);
    }
    return orElse();
  }
}

abstract class _onGetCustomerDetail implements CustomerEvent {
  const factory _onGetCustomerDetail(final String id) =
      _$onGetCustomerDetailImpl;

  String get id;
  @JsonKey(ignore: true)
  _$$onGetCustomerDetailImplCopyWith<_$onGetCustomerDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CustomerState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() onLoading,
    required TResult Function(String? message) onFailure,
    required TResult Function(List<CustomerModel> model)
        onGetCustomerListSuccess,
    required TResult Function(CustomerDetailModel model)
        onGetCustomerDetailSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? onLoading,
    TResult? Function(String? message)? onFailure,
    TResult? Function(List<CustomerModel> model)? onGetCustomerListSuccess,
    TResult? Function(CustomerDetailModel model)? onGetCustomerDetailSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onLoading,
    TResult Function(String? message)? onFailure,
    TResult Function(List<CustomerModel> model)? onGetCustomerListSuccess,
    TResult Function(CustomerDetailModel model)? onGetCustomerDetailSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_onLoading value) onLoading,
    required TResult Function(_onFailure value) onFailure,
    required TResult Function(_onGetCustomerListSuccess value)
        onGetCustomerListSuccess,
    required TResult Function(_onGetCustomerDetailSuccess value)
        onGetCustomerDetailSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_onLoading value)? onLoading,
    TResult? Function(_onFailure value)? onFailure,
    TResult? Function(_onGetCustomerListSuccess value)?
        onGetCustomerListSuccess,
    TResult? Function(_onGetCustomerDetailSuccess value)?
        onGetCustomerDetailSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_onLoading value)? onLoading,
    TResult Function(_onFailure value)? onFailure,
    TResult Function(_onGetCustomerListSuccess value)? onGetCustomerListSuccess,
    TResult Function(_onGetCustomerDetailSuccess value)?
        onGetCustomerDetailSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerStateCopyWith<$Res> {
  factory $CustomerStateCopyWith(
          CustomerState value, $Res Function(CustomerState) then) =
      _$CustomerStateCopyWithImpl<$Res, CustomerState>;
}

/// @nodoc
class _$CustomerStateCopyWithImpl<$Res, $Val extends CustomerState>
    implements $CustomerStateCopyWith<$Res> {
  _$CustomerStateCopyWithImpl(this._value, this._then);

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
    extends _$CustomerStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'CustomerState.initial()';
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
    required TResult Function(List<CustomerModel> model)
        onGetCustomerListSuccess,
    required TResult Function(CustomerDetailModel model)
        onGetCustomerDetailSuccess,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? onLoading,
    TResult? Function(String? message)? onFailure,
    TResult? Function(List<CustomerModel> model)? onGetCustomerListSuccess,
    TResult? Function(CustomerDetailModel model)? onGetCustomerDetailSuccess,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onLoading,
    TResult Function(String? message)? onFailure,
    TResult Function(List<CustomerModel> model)? onGetCustomerListSuccess,
    TResult Function(CustomerDetailModel model)? onGetCustomerDetailSuccess,
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
    required TResult Function(_onGetCustomerListSuccess value)
        onGetCustomerListSuccess,
    required TResult Function(_onGetCustomerDetailSuccess value)
        onGetCustomerDetailSuccess,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_onLoading value)? onLoading,
    TResult? Function(_onFailure value)? onFailure,
    TResult? Function(_onGetCustomerListSuccess value)?
        onGetCustomerListSuccess,
    TResult? Function(_onGetCustomerDetailSuccess value)?
        onGetCustomerDetailSuccess,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_onLoading value)? onLoading,
    TResult Function(_onFailure value)? onFailure,
    TResult Function(_onGetCustomerListSuccess value)? onGetCustomerListSuccess,
    TResult Function(_onGetCustomerDetailSuccess value)?
        onGetCustomerDetailSuccess,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements CustomerState {
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
    extends _$CustomerStateCopyWithImpl<$Res, _$onLoadingImpl>
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
    return 'CustomerState.onLoading()';
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
    required TResult Function(List<CustomerModel> model)
        onGetCustomerListSuccess,
    required TResult Function(CustomerDetailModel model)
        onGetCustomerDetailSuccess,
  }) {
    return onLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? onLoading,
    TResult? Function(String? message)? onFailure,
    TResult? Function(List<CustomerModel> model)? onGetCustomerListSuccess,
    TResult? Function(CustomerDetailModel model)? onGetCustomerDetailSuccess,
  }) {
    return onLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onLoading,
    TResult Function(String? message)? onFailure,
    TResult Function(List<CustomerModel> model)? onGetCustomerListSuccess,
    TResult Function(CustomerDetailModel model)? onGetCustomerDetailSuccess,
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
    required TResult Function(_onGetCustomerListSuccess value)
        onGetCustomerListSuccess,
    required TResult Function(_onGetCustomerDetailSuccess value)
        onGetCustomerDetailSuccess,
  }) {
    return onLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_onLoading value)? onLoading,
    TResult? Function(_onFailure value)? onFailure,
    TResult? Function(_onGetCustomerListSuccess value)?
        onGetCustomerListSuccess,
    TResult? Function(_onGetCustomerDetailSuccess value)?
        onGetCustomerDetailSuccess,
  }) {
    return onLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_onLoading value)? onLoading,
    TResult Function(_onFailure value)? onFailure,
    TResult Function(_onGetCustomerListSuccess value)? onGetCustomerListSuccess,
    TResult Function(_onGetCustomerDetailSuccess value)?
        onGetCustomerDetailSuccess,
    required TResult orElse(),
  }) {
    if (onLoading != null) {
      return onLoading(this);
    }
    return orElse();
  }
}

abstract class _onLoading implements CustomerState {
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
    extends _$CustomerStateCopyWithImpl<$Res, _$onFailureImpl>
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
    return 'CustomerState.onFailure(message: $message)';
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
    required TResult Function(List<CustomerModel> model)
        onGetCustomerListSuccess,
    required TResult Function(CustomerDetailModel model)
        onGetCustomerDetailSuccess,
  }) {
    return onFailure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? onLoading,
    TResult? Function(String? message)? onFailure,
    TResult? Function(List<CustomerModel> model)? onGetCustomerListSuccess,
    TResult? Function(CustomerDetailModel model)? onGetCustomerDetailSuccess,
  }) {
    return onFailure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onLoading,
    TResult Function(String? message)? onFailure,
    TResult Function(List<CustomerModel> model)? onGetCustomerListSuccess,
    TResult Function(CustomerDetailModel model)? onGetCustomerDetailSuccess,
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
    required TResult Function(_onGetCustomerListSuccess value)
        onGetCustomerListSuccess,
    required TResult Function(_onGetCustomerDetailSuccess value)
        onGetCustomerDetailSuccess,
  }) {
    return onFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_onLoading value)? onLoading,
    TResult? Function(_onFailure value)? onFailure,
    TResult? Function(_onGetCustomerListSuccess value)?
        onGetCustomerListSuccess,
    TResult? Function(_onGetCustomerDetailSuccess value)?
        onGetCustomerDetailSuccess,
  }) {
    return onFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_onLoading value)? onLoading,
    TResult Function(_onFailure value)? onFailure,
    TResult Function(_onGetCustomerListSuccess value)? onGetCustomerListSuccess,
    TResult Function(_onGetCustomerDetailSuccess value)?
        onGetCustomerDetailSuccess,
    required TResult orElse(),
  }) {
    if (onFailure != null) {
      return onFailure(this);
    }
    return orElse();
  }
}

abstract class _onFailure implements CustomerState {
  const factory _onFailure(final String? message) = _$onFailureImpl;

  String? get message;
  @JsonKey(ignore: true)
  _$$onFailureImplCopyWith<_$onFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$onGetCustomerListSuccessImplCopyWith<$Res> {
  factory _$$onGetCustomerListSuccessImplCopyWith(
          _$onGetCustomerListSuccessImpl value,
          $Res Function(_$onGetCustomerListSuccessImpl) then) =
      __$$onGetCustomerListSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<CustomerModel> model});
}

/// @nodoc
class __$$onGetCustomerListSuccessImplCopyWithImpl<$Res>
    extends _$CustomerStateCopyWithImpl<$Res, _$onGetCustomerListSuccessImpl>
    implements _$$onGetCustomerListSuccessImplCopyWith<$Res> {
  __$$onGetCustomerListSuccessImplCopyWithImpl(
      _$onGetCustomerListSuccessImpl _value,
      $Res Function(_$onGetCustomerListSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
  }) {
    return _then(_$onGetCustomerListSuccessImpl(
      null == model
          ? _value._model
          : model // ignore: cast_nullable_to_non_nullable
              as List<CustomerModel>,
    ));
  }
}

/// @nodoc

class _$onGetCustomerListSuccessImpl implements _onGetCustomerListSuccess {
  const _$onGetCustomerListSuccessImpl(final List<CustomerModel> model)
      : _model = model;

  final List<CustomerModel> _model;
  @override
  List<CustomerModel> get model {
    if (_model is EqualUnmodifiableListView) return _model;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_model);
  }

  @override
  String toString() {
    return 'CustomerState.onGetCustomerListSuccess(model: $model)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$onGetCustomerListSuccessImpl &&
            const DeepCollectionEquality().equals(other._model, _model));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_model));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$onGetCustomerListSuccessImplCopyWith<_$onGetCustomerListSuccessImpl>
      get copyWith => __$$onGetCustomerListSuccessImplCopyWithImpl<
          _$onGetCustomerListSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() onLoading,
    required TResult Function(String? message) onFailure,
    required TResult Function(List<CustomerModel> model)
        onGetCustomerListSuccess,
    required TResult Function(CustomerDetailModel model)
        onGetCustomerDetailSuccess,
  }) {
    return onGetCustomerListSuccess(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? onLoading,
    TResult? Function(String? message)? onFailure,
    TResult? Function(List<CustomerModel> model)? onGetCustomerListSuccess,
    TResult? Function(CustomerDetailModel model)? onGetCustomerDetailSuccess,
  }) {
    return onGetCustomerListSuccess?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onLoading,
    TResult Function(String? message)? onFailure,
    TResult Function(List<CustomerModel> model)? onGetCustomerListSuccess,
    TResult Function(CustomerDetailModel model)? onGetCustomerDetailSuccess,
    required TResult orElse(),
  }) {
    if (onGetCustomerListSuccess != null) {
      return onGetCustomerListSuccess(model);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_onLoading value) onLoading,
    required TResult Function(_onFailure value) onFailure,
    required TResult Function(_onGetCustomerListSuccess value)
        onGetCustomerListSuccess,
    required TResult Function(_onGetCustomerDetailSuccess value)
        onGetCustomerDetailSuccess,
  }) {
    return onGetCustomerListSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_onLoading value)? onLoading,
    TResult? Function(_onFailure value)? onFailure,
    TResult? Function(_onGetCustomerListSuccess value)?
        onGetCustomerListSuccess,
    TResult? Function(_onGetCustomerDetailSuccess value)?
        onGetCustomerDetailSuccess,
  }) {
    return onGetCustomerListSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_onLoading value)? onLoading,
    TResult Function(_onFailure value)? onFailure,
    TResult Function(_onGetCustomerListSuccess value)? onGetCustomerListSuccess,
    TResult Function(_onGetCustomerDetailSuccess value)?
        onGetCustomerDetailSuccess,
    required TResult orElse(),
  }) {
    if (onGetCustomerListSuccess != null) {
      return onGetCustomerListSuccess(this);
    }
    return orElse();
  }
}

abstract class _onGetCustomerListSuccess implements CustomerState {
  const factory _onGetCustomerListSuccess(final List<CustomerModel> model) =
      _$onGetCustomerListSuccessImpl;

  List<CustomerModel> get model;
  @JsonKey(ignore: true)
  _$$onGetCustomerListSuccessImplCopyWith<_$onGetCustomerListSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$onGetCustomerDetailSuccessImplCopyWith<$Res> {
  factory _$$onGetCustomerDetailSuccessImplCopyWith(
          _$onGetCustomerDetailSuccessImpl value,
          $Res Function(_$onGetCustomerDetailSuccessImpl) then) =
      __$$onGetCustomerDetailSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CustomerDetailModel model});
}

/// @nodoc
class __$$onGetCustomerDetailSuccessImplCopyWithImpl<$Res>
    extends _$CustomerStateCopyWithImpl<$Res, _$onGetCustomerDetailSuccessImpl>
    implements _$$onGetCustomerDetailSuccessImplCopyWith<$Res> {
  __$$onGetCustomerDetailSuccessImplCopyWithImpl(
      _$onGetCustomerDetailSuccessImpl _value,
      $Res Function(_$onGetCustomerDetailSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
  }) {
    return _then(_$onGetCustomerDetailSuccessImpl(
      null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as CustomerDetailModel,
    ));
  }
}

/// @nodoc

class _$onGetCustomerDetailSuccessImpl implements _onGetCustomerDetailSuccess {
  const _$onGetCustomerDetailSuccessImpl(this.model);

  @override
  final CustomerDetailModel model;

  @override
  String toString() {
    return 'CustomerState.onGetCustomerDetailSuccess(model: $model)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$onGetCustomerDetailSuccessImpl &&
            (identical(other.model, model) || other.model == model));
  }

  @override
  int get hashCode => Object.hash(runtimeType, model);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$onGetCustomerDetailSuccessImplCopyWith<_$onGetCustomerDetailSuccessImpl>
      get copyWith => __$$onGetCustomerDetailSuccessImplCopyWithImpl<
          _$onGetCustomerDetailSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() onLoading,
    required TResult Function(String? message) onFailure,
    required TResult Function(List<CustomerModel> model)
        onGetCustomerListSuccess,
    required TResult Function(CustomerDetailModel model)
        onGetCustomerDetailSuccess,
  }) {
    return onGetCustomerDetailSuccess(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? onLoading,
    TResult? Function(String? message)? onFailure,
    TResult? Function(List<CustomerModel> model)? onGetCustomerListSuccess,
    TResult? Function(CustomerDetailModel model)? onGetCustomerDetailSuccess,
  }) {
    return onGetCustomerDetailSuccess?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onLoading,
    TResult Function(String? message)? onFailure,
    TResult Function(List<CustomerModel> model)? onGetCustomerListSuccess,
    TResult Function(CustomerDetailModel model)? onGetCustomerDetailSuccess,
    required TResult orElse(),
  }) {
    if (onGetCustomerDetailSuccess != null) {
      return onGetCustomerDetailSuccess(model);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_onLoading value) onLoading,
    required TResult Function(_onFailure value) onFailure,
    required TResult Function(_onGetCustomerListSuccess value)
        onGetCustomerListSuccess,
    required TResult Function(_onGetCustomerDetailSuccess value)
        onGetCustomerDetailSuccess,
  }) {
    return onGetCustomerDetailSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_onLoading value)? onLoading,
    TResult? Function(_onFailure value)? onFailure,
    TResult? Function(_onGetCustomerListSuccess value)?
        onGetCustomerListSuccess,
    TResult? Function(_onGetCustomerDetailSuccess value)?
        onGetCustomerDetailSuccess,
  }) {
    return onGetCustomerDetailSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_onLoading value)? onLoading,
    TResult Function(_onFailure value)? onFailure,
    TResult Function(_onGetCustomerListSuccess value)? onGetCustomerListSuccess,
    TResult Function(_onGetCustomerDetailSuccess value)?
        onGetCustomerDetailSuccess,
    required TResult orElse(),
  }) {
    if (onGetCustomerDetailSuccess != null) {
      return onGetCustomerDetailSuccess(this);
    }
    return orElse();
  }
}

abstract class _onGetCustomerDetailSuccess implements CustomerState {
  const factory _onGetCustomerDetailSuccess(final CustomerDetailModel model) =
      _$onGetCustomerDetailSuccessImpl;

  CustomerDetailModel get model;
  @JsonKey(ignore: true)
  _$$onGetCustomerDetailSuccessImplCopyWith<_$onGetCustomerDetailSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}
