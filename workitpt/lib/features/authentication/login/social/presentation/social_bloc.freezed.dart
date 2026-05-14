// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'social_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SocialEvent {
  SocialType? get socialType => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SocialType? socialType) doSocialLogin,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SocialType? socialType)? doSocialLogin,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SocialType? socialType)? doSocialLogin,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(doSocialLogin value) doSocialLogin,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(doSocialLogin value)? doSocialLogin,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(doSocialLogin value)? doSocialLogin,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SocialEventCopyWith<SocialEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SocialEventCopyWith<$Res> {
  factory $SocialEventCopyWith(
          SocialEvent value, $Res Function(SocialEvent) then) =
      _$SocialEventCopyWithImpl<$Res, SocialEvent>;
  @useResult
  $Res call({SocialType? socialType});
}

/// @nodoc
class _$SocialEventCopyWithImpl<$Res, $Val extends SocialEvent>
    implements $SocialEventCopyWith<$Res> {
  _$SocialEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? socialType = freezed,
  }) {
    return _then(_value.copyWith(
      socialType: freezed == socialType
          ? _value.socialType
          : socialType // ignore: cast_nullable_to_non_nullable
              as SocialType?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$doSocialLoginImplCopyWith<$Res>
    implements $SocialEventCopyWith<$Res> {
  factory _$$doSocialLoginImplCopyWith(
          _$doSocialLoginImpl value, $Res Function(_$doSocialLoginImpl) then) =
      __$$doSocialLoginImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SocialType? socialType});
}

/// @nodoc
class __$$doSocialLoginImplCopyWithImpl<$Res>
    extends _$SocialEventCopyWithImpl<$Res, _$doSocialLoginImpl>
    implements _$$doSocialLoginImplCopyWith<$Res> {
  __$$doSocialLoginImplCopyWithImpl(
      _$doSocialLoginImpl _value, $Res Function(_$doSocialLoginImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? socialType = freezed,
  }) {
    return _then(_$doSocialLoginImpl(
      socialType: freezed == socialType
          ? _value.socialType
          : socialType // ignore: cast_nullable_to_non_nullable
              as SocialType?,
    ));
  }
}

/// @nodoc

class _$doSocialLoginImpl
    with DiagnosticableTreeMixin
    implements doSocialLogin {
  const _$doSocialLoginImpl({this.socialType});

  @override
  final SocialType? socialType;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SocialEvent.doSocialLogin(socialType: $socialType)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SocialEvent.doSocialLogin'))
      ..add(DiagnosticsProperty('socialType', socialType));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$doSocialLoginImpl &&
            (identical(other.socialType, socialType) ||
                other.socialType == socialType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, socialType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$doSocialLoginImplCopyWith<_$doSocialLoginImpl> get copyWith =>
      __$$doSocialLoginImplCopyWithImpl<_$doSocialLoginImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SocialType? socialType) doSocialLogin,
  }) {
    return doSocialLogin(socialType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SocialType? socialType)? doSocialLogin,
  }) {
    return doSocialLogin?.call(socialType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SocialType? socialType)? doSocialLogin,
    required TResult orElse(),
  }) {
    if (doSocialLogin != null) {
      return doSocialLogin(socialType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(doSocialLogin value) doSocialLogin,
  }) {
    return doSocialLogin(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(doSocialLogin value)? doSocialLogin,
  }) {
    return doSocialLogin?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(doSocialLogin value)? doSocialLogin,
    required TResult orElse(),
  }) {
    if (doSocialLogin != null) {
      return doSocialLogin(this);
    }
    return orElse();
  }
}

abstract class doSocialLogin implements SocialEvent {
  const factory doSocialLogin({final SocialType? socialType}) =
      _$doSocialLoginImpl;

  @override
  SocialType? get socialType;
  @override
  @JsonKey(ignore: true)
  _$$doSocialLoginImplCopyWith<_$doSocialLoginImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SocialState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() onLoading,
    required TResult Function(AuthModel user) onSuccess,
    required TResult Function(String message) onFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? onLoading,
    TResult? Function(AuthModel user)? onSuccess,
    TResult? Function(String message)? onFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onLoading,
    TResult Function(AuthModel user)? onSuccess,
    TResult Function(String message)? onFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_onLoading value) onLoading,
    required TResult Function(_onSuccess value) onSuccess,
    required TResult Function(_onFailure value) onFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_onLoading value)? onLoading,
    TResult? Function(_onSuccess value)? onSuccess,
    TResult? Function(_onFailure value)? onFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_onLoading value)? onLoading,
    TResult Function(_onSuccess value)? onSuccess,
    TResult Function(_onFailure value)? onFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SocialStateCopyWith<$Res> {
  factory $SocialStateCopyWith(
          SocialState value, $Res Function(SocialState) then) =
      _$SocialStateCopyWithImpl<$Res, SocialState>;
}

/// @nodoc
class _$SocialStateCopyWithImpl<$Res, $Val extends SocialState>
    implements $SocialStateCopyWith<$Res> {
  _$SocialStateCopyWithImpl(this._value, this._then);

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
    extends _$SocialStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl with DiagnosticableTreeMixin implements _Initial {
  const _$InitialImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SocialState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'SocialState.initial'));
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
    required TResult Function(AuthModel user) onSuccess,
    required TResult Function(String message) onFailure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? onLoading,
    TResult? Function(AuthModel user)? onSuccess,
    TResult? Function(String message)? onFailure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onLoading,
    TResult Function(AuthModel user)? onSuccess,
    TResult Function(String message)? onFailure,
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
    required TResult Function(_onSuccess value) onSuccess,
    required TResult Function(_onFailure value) onFailure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_onLoading value)? onLoading,
    TResult? Function(_onSuccess value)? onSuccess,
    TResult? Function(_onFailure value)? onFailure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_onLoading value)? onLoading,
    TResult Function(_onSuccess value)? onSuccess,
    TResult Function(_onFailure value)? onFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements SocialState {
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
    extends _$SocialStateCopyWithImpl<$Res, _$onLoadingImpl>
    implements _$$onLoadingImplCopyWith<$Res> {
  __$$onLoadingImplCopyWithImpl(
      _$onLoadingImpl _value, $Res Function(_$onLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$onLoadingImpl with DiagnosticableTreeMixin implements _onLoading {
  const _$onLoadingImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SocialState.onLoading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'SocialState.onLoading'));
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
    required TResult Function(AuthModel user) onSuccess,
    required TResult Function(String message) onFailure,
  }) {
    return onLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? onLoading,
    TResult? Function(AuthModel user)? onSuccess,
    TResult? Function(String message)? onFailure,
  }) {
    return onLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onLoading,
    TResult Function(AuthModel user)? onSuccess,
    TResult Function(String message)? onFailure,
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
    required TResult Function(_onSuccess value) onSuccess,
    required TResult Function(_onFailure value) onFailure,
  }) {
    return onLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_onLoading value)? onLoading,
    TResult? Function(_onSuccess value)? onSuccess,
    TResult? Function(_onFailure value)? onFailure,
  }) {
    return onLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_onLoading value)? onLoading,
    TResult Function(_onSuccess value)? onSuccess,
    TResult Function(_onFailure value)? onFailure,
    required TResult orElse(),
  }) {
    if (onLoading != null) {
      return onLoading(this);
    }
    return orElse();
  }
}

abstract class _onLoading implements SocialState {
  const factory _onLoading() = _$onLoadingImpl;
}

/// @nodoc
abstract class _$$onSuccessImplCopyWith<$Res> {
  factory _$$onSuccessImplCopyWith(
          _$onSuccessImpl value, $Res Function(_$onSuccessImpl) then) =
      __$$onSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AuthModel user});
}

/// @nodoc
class __$$onSuccessImplCopyWithImpl<$Res>
    extends _$SocialStateCopyWithImpl<$Res, _$onSuccessImpl>
    implements _$$onSuccessImplCopyWith<$Res> {
  __$$onSuccessImplCopyWithImpl(
      _$onSuccessImpl _value, $Res Function(_$onSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$onSuccessImpl(
      null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as AuthModel,
    ));
  }
}

/// @nodoc

class _$onSuccessImpl with DiagnosticableTreeMixin implements _onSuccess {
  const _$onSuccessImpl(this.user);

  @override
  final AuthModel user;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SocialState.onSuccess(user: $user)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SocialState.onSuccess'))
      ..add(DiagnosticsProperty('user', user));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$onSuccessImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$onSuccessImplCopyWith<_$onSuccessImpl> get copyWith =>
      __$$onSuccessImplCopyWithImpl<_$onSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() onLoading,
    required TResult Function(AuthModel user) onSuccess,
    required TResult Function(String message) onFailure,
  }) {
    return onSuccess(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? onLoading,
    TResult? Function(AuthModel user)? onSuccess,
    TResult? Function(String message)? onFailure,
  }) {
    return onSuccess?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onLoading,
    TResult Function(AuthModel user)? onSuccess,
    TResult Function(String message)? onFailure,
    required TResult orElse(),
  }) {
    if (onSuccess != null) {
      return onSuccess(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_onLoading value) onLoading,
    required TResult Function(_onSuccess value) onSuccess,
    required TResult Function(_onFailure value) onFailure,
  }) {
    return onSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_onLoading value)? onLoading,
    TResult? Function(_onSuccess value)? onSuccess,
    TResult? Function(_onFailure value)? onFailure,
  }) {
    return onSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_onLoading value)? onLoading,
    TResult Function(_onSuccess value)? onSuccess,
    TResult Function(_onFailure value)? onFailure,
    required TResult orElse(),
  }) {
    if (onSuccess != null) {
      return onSuccess(this);
    }
    return orElse();
  }
}

abstract class _onSuccess implements SocialState {
  const factory _onSuccess(final AuthModel user) = _$onSuccessImpl;

  AuthModel get user;
  @JsonKey(ignore: true)
  _$$onSuccessImplCopyWith<_$onSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$onFailureImplCopyWith<$Res> {
  factory _$$onFailureImplCopyWith(
          _$onFailureImpl value, $Res Function(_$onFailureImpl) then) =
      __$$onFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$onFailureImplCopyWithImpl<$Res>
    extends _$SocialStateCopyWithImpl<$Res, _$onFailureImpl>
    implements _$$onFailureImplCopyWith<$Res> {
  __$$onFailureImplCopyWithImpl(
      _$onFailureImpl _value, $Res Function(_$onFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$onFailureImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$onFailureImpl with DiagnosticableTreeMixin implements _onFailure {
  const _$onFailureImpl(this.message);

  @override
  final String message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SocialState.onFailure(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SocialState.onFailure'))
      ..add(DiagnosticsProperty('message', message));
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
    required TResult Function(AuthModel user) onSuccess,
    required TResult Function(String message) onFailure,
  }) {
    return onFailure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? onLoading,
    TResult? Function(AuthModel user)? onSuccess,
    TResult? Function(String message)? onFailure,
  }) {
    return onFailure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onLoading,
    TResult Function(AuthModel user)? onSuccess,
    TResult Function(String message)? onFailure,
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
    required TResult Function(_onSuccess value) onSuccess,
    required TResult Function(_onFailure value) onFailure,
  }) {
    return onFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_onLoading value)? onLoading,
    TResult? Function(_onSuccess value)? onSuccess,
    TResult? Function(_onFailure value)? onFailure,
  }) {
    return onFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_onLoading value)? onLoading,
    TResult Function(_onSuccess value)? onSuccess,
    TResult Function(_onFailure value)? onFailure,
    required TResult orElse(),
  }) {
    if (onFailure != null) {
      return onFailure(this);
    }
    return orElse();
  }
}

abstract class _onFailure implements SocialState {
  const factory _onFailure(final String message) = _$onFailureImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$onFailureImplCopyWith<_$onFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
