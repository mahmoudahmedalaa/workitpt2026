// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_number_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$VerifyNumberEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getOTP,
    required TResult Function(String key, String code) verifyOTP,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getOTP,
    TResult? Function(String key, String code)? verifyOTP,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getOTP,
    TResult Function(String key, String code)? verifyOTP,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_onGetOTP value) getOTP,
    required TResult Function(_onVerifyOTP value) verifyOTP,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_onGetOTP value)? getOTP,
    TResult? Function(_onVerifyOTP value)? verifyOTP,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_onGetOTP value)? getOTP,
    TResult Function(_onVerifyOTP value)? verifyOTP,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyNumberEventCopyWith<$Res> {
  factory $VerifyNumberEventCopyWith(
          VerifyNumberEvent value, $Res Function(VerifyNumberEvent) then) =
      _$VerifyNumberEventCopyWithImpl<$Res, VerifyNumberEvent>;
}

/// @nodoc
class _$VerifyNumberEventCopyWithImpl<$Res, $Val extends VerifyNumberEvent>
    implements $VerifyNumberEventCopyWith<$Res> {
  _$VerifyNumberEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$onGetOTPImplCopyWith<$Res> {
  factory _$$onGetOTPImplCopyWith(
          _$onGetOTPImpl value, $Res Function(_$onGetOTPImpl) then) =
      __$$onGetOTPImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$onGetOTPImplCopyWithImpl<$Res>
    extends _$VerifyNumberEventCopyWithImpl<$Res, _$onGetOTPImpl>
    implements _$$onGetOTPImplCopyWith<$Res> {
  __$$onGetOTPImplCopyWithImpl(
      _$onGetOTPImpl _value, $Res Function(_$onGetOTPImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$onGetOTPImpl implements _onGetOTP {
  const _$onGetOTPImpl();

  @override
  String toString() {
    return 'VerifyNumberEvent.getOTP()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$onGetOTPImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getOTP,
    required TResult Function(String key, String code) verifyOTP,
  }) {
    return getOTP();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getOTP,
    TResult? Function(String key, String code)? verifyOTP,
  }) {
    return getOTP?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getOTP,
    TResult Function(String key, String code)? verifyOTP,
    required TResult orElse(),
  }) {
    if (getOTP != null) {
      return getOTP();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_onGetOTP value) getOTP,
    required TResult Function(_onVerifyOTP value) verifyOTP,
  }) {
    return getOTP(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_onGetOTP value)? getOTP,
    TResult? Function(_onVerifyOTP value)? verifyOTP,
  }) {
    return getOTP?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_onGetOTP value)? getOTP,
    TResult Function(_onVerifyOTP value)? verifyOTP,
    required TResult orElse(),
  }) {
    if (getOTP != null) {
      return getOTP(this);
    }
    return orElse();
  }
}

abstract class _onGetOTP implements VerifyNumberEvent {
  const factory _onGetOTP() = _$onGetOTPImpl;
}

/// @nodoc
abstract class _$$onVerifyOTPImplCopyWith<$Res> {
  factory _$$onVerifyOTPImplCopyWith(
          _$onVerifyOTPImpl value, $Res Function(_$onVerifyOTPImpl) then) =
      __$$onVerifyOTPImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String key, String code});
}

/// @nodoc
class __$$onVerifyOTPImplCopyWithImpl<$Res>
    extends _$VerifyNumberEventCopyWithImpl<$Res, _$onVerifyOTPImpl>
    implements _$$onVerifyOTPImplCopyWith<$Res> {
  __$$onVerifyOTPImplCopyWithImpl(
      _$onVerifyOTPImpl _value, $Res Function(_$onVerifyOTPImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? code = null,
  }) {
    return _then(_$onVerifyOTPImpl(
      null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$onVerifyOTPImpl implements _onVerifyOTP {
  const _$onVerifyOTPImpl(this.key, this.code);

  @override
  final String key;
  @override
  final String code;

  @override
  String toString() {
    return 'VerifyNumberEvent.verifyOTP(key: $key, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$onVerifyOTPImpl &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, key, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$onVerifyOTPImplCopyWith<_$onVerifyOTPImpl> get copyWith =>
      __$$onVerifyOTPImplCopyWithImpl<_$onVerifyOTPImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getOTP,
    required TResult Function(String key, String code) verifyOTP,
  }) {
    return verifyOTP(key, code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getOTP,
    TResult? Function(String key, String code)? verifyOTP,
  }) {
    return verifyOTP?.call(key, code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getOTP,
    TResult Function(String key, String code)? verifyOTP,
    required TResult orElse(),
  }) {
    if (verifyOTP != null) {
      return verifyOTP(key, code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_onGetOTP value) getOTP,
    required TResult Function(_onVerifyOTP value) verifyOTP,
  }) {
    return verifyOTP(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_onGetOTP value)? getOTP,
    TResult? Function(_onVerifyOTP value)? verifyOTP,
  }) {
    return verifyOTP?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_onGetOTP value)? getOTP,
    TResult Function(_onVerifyOTP value)? verifyOTP,
    required TResult orElse(),
  }) {
    if (verifyOTP != null) {
      return verifyOTP(this);
    }
    return orElse();
  }
}

abstract class _onVerifyOTP implements VerifyNumberEvent {
  const factory _onVerifyOTP(final String key, final String code) =
      _$onVerifyOTPImpl;

  String get key;
  String get code;
  @JsonKey(ignore: true)
  _$$onVerifyOTPImplCopyWith<_$onVerifyOTPImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$VerifyNumberState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() onLoading,
    required TResult Function(OTPModel model) onGetOTPSuccess,
    required TResult Function(String? message) onFailure,
    required TResult Function() onVerifyOTPSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? onLoading,
    TResult? Function(OTPModel model)? onGetOTPSuccess,
    TResult? Function(String? message)? onFailure,
    TResult? Function()? onVerifyOTPSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onLoading,
    TResult Function(OTPModel model)? onGetOTPSuccess,
    TResult Function(String? message)? onFailure,
    TResult Function()? onVerifyOTPSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_verifyNumberInitial value) initial,
    required TResult Function(_onLoading value) onLoading,
    required TResult Function(_onGetOTPSuccess value) onGetOTPSuccess,
    required TResult Function(_onFailure value) onFailure,
    required TResult Function(_onVerifyOTPSuccess value) onVerifyOTPSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_verifyNumberInitial value)? initial,
    TResult? Function(_onLoading value)? onLoading,
    TResult? Function(_onGetOTPSuccess value)? onGetOTPSuccess,
    TResult? Function(_onFailure value)? onFailure,
    TResult? Function(_onVerifyOTPSuccess value)? onVerifyOTPSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_verifyNumberInitial value)? initial,
    TResult Function(_onLoading value)? onLoading,
    TResult Function(_onGetOTPSuccess value)? onGetOTPSuccess,
    TResult Function(_onFailure value)? onFailure,
    TResult Function(_onVerifyOTPSuccess value)? onVerifyOTPSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyNumberStateCopyWith<$Res> {
  factory $VerifyNumberStateCopyWith(
          VerifyNumberState value, $Res Function(VerifyNumberState) then) =
      _$VerifyNumberStateCopyWithImpl<$Res, VerifyNumberState>;
}

/// @nodoc
class _$VerifyNumberStateCopyWithImpl<$Res, $Val extends VerifyNumberState>
    implements $VerifyNumberStateCopyWith<$Res> {
  _$VerifyNumberStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$verifyNumberInitialImplCopyWith<$Res> {
  factory _$$verifyNumberInitialImplCopyWith(_$verifyNumberInitialImpl value,
          $Res Function(_$verifyNumberInitialImpl) then) =
      __$$verifyNumberInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$verifyNumberInitialImplCopyWithImpl<$Res>
    extends _$VerifyNumberStateCopyWithImpl<$Res, _$verifyNumberInitialImpl>
    implements _$$verifyNumberInitialImplCopyWith<$Res> {
  __$$verifyNumberInitialImplCopyWithImpl(_$verifyNumberInitialImpl _value,
      $Res Function(_$verifyNumberInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$verifyNumberInitialImpl implements _verifyNumberInitial {
  const _$verifyNumberInitialImpl();

  @override
  String toString() {
    return 'VerifyNumberState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$verifyNumberInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() onLoading,
    required TResult Function(OTPModel model) onGetOTPSuccess,
    required TResult Function(String? message) onFailure,
    required TResult Function() onVerifyOTPSuccess,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? onLoading,
    TResult? Function(OTPModel model)? onGetOTPSuccess,
    TResult? Function(String? message)? onFailure,
    TResult? Function()? onVerifyOTPSuccess,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onLoading,
    TResult Function(OTPModel model)? onGetOTPSuccess,
    TResult Function(String? message)? onFailure,
    TResult Function()? onVerifyOTPSuccess,
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
    required TResult Function(_verifyNumberInitial value) initial,
    required TResult Function(_onLoading value) onLoading,
    required TResult Function(_onGetOTPSuccess value) onGetOTPSuccess,
    required TResult Function(_onFailure value) onFailure,
    required TResult Function(_onVerifyOTPSuccess value) onVerifyOTPSuccess,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_verifyNumberInitial value)? initial,
    TResult? Function(_onLoading value)? onLoading,
    TResult? Function(_onGetOTPSuccess value)? onGetOTPSuccess,
    TResult? Function(_onFailure value)? onFailure,
    TResult? Function(_onVerifyOTPSuccess value)? onVerifyOTPSuccess,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_verifyNumberInitial value)? initial,
    TResult Function(_onLoading value)? onLoading,
    TResult Function(_onGetOTPSuccess value)? onGetOTPSuccess,
    TResult Function(_onFailure value)? onFailure,
    TResult Function(_onVerifyOTPSuccess value)? onVerifyOTPSuccess,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _verifyNumberInitial implements VerifyNumberState {
  const factory _verifyNumberInitial() = _$verifyNumberInitialImpl;
}

/// @nodoc
abstract class _$$onLoadingImplCopyWith<$Res> {
  factory _$$onLoadingImplCopyWith(
          _$onLoadingImpl value, $Res Function(_$onLoadingImpl) then) =
      __$$onLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$onLoadingImplCopyWithImpl<$Res>
    extends _$VerifyNumberStateCopyWithImpl<$Res, _$onLoadingImpl>
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
    return 'VerifyNumberState.onLoading()';
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
    required TResult Function(OTPModel model) onGetOTPSuccess,
    required TResult Function(String? message) onFailure,
    required TResult Function() onVerifyOTPSuccess,
  }) {
    return onLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? onLoading,
    TResult? Function(OTPModel model)? onGetOTPSuccess,
    TResult? Function(String? message)? onFailure,
    TResult? Function()? onVerifyOTPSuccess,
  }) {
    return onLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onLoading,
    TResult Function(OTPModel model)? onGetOTPSuccess,
    TResult Function(String? message)? onFailure,
    TResult Function()? onVerifyOTPSuccess,
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
    required TResult Function(_verifyNumberInitial value) initial,
    required TResult Function(_onLoading value) onLoading,
    required TResult Function(_onGetOTPSuccess value) onGetOTPSuccess,
    required TResult Function(_onFailure value) onFailure,
    required TResult Function(_onVerifyOTPSuccess value) onVerifyOTPSuccess,
  }) {
    return onLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_verifyNumberInitial value)? initial,
    TResult? Function(_onLoading value)? onLoading,
    TResult? Function(_onGetOTPSuccess value)? onGetOTPSuccess,
    TResult? Function(_onFailure value)? onFailure,
    TResult? Function(_onVerifyOTPSuccess value)? onVerifyOTPSuccess,
  }) {
    return onLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_verifyNumberInitial value)? initial,
    TResult Function(_onLoading value)? onLoading,
    TResult Function(_onGetOTPSuccess value)? onGetOTPSuccess,
    TResult Function(_onFailure value)? onFailure,
    TResult Function(_onVerifyOTPSuccess value)? onVerifyOTPSuccess,
    required TResult orElse(),
  }) {
    if (onLoading != null) {
      return onLoading(this);
    }
    return orElse();
  }
}

abstract class _onLoading implements VerifyNumberState {
  const factory _onLoading() = _$onLoadingImpl;
}

/// @nodoc
abstract class _$$onGetOTPSuccessImplCopyWith<$Res> {
  factory _$$onGetOTPSuccessImplCopyWith(_$onGetOTPSuccessImpl value,
          $Res Function(_$onGetOTPSuccessImpl) then) =
      __$$onGetOTPSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({OTPModel model});
}

/// @nodoc
class __$$onGetOTPSuccessImplCopyWithImpl<$Res>
    extends _$VerifyNumberStateCopyWithImpl<$Res, _$onGetOTPSuccessImpl>
    implements _$$onGetOTPSuccessImplCopyWith<$Res> {
  __$$onGetOTPSuccessImplCopyWithImpl(
      _$onGetOTPSuccessImpl _value, $Res Function(_$onGetOTPSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
  }) {
    return _then(_$onGetOTPSuccessImpl(
      null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as OTPModel,
    ));
  }
}

/// @nodoc

class _$onGetOTPSuccessImpl implements _onGetOTPSuccess {
  const _$onGetOTPSuccessImpl(this.model);

  @override
  final OTPModel model;

  @override
  String toString() {
    return 'VerifyNumberState.onGetOTPSuccess(model: $model)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$onGetOTPSuccessImpl &&
            (identical(other.model, model) || other.model == model));
  }

  @override
  int get hashCode => Object.hash(runtimeType, model);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$onGetOTPSuccessImplCopyWith<_$onGetOTPSuccessImpl> get copyWith =>
      __$$onGetOTPSuccessImplCopyWithImpl<_$onGetOTPSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() onLoading,
    required TResult Function(OTPModel model) onGetOTPSuccess,
    required TResult Function(String? message) onFailure,
    required TResult Function() onVerifyOTPSuccess,
  }) {
    return onGetOTPSuccess(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? onLoading,
    TResult? Function(OTPModel model)? onGetOTPSuccess,
    TResult? Function(String? message)? onFailure,
    TResult? Function()? onVerifyOTPSuccess,
  }) {
    return onGetOTPSuccess?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onLoading,
    TResult Function(OTPModel model)? onGetOTPSuccess,
    TResult Function(String? message)? onFailure,
    TResult Function()? onVerifyOTPSuccess,
    required TResult orElse(),
  }) {
    if (onGetOTPSuccess != null) {
      return onGetOTPSuccess(model);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_verifyNumberInitial value) initial,
    required TResult Function(_onLoading value) onLoading,
    required TResult Function(_onGetOTPSuccess value) onGetOTPSuccess,
    required TResult Function(_onFailure value) onFailure,
    required TResult Function(_onVerifyOTPSuccess value) onVerifyOTPSuccess,
  }) {
    return onGetOTPSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_verifyNumberInitial value)? initial,
    TResult? Function(_onLoading value)? onLoading,
    TResult? Function(_onGetOTPSuccess value)? onGetOTPSuccess,
    TResult? Function(_onFailure value)? onFailure,
    TResult? Function(_onVerifyOTPSuccess value)? onVerifyOTPSuccess,
  }) {
    return onGetOTPSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_verifyNumberInitial value)? initial,
    TResult Function(_onLoading value)? onLoading,
    TResult Function(_onGetOTPSuccess value)? onGetOTPSuccess,
    TResult Function(_onFailure value)? onFailure,
    TResult Function(_onVerifyOTPSuccess value)? onVerifyOTPSuccess,
    required TResult orElse(),
  }) {
    if (onGetOTPSuccess != null) {
      return onGetOTPSuccess(this);
    }
    return orElse();
  }
}

abstract class _onGetOTPSuccess implements VerifyNumberState {
  const factory _onGetOTPSuccess(final OTPModel model) = _$onGetOTPSuccessImpl;

  OTPModel get model;
  @JsonKey(ignore: true)
  _$$onGetOTPSuccessImplCopyWith<_$onGetOTPSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
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
    extends _$VerifyNumberStateCopyWithImpl<$Res, _$onFailureImpl>
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
    return 'VerifyNumberState.onFailure(message: $message)';
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
    required TResult Function(OTPModel model) onGetOTPSuccess,
    required TResult Function(String? message) onFailure,
    required TResult Function() onVerifyOTPSuccess,
  }) {
    return onFailure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? onLoading,
    TResult? Function(OTPModel model)? onGetOTPSuccess,
    TResult? Function(String? message)? onFailure,
    TResult? Function()? onVerifyOTPSuccess,
  }) {
    return onFailure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onLoading,
    TResult Function(OTPModel model)? onGetOTPSuccess,
    TResult Function(String? message)? onFailure,
    TResult Function()? onVerifyOTPSuccess,
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
    required TResult Function(_verifyNumberInitial value) initial,
    required TResult Function(_onLoading value) onLoading,
    required TResult Function(_onGetOTPSuccess value) onGetOTPSuccess,
    required TResult Function(_onFailure value) onFailure,
    required TResult Function(_onVerifyOTPSuccess value) onVerifyOTPSuccess,
  }) {
    return onFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_verifyNumberInitial value)? initial,
    TResult? Function(_onLoading value)? onLoading,
    TResult? Function(_onGetOTPSuccess value)? onGetOTPSuccess,
    TResult? Function(_onFailure value)? onFailure,
    TResult? Function(_onVerifyOTPSuccess value)? onVerifyOTPSuccess,
  }) {
    return onFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_verifyNumberInitial value)? initial,
    TResult Function(_onLoading value)? onLoading,
    TResult Function(_onGetOTPSuccess value)? onGetOTPSuccess,
    TResult Function(_onFailure value)? onFailure,
    TResult Function(_onVerifyOTPSuccess value)? onVerifyOTPSuccess,
    required TResult orElse(),
  }) {
    if (onFailure != null) {
      return onFailure(this);
    }
    return orElse();
  }
}

abstract class _onFailure implements VerifyNumberState {
  const factory _onFailure(final String? message) = _$onFailureImpl;

  String? get message;
  @JsonKey(ignore: true)
  _$$onFailureImplCopyWith<_$onFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$onVerifyOTPSuccessImplCopyWith<$Res> {
  factory _$$onVerifyOTPSuccessImplCopyWith(_$onVerifyOTPSuccessImpl value,
          $Res Function(_$onVerifyOTPSuccessImpl) then) =
      __$$onVerifyOTPSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$onVerifyOTPSuccessImplCopyWithImpl<$Res>
    extends _$VerifyNumberStateCopyWithImpl<$Res, _$onVerifyOTPSuccessImpl>
    implements _$$onVerifyOTPSuccessImplCopyWith<$Res> {
  __$$onVerifyOTPSuccessImplCopyWithImpl(_$onVerifyOTPSuccessImpl _value,
      $Res Function(_$onVerifyOTPSuccessImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$onVerifyOTPSuccessImpl implements _onVerifyOTPSuccess {
  const _$onVerifyOTPSuccessImpl();

  @override
  String toString() {
    return 'VerifyNumberState.onVerifyOTPSuccess()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$onVerifyOTPSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() onLoading,
    required TResult Function(OTPModel model) onGetOTPSuccess,
    required TResult Function(String? message) onFailure,
    required TResult Function() onVerifyOTPSuccess,
  }) {
    return onVerifyOTPSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? onLoading,
    TResult? Function(OTPModel model)? onGetOTPSuccess,
    TResult? Function(String? message)? onFailure,
    TResult? Function()? onVerifyOTPSuccess,
  }) {
    return onVerifyOTPSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onLoading,
    TResult Function(OTPModel model)? onGetOTPSuccess,
    TResult Function(String? message)? onFailure,
    TResult Function()? onVerifyOTPSuccess,
    required TResult orElse(),
  }) {
    if (onVerifyOTPSuccess != null) {
      return onVerifyOTPSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_verifyNumberInitial value) initial,
    required TResult Function(_onLoading value) onLoading,
    required TResult Function(_onGetOTPSuccess value) onGetOTPSuccess,
    required TResult Function(_onFailure value) onFailure,
    required TResult Function(_onVerifyOTPSuccess value) onVerifyOTPSuccess,
  }) {
    return onVerifyOTPSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_verifyNumberInitial value)? initial,
    TResult? Function(_onLoading value)? onLoading,
    TResult? Function(_onGetOTPSuccess value)? onGetOTPSuccess,
    TResult? Function(_onFailure value)? onFailure,
    TResult? Function(_onVerifyOTPSuccess value)? onVerifyOTPSuccess,
  }) {
    return onVerifyOTPSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_verifyNumberInitial value)? initial,
    TResult Function(_onLoading value)? onLoading,
    TResult Function(_onGetOTPSuccess value)? onGetOTPSuccess,
    TResult Function(_onFailure value)? onFailure,
    TResult Function(_onVerifyOTPSuccess value)? onVerifyOTPSuccess,
    required TResult orElse(),
  }) {
    if (onVerifyOTPSuccess != null) {
      return onVerifyOTPSuccess(this);
    }
    return orElse();
  }
}

abstract class _onVerifyOTPSuccess implements VerifyNumberState {
  const factory _onVerifyOTPSuccess() = _$onVerifyOTPSuccessImpl;
}
