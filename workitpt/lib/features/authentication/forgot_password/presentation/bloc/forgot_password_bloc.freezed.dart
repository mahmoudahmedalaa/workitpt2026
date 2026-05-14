// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forgot_password_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ForgotPasswordEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) requestPassword,
    required TResult Function(String code, String key) requestToken,
    required TResult Function(String token, String newPassword) changePassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? requestPassword,
    TResult? Function(String code, String key)? requestToken,
    TResult? Function(String token, String newPassword)? changePassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? requestPassword,
    TResult Function(String code, String key)? requestToken,
    TResult Function(String token, String newPassword)? changePassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(requestPassword value) requestPassword,
    required TResult Function(requestToken value) requestToken,
    required TResult Function(changePassword value) changePassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(requestPassword value)? requestPassword,
    TResult? Function(requestToken value)? requestToken,
    TResult? Function(changePassword value)? changePassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(requestPassword value)? requestPassword,
    TResult Function(requestToken value)? requestToken,
    TResult Function(changePassword value)? changePassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgotPasswordEventCopyWith<$Res> {
  factory $ForgotPasswordEventCopyWith(
          ForgotPasswordEvent value, $Res Function(ForgotPasswordEvent) then) =
      _$ForgotPasswordEventCopyWithImpl<$Res, ForgotPasswordEvent>;
}

/// @nodoc
class _$ForgotPasswordEventCopyWithImpl<$Res, $Val extends ForgotPasswordEvent>
    implements $ForgotPasswordEventCopyWith<$Res> {
  _$ForgotPasswordEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$requestPasswordImplCopyWith<$Res> {
  factory _$$requestPasswordImplCopyWith(_$requestPasswordImpl value,
          $Res Function(_$requestPasswordImpl) then) =
      __$$requestPasswordImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$requestPasswordImplCopyWithImpl<$Res>
    extends _$ForgotPasswordEventCopyWithImpl<$Res, _$requestPasswordImpl>
    implements _$$requestPasswordImplCopyWith<$Res> {
  __$$requestPasswordImplCopyWithImpl(
      _$requestPasswordImpl _value, $Res Function(_$requestPasswordImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$requestPasswordImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$requestPasswordImpl implements requestPassword {
  const _$requestPasswordImpl({required this.email});

  @override
  final String email;

  @override
  String toString() {
    return 'ForgotPasswordEvent.requestPassword(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$requestPasswordImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$requestPasswordImplCopyWith<_$requestPasswordImpl> get copyWith =>
      __$$requestPasswordImplCopyWithImpl<_$requestPasswordImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) requestPassword,
    required TResult Function(String code, String key) requestToken,
    required TResult Function(String token, String newPassword) changePassword,
  }) {
    return requestPassword(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? requestPassword,
    TResult? Function(String code, String key)? requestToken,
    TResult? Function(String token, String newPassword)? changePassword,
  }) {
    return requestPassword?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? requestPassword,
    TResult Function(String code, String key)? requestToken,
    TResult Function(String token, String newPassword)? changePassword,
    required TResult orElse(),
  }) {
    if (requestPassword != null) {
      return requestPassword(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(requestPassword value) requestPassword,
    required TResult Function(requestToken value) requestToken,
    required TResult Function(changePassword value) changePassword,
  }) {
    return requestPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(requestPassword value)? requestPassword,
    TResult? Function(requestToken value)? requestToken,
    TResult? Function(changePassword value)? changePassword,
  }) {
    return requestPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(requestPassword value)? requestPassword,
    TResult Function(requestToken value)? requestToken,
    TResult Function(changePassword value)? changePassword,
    required TResult orElse(),
  }) {
    if (requestPassword != null) {
      return requestPassword(this);
    }
    return orElse();
  }
}

abstract class requestPassword implements ForgotPasswordEvent {
  const factory requestPassword({required final String email}) =
      _$requestPasswordImpl;

  String get email;
  @JsonKey(ignore: true)
  _$$requestPasswordImplCopyWith<_$requestPasswordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$requestTokenImplCopyWith<$Res> {
  factory _$$requestTokenImplCopyWith(
          _$requestTokenImpl value, $Res Function(_$requestTokenImpl) then) =
      __$$requestTokenImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String code, String key});
}

/// @nodoc
class __$$requestTokenImplCopyWithImpl<$Res>
    extends _$ForgotPasswordEventCopyWithImpl<$Res, _$requestTokenImpl>
    implements _$$requestTokenImplCopyWith<$Res> {
  __$$requestTokenImplCopyWithImpl(
      _$requestTokenImpl _value, $Res Function(_$requestTokenImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? key = null,
  }) {
    return _then(_$requestTokenImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$requestTokenImpl implements requestToken {
  const _$requestTokenImpl({required this.code, required this.key});

  @override
  final String code;
  @override
  final String key;

  @override
  String toString() {
    return 'ForgotPasswordEvent.requestToken(code: $code, key: $key)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$requestTokenImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.key, key) || other.key == key));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code, key);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$requestTokenImplCopyWith<_$requestTokenImpl> get copyWith =>
      __$$requestTokenImplCopyWithImpl<_$requestTokenImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) requestPassword,
    required TResult Function(String code, String key) requestToken,
    required TResult Function(String token, String newPassword) changePassword,
  }) {
    return requestToken(code, key);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? requestPassword,
    TResult? Function(String code, String key)? requestToken,
    TResult? Function(String token, String newPassword)? changePassword,
  }) {
    return requestToken?.call(code, key);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? requestPassword,
    TResult Function(String code, String key)? requestToken,
    TResult Function(String token, String newPassword)? changePassword,
    required TResult orElse(),
  }) {
    if (requestToken != null) {
      return requestToken(code, key);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(requestPassword value) requestPassword,
    required TResult Function(requestToken value) requestToken,
    required TResult Function(changePassword value) changePassword,
  }) {
    return requestToken(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(requestPassword value)? requestPassword,
    TResult? Function(requestToken value)? requestToken,
    TResult? Function(changePassword value)? changePassword,
  }) {
    return requestToken?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(requestPassword value)? requestPassword,
    TResult Function(requestToken value)? requestToken,
    TResult Function(changePassword value)? changePassword,
    required TResult orElse(),
  }) {
    if (requestToken != null) {
      return requestToken(this);
    }
    return orElse();
  }
}

abstract class requestToken implements ForgotPasswordEvent {
  const factory requestToken(
      {required final String code,
      required final String key}) = _$requestTokenImpl;

  String get code;
  String get key;
  @JsonKey(ignore: true)
  _$$requestTokenImplCopyWith<_$requestTokenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$changePasswordImplCopyWith<$Res> {
  factory _$$changePasswordImplCopyWith(_$changePasswordImpl value,
          $Res Function(_$changePasswordImpl) then) =
      __$$changePasswordImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String token, String newPassword});
}

/// @nodoc
class __$$changePasswordImplCopyWithImpl<$Res>
    extends _$ForgotPasswordEventCopyWithImpl<$Res, _$changePasswordImpl>
    implements _$$changePasswordImplCopyWith<$Res> {
  __$$changePasswordImplCopyWithImpl(
      _$changePasswordImpl _value, $Res Function(_$changePasswordImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? newPassword = null,
  }) {
    return _then(_$changePasswordImpl(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      newPassword: null == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$changePasswordImpl implements changePassword {
  const _$changePasswordImpl({required this.token, required this.newPassword});

  @override
  final String token;
  @override
  final String newPassword;

  @override
  String toString() {
    return 'ForgotPasswordEvent.changePassword(token: $token, newPassword: $newPassword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$changePasswordImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword));
  }

  @override
  int get hashCode => Object.hash(runtimeType, token, newPassword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$changePasswordImplCopyWith<_$changePasswordImpl> get copyWith =>
      __$$changePasswordImplCopyWithImpl<_$changePasswordImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) requestPassword,
    required TResult Function(String code, String key) requestToken,
    required TResult Function(String token, String newPassword) changePassword,
  }) {
    return changePassword(token, newPassword);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? requestPassword,
    TResult? Function(String code, String key)? requestToken,
    TResult? Function(String token, String newPassword)? changePassword,
  }) {
    return changePassword?.call(token, newPassword);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? requestPassword,
    TResult Function(String code, String key)? requestToken,
    TResult Function(String token, String newPassword)? changePassword,
    required TResult orElse(),
  }) {
    if (changePassword != null) {
      return changePassword(token, newPassword);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(requestPassword value) requestPassword,
    required TResult Function(requestToken value) requestToken,
    required TResult Function(changePassword value) changePassword,
  }) {
    return changePassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(requestPassword value)? requestPassword,
    TResult? Function(requestToken value)? requestToken,
    TResult? Function(changePassword value)? changePassword,
  }) {
    return changePassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(requestPassword value)? requestPassword,
    TResult Function(requestToken value)? requestToken,
    TResult Function(changePassword value)? changePassword,
    required TResult orElse(),
  }) {
    if (changePassword != null) {
      return changePassword(this);
    }
    return orElse();
  }
}

abstract class changePassword implements ForgotPasswordEvent {
  const factory changePassword(
      {required final String token,
      required final String newPassword}) = _$changePasswordImpl;

  String get token;
  String get newPassword;
  @JsonKey(ignore: true)
  _$$changePasswordImplCopyWith<_$changePasswordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ForgotPasswordState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() onLoading,
    required TResult Function(ForgotPasswordResponseModel response) onSuccess,
    required TResult Function(ForgotPasswordTokenModel response) onTokenSuccess,
    required TResult Function(NoDataModel response) onChangePasswordSuccess,
    required TResult Function(String message) onFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? onLoading,
    TResult? Function(ForgotPasswordResponseModel response)? onSuccess,
    TResult? Function(ForgotPasswordTokenModel response)? onTokenSuccess,
    TResult? Function(NoDataModel response)? onChangePasswordSuccess,
    TResult? Function(String message)? onFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onLoading,
    TResult Function(ForgotPasswordResponseModel response)? onSuccess,
    TResult Function(ForgotPasswordTokenModel response)? onTokenSuccess,
    TResult Function(NoDataModel response)? onChangePasswordSuccess,
    TResult Function(String message)? onFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_onLoading value) onLoading,
    required TResult Function(_onSuccess value) onSuccess,
    required TResult Function(_onTokenSuccess value) onTokenSuccess,
    required TResult Function(_onChangePasswordSuccess value)
        onChangePasswordSuccess,
    required TResult Function(_onFailure value) onFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_onLoading value)? onLoading,
    TResult? Function(_onSuccess value)? onSuccess,
    TResult? Function(_onTokenSuccess value)? onTokenSuccess,
    TResult? Function(_onChangePasswordSuccess value)? onChangePasswordSuccess,
    TResult? Function(_onFailure value)? onFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_onLoading value)? onLoading,
    TResult Function(_onSuccess value)? onSuccess,
    TResult Function(_onTokenSuccess value)? onTokenSuccess,
    TResult Function(_onChangePasswordSuccess value)? onChangePasswordSuccess,
    TResult Function(_onFailure value)? onFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgotPasswordStateCopyWith<$Res> {
  factory $ForgotPasswordStateCopyWith(
          ForgotPasswordState value, $Res Function(ForgotPasswordState) then) =
      _$ForgotPasswordStateCopyWithImpl<$Res, ForgotPasswordState>;
}

/// @nodoc
class _$ForgotPasswordStateCopyWithImpl<$Res, $Val extends ForgotPasswordState>
    implements $ForgotPasswordStateCopyWith<$Res> {
  _$ForgotPasswordStateCopyWithImpl(this._value, this._then);

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
    extends _$ForgotPasswordStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'ForgotPasswordState.initial()';
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
    required TResult Function(ForgotPasswordResponseModel response) onSuccess,
    required TResult Function(ForgotPasswordTokenModel response) onTokenSuccess,
    required TResult Function(NoDataModel response) onChangePasswordSuccess,
    required TResult Function(String message) onFailure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? onLoading,
    TResult? Function(ForgotPasswordResponseModel response)? onSuccess,
    TResult? Function(ForgotPasswordTokenModel response)? onTokenSuccess,
    TResult? Function(NoDataModel response)? onChangePasswordSuccess,
    TResult? Function(String message)? onFailure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onLoading,
    TResult Function(ForgotPasswordResponseModel response)? onSuccess,
    TResult Function(ForgotPasswordTokenModel response)? onTokenSuccess,
    TResult Function(NoDataModel response)? onChangePasswordSuccess,
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
    required TResult Function(_onTokenSuccess value) onTokenSuccess,
    required TResult Function(_onChangePasswordSuccess value)
        onChangePasswordSuccess,
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
    TResult? Function(_onTokenSuccess value)? onTokenSuccess,
    TResult? Function(_onChangePasswordSuccess value)? onChangePasswordSuccess,
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
    TResult Function(_onTokenSuccess value)? onTokenSuccess,
    TResult Function(_onChangePasswordSuccess value)? onChangePasswordSuccess,
    TResult Function(_onFailure value)? onFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ForgotPasswordState {
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
    extends _$ForgotPasswordStateCopyWithImpl<$Res, _$onLoadingImpl>
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
    return 'ForgotPasswordState.onLoading()';
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
    required TResult Function(ForgotPasswordResponseModel response) onSuccess,
    required TResult Function(ForgotPasswordTokenModel response) onTokenSuccess,
    required TResult Function(NoDataModel response) onChangePasswordSuccess,
    required TResult Function(String message) onFailure,
  }) {
    return onLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? onLoading,
    TResult? Function(ForgotPasswordResponseModel response)? onSuccess,
    TResult? Function(ForgotPasswordTokenModel response)? onTokenSuccess,
    TResult? Function(NoDataModel response)? onChangePasswordSuccess,
    TResult? Function(String message)? onFailure,
  }) {
    return onLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onLoading,
    TResult Function(ForgotPasswordResponseModel response)? onSuccess,
    TResult Function(ForgotPasswordTokenModel response)? onTokenSuccess,
    TResult Function(NoDataModel response)? onChangePasswordSuccess,
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
    required TResult Function(_onTokenSuccess value) onTokenSuccess,
    required TResult Function(_onChangePasswordSuccess value)
        onChangePasswordSuccess,
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
    TResult? Function(_onTokenSuccess value)? onTokenSuccess,
    TResult? Function(_onChangePasswordSuccess value)? onChangePasswordSuccess,
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
    TResult Function(_onTokenSuccess value)? onTokenSuccess,
    TResult Function(_onChangePasswordSuccess value)? onChangePasswordSuccess,
    TResult Function(_onFailure value)? onFailure,
    required TResult orElse(),
  }) {
    if (onLoading != null) {
      return onLoading(this);
    }
    return orElse();
  }
}

abstract class _onLoading implements ForgotPasswordState {
  const factory _onLoading() = _$onLoadingImpl;
}

/// @nodoc
abstract class _$$onSuccessImplCopyWith<$Res> {
  factory _$$onSuccessImplCopyWith(
          _$onSuccessImpl value, $Res Function(_$onSuccessImpl) then) =
      __$$onSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ForgotPasswordResponseModel response});
}

/// @nodoc
class __$$onSuccessImplCopyWithImpl<$Res>
    extends _$ForgotPasswordStateCopyWithImpl<$Res, _$onSuccessImpl>
    implements _$$onSuccessImplCopyWith<$Res> {
  __$$onSuccessImplCopyWithImpl(
      _$onSuccessImpl _value, $Res Function(_$onSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = null,
  }) {
    return _then(_$onSuccessImpl(
      null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as ForgotPasswordResponseModel,
    ));
  }
}

/// @nodoc

class _$onSuccessImpl implements _onSuccess {
  const _$onSuccessImpl(this.response);

  @override
  final ForgotPasswordResponseModel response;

  @override
  String toString() {
    return 'ForgotPasswordState.onSuccess(response: $response)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$onSuccessImpl &&
            (identical(other.response, response) ||
                other.response == response));
  }

  @override
  int get hashCode => Object.hash(runtimeType, response);

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
    required TResult Function(ForgotPasswordResponseModel response) onSuccess,
    required TResult Function(ForgotPasswordTokenModel response) onTokenSuccess,
    required TResult Function(NoDataModel response) onChangePasswordSuccess,
    required TResult Function(String message) onFailure,
  }) {
    return onSuccess(response);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? onLoading,
    TResult? Function(ForgotPasswordResponseModel response)? onSuccess,
    TResult? Function(ForgotPasswordTokenModel response)? onTokenSuccess,
    TResult? Function(NoDataModel response)? onChangePasswordSuccess,
    TResult? Function(String message)? onFailure,
  }) {
    return onSuccess?.call(response);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onLoading,
    TResult Function(ForgotPasswordResponseModel response)? onSuccess,
    TResult Function(ForgotPasswordTokenModel response)? onTokenSuccess,
    TResult Function(NoDataModel response)? onChangePasswordSuccess,
    TResult Function(String message)? onFailure,
    required TResult orElse(),
  }) {
    if (onSuccess != null) {
      return onSuccess(response);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_onLoading value) onLoading,
    required TResult Function(_onSuccess value) onSuccess,
    required TResult Function(_onTokenSuccess value) onTokenSuccess,
    required TResult Function(_onChangePasswordSuccess value)
        onChangePasswordSuccess,
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
    TResult? Function(_onTokenSuccess value)? onTokenSuccess,
    TResult? Function(_onChangePasswordSuccess value)? onChangePasswordSuccess,
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
    TResult Function(_onTokenSuccess value)? onTokenSuccess,
    TResult Function(_onChangePasswordSuccess value)? onChangePasswordSuccess,
    TResult Function(_onFailure value)? onFailure,
    required TResult orElse(),
  }) {
    if (onSuccess != null) {
      return onSuccess(this);
    }
    return orElse();
  }
}

abstract class _onSuccess implements ForgotPasswordState {
  const factory _onSuccess(final ForgotPasswordResponseModel response) =
      _$onSuccessImpl;

  ForgotPasswordResponseModel get response;
  @JsonKey(ignore: true)
  _$$onSuccessImplCopyWith<_$onSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$onTokenSuccessImplCopyWith<$Res> {
  factory _$$onTokenSuccessImplCopyWith(_$onTokenSuccessImpl value,
          $Res Function(_$onTokenSuccessImpl) then) =
      __$$onTokenSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ForgotPasswordTokenModel response});
}

/// @nodoc
class __$$onTokenSuccessImplCopyWithImpl<$Res>
    extends _$ForgotPasswordStateCopyWithImpl<$Res, _$onTokenSuccessImpl>
    implements _$$onTokenSuccessImplCopyWith<$Res> {
  __$$onTokenSuccessImplCopyWithImpl(
      _$onTokenSuccessImpl _value, $Res Function(_$onTokenSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = null,
  }) {
    return _then(_$onTokenSuccessImpl(
      null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as ForgotPasswordTokenModel,
    ));
  }
}

/// @nodoc

class _$onTokenSuccessImpl implements _onTokenSuccess {
  const _$onTokenSuccessImpl(this.response);

  @override
  final ForgotPasswordTokenModel response;

  @override
  String toString() {
    return 'ForgotPasswordState.onTokenSuccess(response: $response)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$onTokenSuccessImpl &&
            (identical(other.response, response) ||
                other.response == response));
  }

  @override
  int get hashCode => Object.hash(runtimeType, response);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$onTokenSuccessImplCopyWith<_$onTokenSuccessImpl> get copyWith =>
      __$$onTokenSuccessImplCopyWithImpl<_$onTokenSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() onLoading,
    required TResult Function(ForgotPasswordResponseModel response) onSuccess,
    required TResult Function(ForgotPasswordTokenModel response) onTokenSuccess,
    required TResult Function(NoDataModel response) onChangePasswordSuccess,
    required TResult Function(String message) onFailure,
  }) {
    return onTokenSuccess(response);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? onLoading,
    TResult? Function(ForgotPasswordResponseModel response)? onSuccess,
    TResult? Function(ForgotPasswordTokenModel response)? onTokenSuccess,
    TResult? Function(NoDataModel response)? onChangePasswordSuccess,
    TResult? Function(String message)? onFailure,
  }) {
    return onTokenSuccess?.call(response);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onLoading,
    TResult Function(ForgotPasswordResponseModel response)? onSuccess,
    TResult Function(ForgotPasswordTokenModel response)? onTokenSuccess,
    TResult Function(NoDataModel response)? onChangePasswordSuccess,
    TResult Function(String message)? onFailure,
    required TResult orElse(),
  }) {
    if (onTokenSuccess != null) {
      return onTokenSuccess(response);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_onLoading value) onLoading,
    required TResult Function(_onSuccess value) onSuccess,
    required TResult Function(_onTokenSuccess value) onTokenSuccess,
    required TResult Function(_onChangePasswordSuccess value)
        onChangePasswordSuccess,
    required TResult Function(_onFailure value) onFailure,
  }) {
    return onTokenSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_onLoading value)? onLoading,
    TResult? Function(_onSuccess value)? onSuccess,
    TResult? Function(_onTokenSuccess value)? onTokenSuccess,
    TResult? Function(_onChangePasswordSuccess value)? onChangePasswordSuccess,
    TResult? Function(_onFailure value)? onFailure,
  }) {
    return onTokenSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_onLoading value)? onLoading,
    TResult Function(_onSuccess value)? onSuccess,
    TResult Function(_onTokenSuccess value)? onTokenSuccess,
    TResult Function(_onChangePasswordSuccess value)? onChangePasswordSuccess,
    TResult Function(_onFailure value)? onFailure,
    required TResult orElse(),
  }) {
    if (onTokenSuccess != null) {
      return onTokenSuccess(this);
    }
    return orElse();
  }
}

abstract class _onTokenSuccess implements ForgotPasswordState {
  const factory _onTokenSuccess(final ForgotPasswordTokenModel response) =
      _$onTokenSuccessImpl;

  ForgotPasswordTokenModel get response;
  @JsonKey(ignore: true)
  _$$onTokenSuccessImplCopyWith<_$onTokenSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$onChangePasswordSuccessImplCopyWith<$Res> {
  factory _$$onChangePasswordSuccessImplCopyWith(
          _$onChangePasswordSuccessImpl value,
          $Res Function(_$onChangePasswordSuccessImpl) then) =
      __$$onChangePasswordSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({NoDataModel response});
}

/// @nodoc
class __$$onChangePasswordSuccessImplCopyWithImpl<$Res>
    extends _$ForgotPasswordStateCopyWithImpl<$Res,
        _$onChangePasswordSuccessImpl>
    implements _$$onChangePasswordSuccessImplCopyWith<$Res> {
  __$$onChangePasswordSuccessImplCopyWithImpl(
      _$onChangePasswordSuccessImpl _value,
      $Res Function(_$onChangePasswordSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = null,
  }) {
    return _then(_$onChangePasswordSuccessImpl(
      null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as NoDataModel,
    ));
  }
}

/// @nodoc

class _$onChangePasswordSuccessImpl implements _onChangePasswordSuccess {
  const _$onChangePasswordSuccessImpl(this.response);

  @override
  final NoDataModel response;

  @override
  String toString() {
    return 'ForgotPasswordState.onChangePasswordSuccess(response: $response)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$onChangePasswordSuccessImpl &&
            (identical(other.response, response) ||
                other.response == response));
  }

  @override
  int get hashCode => Object.hash(runtimeType, response);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$onChangePasswordSuccessImplCopyWith<_$onChangePasswordSuccessImpl>
      get copyWith => __$$onChangePasswordSuccessImplCopyWithImpl<
          _$onChangePasswordSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() onLoading,
    required TResult Function(ForgotPasswordResponseModel response) onSuccess,
    required TResult Function(ForgotPasswordTokenModel response) onTokenSuccess,
    required TResult Function(NoDataModel response) onChangePasswordSuccess,
    required TResult Function(String message) onFailure,
  }) {
    return onChangePasswordSuccess(response);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? onLoading,
    TResult? Function(ForgotPasswordResponseModel response)? onSuccess,
    TResult? Function(ForgotPasswordTokenModel response)? onTokenSuccess,
    TResult? Function(NoDataModel response)? onChangePasswordSuccess,
    TResult? Function(String message)? onFailure,
  }) {
    return onChangePasswordSuccess?.call(response);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onLoading,
    TResult Function(ForgotPasswordResponseModel response)? onSuccess,
    TResult Function(ForgotPasswordTokenModel response)? onTokenSuccess,
    TResult Function(NoDataModel response)? onChangePasswordSuccess,
    TResult Function(String message)? onFailure,
    required TResult orElse(),
  }) {
    if (onChangePasswordSuccess != null) {
      return onChangePasswordSuccess(response);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_onLoading value) onLoading,
    required TResult Function(_onSuccess value) onSuccess,
    required TResult Function(_onTokenSuccess value) onTokenSuccess,
    required TResult Function(_onChangePasswordSuccess value)
        onChangePasswordSuccess,
    required TResult Function(_onFailure value) onFailure,
  }) {
    return onChangePasswordSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_onLoading value)? onLoading,
    TResult? Function(_onSuccess value)? onSuccess,
    TResult? Function(_onTokenSuccess value)? onTokenSuccess,
    TResult? Function(_onChangePasswordSuccess value)? onChangePasswordSuccess,
    TResult? Function(_onFailure value)? onFailure,
  }) {
    return onChangePasswordSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_onLoading value)? onLoading,
    TResult Function(_onSuccess value)? onSuccess,
    TResult Function(_onTokenSuccess value)? onTokenSuccess,
    TResult Function(_onChangePasswordSuccess value)? onChangePasswordSuccess,
    TResult Function(_onFailure value)? onFailure,
    required TResult orElse(),
  }) {
    if (onChangePasswordSuccess != null) {
      return onChangePasswordSuccess(this);
    }
    return orElse();
  }
}

abstract class _onChangePasswordSuccess implements ForgotPasswordState {
  const factory _onChangePasswordSuccess(final NoDataModel response) =
      _$onChangePasswordSuccessImpl;

  NoDataModel get response;
  @JsonKey(ignore: true)
  _$$onChangePasswordSuccessImplCopyWith<_$onChangePasswordSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
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
    extends _$ForgotPasswordStateCopyWithImpl<$Res, _$onFailureImpl>
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

class _$onFailureImpl implements _onFailure {
  const _$onFailureImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'ForgotPasswordState.onFailure(message: $message)';
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
    required TResult Function(ForgotPasswordResponseModel response) onSuccess,
    required TResult Function(ForgotPasswordTokenModel response) onTokenSuccess,
    required TResult Function(NoDataModel response) onChangePasswordSuccess,
    required TResult Function(String message) onFailure,
  }) {
    return onFailure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? onLoading,
    TResult? Function(ForgotPasswordResponseModel response)? onSuccess,
    TResult? Function(ForgotPasswordTokenModel response)? onTokenSuccess,
    TResult? Function(NoDataModel response)? onChangePasswordSuccess,
    TResult? Function(String message)? onFailure,
  }) {
    return onFailure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onLoading,
    TResult Function(ForgotPasswordResponseModel response)? onSuccess,
    TResult Function(ForgotPasswordTokenModel response)? onTokenSuccess,
    TResult Function(NoDataModel response)? onChangePasswordSuccess,
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
    required TResult Function(_onTokenSuccess value) onTokenSuccess,
    required TResult Function(_onChangePasswordSuccess value)
        onChangePasswordSuccess,
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
    TResult? Function(_onTokenSuccess value)? onTokenSuccess,
    TResult? Function(_onChangePasswordSuccess value)? onChangePasswordSuccess,
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
    TResult Function(_onTokenSuccess value)? onTokenSuccess,
    TResult Function(_onChangePasswordSuccess value)? onChangePasswordSuccess,
    TResult Function(_onFailure value)? onFailure,
    required TResult orElse(),
  }) {
    if (onFailure != null) {
      return onFailure(this);
    }
    return orElse();
  }
}

abstract class _onFailure implements ForgotPasswordState {
  const factory _onFailure(final String message) = _$onFailureImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$onFailureImplCopyWith<_$onFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
