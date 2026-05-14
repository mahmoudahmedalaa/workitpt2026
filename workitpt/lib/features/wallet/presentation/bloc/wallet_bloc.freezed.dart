// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WalletEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BankDetails model) withdrawAmount,
    required TResult Function() getBalance,
    required TResult Function() getTransactions,
    required TResult Function() getWalletHistory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BankDetails model)? withdrawAmount,
    TResult? Function()? getBalance,
    TResult? Function()? getTransactions,
    TResult? Function()? getWalletHistory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BankDetails model)? withdrawAmount,
    TResult Function()? getBalance,
    TResult Function()? getTransactions,
    TResult Function()? getWalletHistory,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_onWithdrawAmount value) withdrawAmount,
    required TResult Function(_getBalance value) getBalance,
    required TResult Function(_getTransactions value) getTransactions,
    required TResult Function(_getWalletHistory value) getWalletHistory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_onWithdrawAmount value)? withdrawAmount,
    TResult? Function(_getBalance value)? getBalance,
    TResult? Function(_getTransactions value)? getTransactions,
    TResult? Function(_getWalletHistory value)? getWalletHistory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_onWithdrawAmount value)? withdrawAmount,
    TResult Function(_getBalance value)? getBalance,
    TResult Function(_getTransactions value)? getTransactions,
    TResult Function(_getWalletHistory value)? getWalletHistory,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletEventCopyWith<$Res> {
  factory $WalletEventCopyWith(
          WalletEvent value, $Res Function(WalletEvent) then) =
      _$WalletEventCopyWithImpl<$Res, WalletEvent>;
}

/// @nodoc
class _$WalletEventCopyWithImpl<$Res, $Val extends WalletEvent>
    implements $WalletEventCopyWith<$Res> {
  _$WalletEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$onWithdrawAmountImplCopyWith<$Res> {
  factory _$$onWithdrawAmountImplCopyWith(_$onWithdrawAmountImpl value,
          $Res Function(_$onWithdrawAmountImpl) then) =
      __$$onWithdrawAmountImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BankDetails model});
}

/// @nodoc
class __$$onWithdrawAmountImplCopyWithImpl<$Res>
    extends _$WalletEventCopyWithImpl<$Res, _$onWithdrawAmountImpl>
    implements _$$onWithdrawAmountImplCopyWith<$Res> {
  __$$onWithdrawAmountImplCopyWithImpl(_$onWithdrawAmountImpl _value,
      $Res Function(_$onWithdrawAmountImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
  }) {
    return _then(_$onWithdrawAmountImpl(
      null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as BankDetails,
    ));
  }
}

/// @nodoc

class _$onWithdrawAmountImpl implements _onWithdrawAmount {
  const _$onWithdrawAmountImpl(this.model);

  @override
  final BankDetails model;

  @override
  String toString() {
    return 'WalletEvent.withdrawAmount(model: $model)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$onWithdrawAmountImpl &&
            (identical(other.model, model) || other.model == model));
  }

  @override
  int get hashCode => Object.hash(runtimeType, model);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$onWithdrawAmountImplCopyWith<_$onWithdrawAmountImpl> get copyWith =>
      __$$onWithdrawAmountImplCopyWithImpl<_$onWithdrawAmountImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BankDetails model) withdrawAmount,
    required TResult Function() getBalance,
    required TResult Function() getTransactions,
    required TResult Function() getWalletHistory,
  }) {
    return withdrawAmount(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BankDetails model)? withdrawAmount,
    TResult? Function()? getBalance,
    TResult? Function()? getTransactions,
    TResult? Function()? getWalletHistory,
  }) {
    return withdrawAmount?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BankDetails model)? withdrawAmount,
    TResult Function()? getBalance,
    TResult Function()? getTransactions,
    TResult Function()? getWalletHistory,
    required TResult orElse(),
  }) {
    if (withdrawAmount != null) {
      return withdrawAmount(model);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_onWithdrawAmount value) withdrawAmount,
    required TResult Function(_getBalance value) getBalance,
    required TResult Function(_getTransactions value) getTransactions,
    required TResult Function(_getWalletHistory value) getWalletHistory,
  }) {
    return withdrawAmount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_onWithdrawAmount value)? withdrawAmount,
    TResult? Function(_getBalance value)? getBalance,
    TResult? Function(_getTransactions value)? getTransactions,
    TResult? Function(_getWalletHistory value)? getWalletHistory,
  }) {
    return withdrawAmount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_onWithdrawAmount value)? withdrawAmount,
    TResult Function(_getBalance value)? getBalance,
    TResult Function(_getTransactions value)? getTransactions,
    TResult Function(_getWalletHistory value)? getWalletHistory,
    required TResult orElse(),
  }) {
    if (withdrawAmount != null) {
      return withdrawAmount(this);
    }
    return orElse();
  }
}

abstract class _onWithdrawAmount implements WalletEvent {
  const factory _onWithdrawAmount(final BankDetails model) =
      _$onWithdrawAmountImpl;

  BankDetails get model;
  @JsonKey(ignore: true)
  _$$onWithdrawAmountImplCopyWith<_$onWithdrawAmountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$getBalanceImplCopyWith<$Res> {
  factory _$$getBalanceImplCopyWith(
          _$getBalanceImpl value, $Res Function(_$getBalanceImpl) then) =
      __$$getBalanceImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$getBalanceImplCopyWithImpl<$Res>
    extends _$WalletEventCopyWithImpl<$Res, _$getBalanceImpl>
    implements _$$getBalanceImplCopyWith<$Res> {
  __$$getBalanceImplCopyWithImpl(
      _$getBalanceImpl _value, $Res Function(_$getBalanceImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$getBalanceImpl implements _getBalance {
  const _$getBalanceImpl();

  @override
  String toString() {
    return 'WalletEvent.getBalance()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$getBalanceImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BankDetails model) withdrawAmount,
    required TResult Function() getBalance,
    required TResult Function() getTransactions,
    required TResult Function() getWalletHistory,
  }) {
    return getBalance();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BankDetails model)? withdrawAmount,
    TResult? Function()? getBalance,
    TResult? Function()? getTransactions,
    TResult? Function()? getWalletHistory,
  }) {
    return getBalance?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BankDetails model)? withdrawAmount,
    TResult Function()? getBalance,
    TResult Function()? getTransactions,
    TResult Function()? getWalletHistory,
    required TResult orElse(),
  }) {
    if (getBalance != null) {
      return getBalance();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_onWithdrawAmount value) withdrawAmount,
    required TResult Function(_getBalance value) getBalance,
    required TResult Function(_getTransactions value) getTransactions,
    required TResult Function(_getWalletHistory value) getWalletHistory,
  }) {
    return getBalance(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_onWithdrawAmount value)? withdrawAmount,
    TResult? Function(_getBalance value)? getBalance,
    TResult? Function(_getTransactions value)? getTransactions,
    TResult? Function(_getWalletHistory value)? getWalletHistory,
  }) {
    return getBalance?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_onWithdrawAmount value)? withdrawAmount,
    TResult Function(_getBalance value)? getBalance,
    TResult Function(_getTransactions value)? getTransactions,
    TResult Function(_getWalletHistory value)? getWalletHistory,
    required TResult orElse(),
  }) {
    if (getBalance != null) {
      return getBalance(this);
    }
    return orElse();
  }
}

abstract class _getBalance implements WalletEvent {
  const factory _getBalance() = _$getBalanceImpl;
}

/// @nodoc
abstract class _$$getTransactionsImplCopyWith<$Res> {
  factory _$$getTransactionsImplCopyWith(_$getTransactionsImpl value,
          $Res Function(_$getTransactionsImpl) then) =
      __$$getTransactionsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$getTransactionsImplCopyWithImpl<$Res>
    extends _$WalletEventCopyWithImpl<$Res, _$getTransactionsImpl>
    implements _$$getTransactionsImplCopyWith<$Res> {
  __$$getTransactionsImplCopyWithImpl(
      _$getTransactionsImpl _value, $Res Function(_$getTransactionsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$getTransactionsImpl implements _getTransactions {
  const _$getTransactionsImpl();

  @override
  String toString() {
    return 'WalletEvent.getTransactions()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$getTransactionsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BankDetails model) withdrawAmount,
    required TResult Function() getBalance,
    required TResult Function() getTransactions,
    required TResult Function() getWalletHistory,
  }) {
    return getTransactions();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BankDetails model)? withdrawAmount,
    TResult? Function()? getBalance,
    TResult? Function()? getTransactions,
    TResult? Function()? getWalletHistory,
  }) {
    return getTransactions?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BankDetails model)? withdrawAmount,
    TResult Function()? getBalance,
    TResult Function()? getTransactions,
    TResult Function()? getWalletHistory,
    required TResult orElse(),
  }) {
    if (getTransactions != null) {
      return getTransactions();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_onWithdrawAmount value) withdrawAmount,
    required TResult Function(_getBalance value) getBalance,
    required TResult Function(_getTransactions value) getTransactions,
    required TResult Function(_getWalletHistory value) getWalletHistory,
  }) {
    return getTransactions(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_onWithdrawAmount value)? withdrawAmount,
    TResult? Function(_getBalance value)? getBalance,
    TResult? Function(_getTransactions value)? getTransactions,
    TResult? Function(_getWalletHistory value)? getWalletHistory,
  }) {
    return getTransactions?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_onWithdrawAmount value)? withdrawAmount,
    TResult Function(_getBalance value)? getBalance,
    TResult Function(_getTransactions value)? getTransactions,
    TResult Function(_getWalletHistory value)? getWalletHistory,
    required TResult orElse(),
  }) {
    if (getTransactions != null) {
      return getTransactions(this);
    }
    return orElse();
  }
}

abstract class _getTransactions implements WalletEvent {
  const factory _getTransactions() = _$getTransactionsImpl;
}

/// @nodoc
abstract class _$$getWalletHistoryImplCopyWith<$Res> {
  factory _$$getWalletHistoryImplCopyWith(_$getWalletHistoryImpl value,
          $Res Function(_$getWalletHistoryImpl) then) =
      __$$getWalletHistoryImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$getWalletHistoryImplCopyWithImpl<$Res>
    extends _$WalletEventCopyWithImpl<$Res, _$getWalletHistoryImpl>
    implements _$$getWalletHistoryImplCopyWith<$Res> {
  __$$getWalletHistoryImplCopyWithImpl(_$getWalletHistoryImpl _value,
      $Res Function(_$getWalletHistoryImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$getWalletHistoryImpl implements _getWalletHistory {
  const _$getWalletHistoryImpl();

  @override
  String toString() {
    return 'WalletEvent.getWalletHistory()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$getWalletHistoryImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BankDetails model) withdrawAmount,
    required TResult Function() getBalance,
    required TResult Function() getTransactions,
    required TResult Function() getWalletHistory,
  }) {
    return getWalletHistory();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BankDetails model)? withdrawAmount,
    TResult? Function()? getBalance,
    TResult? Function()? getTransactions,
    TResult? Function()? getWalletHistory,
  }) {
    return getWalletHistory?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BankDetails model)? withdrawAmount,
    TResult Function()? getBalance,
    TResult Function()? getTransactions,
    TResult Function()? getWalletHistory,
    required TResult orElse(),
  }) {
    if (getWalletHistory != null) {
      return getWalletHistory();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_onWithdrawAmount value) withdrawAmount,
    required TResult Function(_getBalance value) getBalance,
    required TResult Function(_getTransactions value) getTransactions,
    required TResult Function(_getWalletHistory value) getWalletHistory,
  }) {
    return getWalletHistory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_onWithdrawAmount value)? withdrawAmount,
    TResult? Function(_getBalance value)? getBalance,
    TResult? Function(_getTransactions value)? getTransactions,
    TResult? Function(_getWalletHistory value)? getWalletHistory,
  }) {
    return getWalletHistory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_onWithdrawAmount value)? withdrawAmount,
    TResult Function(_getBalance value)? getBalance,
    TResult Function(_getTransactions value)? getTransactions,
    TResult Function(_getWalletHistory value)? getWalletHistory,
    required TResult orElse(),
  }) {
    if (getWalletHistory != null) {
      return getWalletHistory(this);
    }
    return orElse();
  }
}

abstract class _getWalletHistory implements WalletEvent {
  const factory _getWalletHistory() = _$getWalletHistoryImpl;
}

/// @nodoc
mixin _$WalletState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() onLoading,
    required TResult Function(List<TransactionModel> model)
        onGetTransactionSuccess,
    required TResult Function(String message) onWithdrawSuccess,
    required TResult Function(BalanceModel model) onGetBalanceSuccess,
    required TResult Function(List<WalletHistoryModel> model)
        onGetWalletHistorySuccess,
    required TResult Function(String? message) onFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? onLoading,
    TResult? Function(List<TransactionModel> model)? onGetTransactionSuccess,
    TResult? Function(String message)? onWithdrawSuccess,
    TResult? Function(BalanceModel model)? onGetBalanceSuccess,
    TResult? Function(List<WalletHistoryModel> model)?
        onGetWalletHistorySuccess,
    TResult? Function(String? message)? onFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onLoading,
    TResult Function(List<TransactionModel> model)? onGetTransactionSuccess,
    TResult Function(String message)? onWithdrawSuccess,
    TResult Function(BalanceModel model)? onGetBalanceSuccess,
    TResult Function(List<WalletHistoryModel> model)? onGetWalletHistorySuccess,
    TResult Function(String? message)? onFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_onLoading value) onLoading,
    required TResult Function(_onGetTransactionSuccess value)
        onGetTransactionSuccess,
    required TResult Function(_onWithdrawSuccess value) onWithdrawSuccess,
    required TResult Function(_onGetBalanceSuccess value) onGetBalanceSuccess,
    required TResult Function(_onGetWalletHistorySuccess value)
        onGetWalletHistorySuccess,
    required TResult Function(_onFailure value) onFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_onLoading value)? onLoading,
    TResult? Function(_onGetTransactionSuccess value)? onGetTransactionSuccess,
    TResult? Function(_onWithdrawSuccess value)? onWithdrawSuccess,
    TResult? Function(_onGetBalanceSuccess value)? onGetBalanceSuccess,
    TResult? Function(_onGetWalletHistorySuccess value)?
        onGetWalletHistorySuccess,
    TResult? Function(_onFailure value)? onFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_onLoading value)? onLoading,
    TResult Function(_onGetTransactionSuccess value)? onGetTransactionSuccess,
    TResult Function(_onWithdrawSuccess value)? onWithdrawSuccess,
    TResult Function(_onGetBalanceSuccess value)? onGetBalanceSuccess,
    TResult Function(_onGetWalletHistorySuccess value)?
        onGetWalletHistorySuccess,
    TResult Function(_onFailure value)? onFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletStateCopyWith<$Res> {
  factory $WalletStateCopyWith(
          WalletState value, $Res Function(WalletState) then) =
      _$WalletStateCopyWithImpl<$Res, WalletState>;
}

/// @nodoc
class _$WalletStateCopyWithImpl<$Res, $Val extends WalletState>
    implements $WalletStateCopyWith<$Res> {
  _$WalletStateCopyWithImpl(this._value, this._then);

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
    extends _$WalletStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'WalletState.initial()';
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
    required TResult Function(List<TransactionModel> model)
        onGetTransactionSuccess,
    required TResult Function(String message) onWithdrawSuccess,
    required TResult Function(BalanceModel model) onGetBalanceSuccess,
    required TResult Function(List<WalletHistoryModel> model)
        onGetWalletHistorySuccess,
    required TResult Function(String? message) onFailure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? onLoading,
    TResult? Function(List<TransactionModel> model)? onGetTransactionSuccess,
    TResult? Function(String message)? onWithdrawSuccess,
    TResult? Function(BalanceModel model)? onGetBalanceSuccess,
    TResult? Function(List<WalletHistoryModel> model)?
        onGetWalletHistorySuccess,
    TResult? Function(String? message)? onFailure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onLoading,
    TResult Function(List<TransactionModel> model)? onGetTransactionSuccess,
    TResult Function(String message)? onWithdrawSuccess,
    TResult Function(BalanceModel model)? onGetBalanceSuccess,
    TResult Function(List<WalletHistoryModel> model)? onGetWalletHistorySuccess,
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
    required TResult Function(_onGetTransactionSuccess value)
        onGetTransactionSuccess,
    required TResult Function(_onWithdrawSuccess value) onWithdrawSuccess,
    required TResult Function(_onGetBalanceSuccess value) onGetBalanceSuccess,
    required TResult Function(_onGetWalletHistorySuccess value)
        onGetWalletHistorySuccess,
    required TResult Function(_onFailure value) onFailure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_onLoading value)? onLoading,
    TResult? Function(_onGetTransactionSuccess value)? onGetTransactionSuccess,
    TResult? Function(_onWithdrawSuccess value)? onWithdrawSuccess,
    TResult? Function(_onGetBalanceSuccess value)? onGetBalanceSuccess,
    TResult? Function(_onGetWalletHistorySuccess value)?
        onGetWalletHistorySuccess,
    TResult? Function(_onFailure value)? onFailure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_onLoading value)? onLoading,
    TResult Function(_onGetTransactionSuccess value)? onGetTransactionSuccess,
    TResult Function(_onWithdrawSuccess value)? onWithdrawSuccess,
    TResult Function(_onGetBalanceSuccess value)? onGetBalanceSuccess,
    TResult Function(_onGetWalletHistorySuccess value)?
        onGetWalletHistorySuccess,
    TResult Function(_onFailure value)? onFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements WalletState {
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
    extends _$WalletStateCopyWithImpl<$Res, _$onLoadingImpl>
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
    return 'WalletState.onLoading()';
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
    required TResult Function(List<TransactionModel> model)
        onGetTransactionSuccess,
    required TResult Function(String message) onWithdrawSuccess,
    required TResult Function(BalanceModel model) onGetBalanceSuccess,
    required TResult Function(List<WalletHistoryModel> model)
        onGetWalletHistorySuccess,
    required TResult Function(String? message) onFailure,
  }) {
    return onLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? onLoading,
    TResult? Function(List<TransactionModel> model)? onGetTransactionSuccess,
    TResult? Function(String message)? onWithdrawSuccess,
    TResult? Function(BalanceModel model)? onGetBalanceSuccess,
    TResult? Function(List<WalletHistoryModel> model)?
        onGetWalletHistorySuccess,
    TResult? Function(String? message)? onFailure,
  }) {
    return onLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onLoading,
    TResult Function(List<TransactionModel> model)? onGetTransactionSuccess,
    TResult Function(String message)? onWithdrawSuccess,
    TResult Function(BalanceModel model)? onGetBalanceSuccess,
    TResult Function(List<WalletHistoryModel> model)? onGetWalletHistorySuccess,
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
    required TResult Function(_onGetTransactionSuccess value)
        onGetTransactionSuccess,
    required TResult Function(_onWithdrawSuccess value) onWithdrawSuccess,
    required TResult Function(_onGetBalanceSuccess value) onGetBalanceSuccess,
    required TResult Function(_onGetWalletHistorySuccess value)
        onGetWalletHistorySuccess,
    required TResult Function(_onFailure value) onFailure,
  }) {
    return onLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_onLoading value)? onLoading,
    TResult? Function(_onGetTransactionSuccess value)? onGetTransactionSuccess,
    TResult? Function(_onWithdrawSuccess value)? onWithdrawSuccess,
    TResult? Function(_onGetBalanceSuccess value)? onGetBalanceSuccess,
    TResult? Function(_onGetWalletHistorySuccess value)?
        onGetWalletHistorySuccess,
    TResult? Function(_onFailure value)? onFailure,
  }) {
    return onLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_onLoading value)? onLoading,
    TResult Function(_onGetTransactionSuccess value)? onGetTransactionSuccess,
    TResult Function(_onWithdrawSuccess value)? onWithdrawSuccess,
    TResult Function(_onGetBalanceSuccess value)? onGetBalanceSuccess,
    TResult Function(_onGetWalletHistorySuccess value)?
        onGetWalletHistorySuccess,
    TResult Function(_onFailure value)? onFailure,
    required TResult orElse(),
  }) {
    if (onLoading != null) {
      return onLoading(this);
    }
    return orElse();
  }
}

abstract class _onLoading implements WalletState {
  const factory _onLoading() = _$onLoadingImpl;
}

/// @nodoc
abstract class _$$onGetTransactionSuccessImplCopyWith<$Res> {
  factory _$$onGetTransactionSuccessImplCopyWith(
          _$onGetTransactionSuccessImpl value,
          $Res Function(_$onGetTransactionSuccessImpl) then) =
      __$$onGetTransactionSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<TransactionModel> model});
}

/// @nodoc
class __$$onGetTransactionSuccessImplCopyWithImpl<$Res>
    extends _$WalletStateCopyWithImpl<$Res, _$onGetTransactionSuccessImpl>
    implements _$$onGetTransactionSuccessImplCopyWith<$Res> {
  __$$onGetTransactionSuccessImplCopyWithImpl(
      _$onGetTransactionSuccessImpl _value,
      $Res Function(_$onGetTransactionSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
  }) {
    return _then(_$onGetTransactionSuccessImpl(
      null == model
          ? _value._model
          : model // ignore: cast_nullable_to_non_nullable
              as List<TransactionModel>,
    ));
  }
}

/// @nodoc

class _$onGetTransactionSuccessImpl implements _onGetTransactionSuccess {
  const _$onGetTransactionSuccessImpl(final List<TransactionModel> model)
      : _model = model;

  final List<TransactionModel> _model;
  @override
  List<TransactionModel> get model {
    if (_model is EqualUnmodifiableListView) return _model;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_model);
  }

  @override
  String toString() {
    return 'WalletState.onGetTransactionSuccess(model: $model)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$onGetTransactionSuccessImpl &&
            const DeepCollectionEquality().equals(other._model, _model));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_model));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$onGetTransactionSuccessImplCopyWith<_$onGetTransactionSuccessImpl>
      get copyWith => __$$onGetTransactionSuccessImplCopyWithImpl<
          _$onGetTransactionSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() onLoading,
    required TResult Function(List<TransactionModel> model)
        onGetTransactionSuccess,
    required TResult Function(String message) onWithdrawSuccess,
    required TResult Function(BalanceModel model) onGetBalanceSuccess,
    required TResult Function(List<WalletHistoryModel> model)
        onGetWalletHistorySuccess,
    required TResult Function(String? message) onFailure,
  }) {
    return onGetTransactionSuccess(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? onLoading,
    TResult? Function(List<TransactionModel> model)? onGetTransactionSuccess,
    TResult? Function(String message)? onWithdrawSuccess,
    TResult? Function(BalanceModel model)? onGetBalanceSuccess,
    TResult? Function(List<WalletHistoryModel> model)?
        onGetWalletHistorySuccess,
    TResult? Function(String? message)? onFailure,
  }) {
    return onGetTransactionSuccess?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onLoading,
    TResult Function(List<TransactionModel> model)? onGetTransactionSuccess,
    TResult Function(String message)? onWithdrawSuccess,
    TResult Function(BalanceModel model)? onGetBalanceSuccess,
    TResult Function(List<WalletHistoryModel> model)? onGetWalletHistorySuccess,
    TResult Function(String? message)? onFailure,
    required TResult orElse(),
  }) {
    if (onGetTransactionSuccess != null) {
      return onGetTransactionSuccess(model);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_onLoading value) onLoading,
    required TResult Function(_onGetTransactionSuccess value)
        onGetTransactionSuccess,
    required TResult Function(_onWithdrawSuccess value) onWithdrawSuccess,
    required TResult Function(_onGetBalanceSuccess value) onGetBalanceSuccess,
    required TResult Function(_onGetWalletHistorySuccess value)
        onGetWalletHistorySuccess,
    required TResult Function(_onFailure value) onFailure,
  }) {
    return onGetTransactionSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_onLoading value)? onLoading,
    TResult? Function(_onGetTransactionSuccess value)? onGetTransactionSuccess,
    TResult? Function(_onWithdrawSuccess value)? onWithdrawSuccess,
    TResult? Function(_onGetBalanceSuccess value)? onGetBalanceSuccess,
    TResult? Function(_onGetWalletHistorySuccess value)?
        onGetWalletHistorySuccess,
    TResult? Function(_onFailure value)? onFailure,
  }) {
    return onGetTransactionSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_onLoading value)? onLoading,
    TResult Function(_onGetTransactionSuccess value)? onGetTransactionSuccess,
    TResult Function(_onWithdrawSuccess value)? onWithdrawSuccess,
    TResult Function(_onGetBalanceSuccess value)? onGetBalanceSuccess,
    TResult Function(_onGetWalletHistorySuccess value)?
        onGetWalletHistorySuccess,
    TResult Function(_onFailure value)? onFailure,
    required TResult orElse(),
  }) {
    if (onGetTransactionSuccess != null) {
      return onGetTransactionSuccess(this);
    }
    return orElse();
  }
}

abstract class _onGetTransactionSuccess implements WalletState {
  const factory _onGetTransactionSuccess(final List<TransactionModel> model) =
      _$onGetTransactionSuccessImpl;

  List<TransactionModel> get model;
  @JsonKey(ignore: true)
  _$$onGetTransactionSuccessImplCopyWith<_$onGetTransactionSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$onWithdrawSuccessImplCopyWith<$Res> {
  factory _$$onWithdrawSuccessImplCopyWith(_$onWithdrawSuccessImpl value,
          $Res Function(_$onWithdrawSuccessImpl) then) =
      __$$onWithdrawSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$onWithdrawSuccessImplCopyWithImpl<$Res>
    extends _$WalletStateCopyWithImpl<$Res, _$onWithdrawSuccessImpl>
    implements _$$onWithdrawSuccessImplCopyWith<$Res> {
  __$$onWithdrawSuccessImplCopyWithImpl(_$onWithdrawSuccessImpl _value,
      $Res Function(_$onWithdrawSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$onWithdrawSuccessImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$onWithdrawSuccessImpl implements _onWithdrawSuccess {
  const _$onWithdrawSuccessImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'WalletState.onWithdrawSuccess(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$onWithdrawSuccessImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$onWithdrawSuccessImplCopyWith<_$onWithdrawSuccessImpl> get copyWith =>
      __$$onWithdrawSuccessImplCopyWithImpl<_$onWithdrawSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() onLoading,
    required TResult Function(List<TransactionModel> model)
        onGetTransactionSuccess,
    required TResult Function(String message) onWithdrawSuccess,
    required TResult Function(BalanceModel model) onGetBalanceSuccess,
    required TResult Function(List<WalletHistoryModel> model)
        onGetWalletHistorySuccess,
    required TResult Function(String? message) onFailure,
  }) {
    return onWithdrawSuccess(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? onLoading,
    TResult? Function(List<TransactionModel> model)? onGetTransactionSuccess,
    TResult? Function(String message)? onWithdrawSuccess,
    TResult? Function(BalanceModel model)? onGetBalanceSuccess,
    TResult? Function(List<WalletHistoryModel> model)?
        onGetWalletHistorySuccess,
    TResult? Function(String? message)? onFailure,
  }) {
    return onWithdrawSuccess?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onLoading,
    TResult Function(List<TransactionModel> model)? onGetTransactionSuccess,
    TResult Function(String message)? onWithdrawSuccess,
    TResult Function(BalanceModel model)? onGetBalanceSuccess,
    TResult Function(List<WalletHistoryModel> model)? onGetWalletHistorySuccess,
    TResult Function(String? message)? onFailure,
    required TResult orElse(),
  }) {
    if (onWithdrawSuccess != null) {
      return onWithdrawSuccess(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_onLoading value) onLoading,
    required TResult Function(_onGetTransactionSuccess value)
        onGetTransactionSuccess,
    required TResult Function(_onWithdrawSuccess value) onWithdrawSuccess,
    required TResult Function(_onGetBalanceSuccess value) onGetBalanceSuccess,
    required TResult Function(_onGetWalletHistorySuccess value)
        onGetWalletHistorySuccess,
    required TResult Function(_onFailure value) onFailure,
  }) {
    return onWithdrawSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_onLoading value)? onLoading,
    TResult? Function(_onGetTransactionSuccess value)? onGetTransactionSuccess,
    TResult? Function(_onWithdrawSuccess value)? onWithdrawSuccess,
    TResult? Function(_onGetBalanceSuccess value)? onGetBalanceSuccess,
    TResult? Function(_onGetWalletHistorySuccess value)?
        onGetWalletHistorySuccess,
    TResult? Function(_onFailure value)? onFailure,
  }) {
    return onWithdrawSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_onLoading value)? onLoading,
    TResult Function(_onGetTransactionSuccess value)? onGetTransactionSuccess,
    TResult Function(_onWithdrawSuccess value)? onWithdrawSuccess,
    TResult Function(_onGetBalanceSuccess value)? onGetBalanceSuccess,
    TResult Function(_onGetWalletHistorySuccess value)?
        onGetWalletHistorySuccess,
    TResult Function(_onFailure value)? onFailure,
    required TResult orElse(),
  }) {
    if (onWithdrawSuccess != null) {
      return onWithdrawSuccess(this);
    }
    return orElse();
  }
}

abstract class _onWithdrawSuccess implements WalletState {
  const factory _onWithdrawSuccess(final String message) =
      _$onWithdrawSuccessImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$onWithdrawSuccessImplCopyWith<_$onWithdrawSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$onGetBalanceSuccessImplCopyWith<$Res> {
  factory _$$onGetBalanceSuccessImplCopyWith(_$onGetBalanceSuccessImpl value,
          $Res Function(_$onGetBalanceSuccessImpl) then) =
      __$$onGetBalanceSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BalanceModel model});
}

/// @nodoc
class __$$onGetBalanceSuccessImplCopyWithImpl<$Res>
    extends _$WalletStateCopyWithImpl<$Res, _$onGetBalanceSuccessImpl>
    implements _$$onGetBalanceSuccessImplCopyWith<$Res> {
  __$$onGetBalanceSuccessImplCopyWithImpl(_$onGetBalanceSuccessImpl _value,
      $Res Function(_$onGetBalanceSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
  }) {
    return _then(_$onGetBalanceSuccessImpl(
      null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as BalanceModel,
    ));
  }
}

/// @nodoc

class _$onGetBalanceSuccessImpl implements _onGetBalanceSuccess {
  const _$onGetBalanceSuccessImpl(this.model);

  @override
  final BalanceModel model;

  @override
  String toString() {
    return 'WalletState.onGetBalanceSuccess(model: $model)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$onGetBalanceSuccessImpl &&
            (identical(other.model, model) || other.model == model));
  }

  @override
  int get hashCode => Object.hash(runtimeType, model);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$onGetBalanceSuccessImplCopyWith<_$onGetBalanceSuccessImpl> get copyWith =>
      __$$onGetBalanceSuccessImplCopyWithImpl<_$onGetBalanceSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() onLoading,
    required TResult Function(List<TransactionModel> model)
        onGetTransactionSuccess,
    required TResult Function(String message) onWithdrawSuccess,
    required TResult Function(BalanceModel model) onGetBalanceSuccess,
    required TResult Function(List<WalletHistoryModel> model)
        onGetWalletHistorySuccess,
    required TResult Function(String? message) onFailure,
  }) {
    return onGetBalanceSuccess(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? onLoading,
    TResult? Function(List<TransactionModel> model)? onGetTransactionSuccess,
    TResult? Function(String message)? onWithdrawSuccess,
    TResult? Function(BalanceModel model)? onGetBalanceSuccess,
    TResult? Function(List<WalletHistoryModel> model)?
        onGetWalletHistorySuccess,
    TResult? Function(String? message)? onFailure,
  }) {
    return onGetBalanceSuccess?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onLoading,
    TResult Function(List<TransactionModel> model)? onGetTransactionSuccess,
    TResult Function(String message)? onWithdrawSuccess,
    TResult Function(BalanceModel model)? onGetBalanceSuccess,
    TResult Function(List<WalletHistoryModel> model)? onGetWalletHistorySuccess,
    TResult Function(String? message)? onFailure,
    required TResult orElse(),
  }) {
    if (onGetBalanceSuccess != null) {
      return onGetBalanceSuccess(model);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_onLoading value) onLoading,
    required TResult Function(_onGetTransactionSuccess value)
        onGetTransactionSuccess,
    required TResult Function(_onWithdrawSuccess value) onWithdrawSuccess,
    required TResult Function(_onGetBalanceSuccess value) onGetBalanceSuccess,
    required TResult Function(_onGetWalletHistorySuccess value)
        onGetWalletHistorySuccess,
    required TResult Function(_onFailure value) onFailure,
  }) {
    return onGetBalanceSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_onLoading value)? onLoading,
    TResult? Function(_onGetTransactionSuccess value)? onGetTransactionSuccess,
    TResult? Function(_onWithdrawSuccess value)? onWithdrawSuccess,
    TResult? Function(_onGetBalanceSuccess value)? onGetBalanceSuccess,
    TResult? Function(_onGetWalletHistorySuccess value)?
        onGetWalletHistorySuccess,
    TResult? Function(_onFailure value)? onFailure,
  }) {
    return onGetBalanceSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_onLoading value)? onLoading,
    TResult Function(_onGetTransactionSuccess value)? onGetTransactionSuccess,
    TResult Function(_onWithdrawSuccess value)? onWithdrawSuccess,
    TResult Function(_onGetBalanceSuccess value)? onGetBalanceSuccess,
    TResult Function(_onGetWalletHistorySuccess value)?
        onGetWalletHistorySuccess,
    TResult Function(_onFailure value)? onFailure,
    required TResult orElse(),
  }) {
    if (onGetBalanceSuccess != null) {
      return onGetBalanceSuccess(this);
    }
    return orElse();
  }
}

abstract class _onGetBalanceSuccess implements WalletState {
  const factory _onGetBalanceSuccess(final BalanceModel model) =
      _$onGetBalanceSuccessImpl;

  BalanceModel get model;
  @JsonKey(ignore: true)
  _$$onGetBalanceSuccessImplCopyWith<_$onGetBalanceSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$onGetWalletHistorySuccessImplCopyWith<$Res> {
  factory _$$onGetWalletHistorySuccessImplCopyWith(
          _$onGetWalletHistorySuccessImpl value,
          $Res Function(_$onGetWalletHistorySuccessImpl) then) =
      __$$onGetWalletHistorySuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<WalletHistoryModel> model});
}

/// @nodoc
class __$$onGetWalletHistorySuccessImplCopyWithImpl<$Res>
    extends _$WalletStateCopyWithImpl<$Res, _$onGetWalletHistorySuccessImpl>
    implements _$$onGetWalletHistorySuccessImplCopyWith<$Res> {
  __$$onGetWalletHistorySuccessImplCopyWithImpl(
      _$onGetWalletHistorySuccessImpl _value,
      $Res Function(_$onGetWalletHistorySuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
  }) {
    return _then(_$onGetWalletHistorySuccessImpl(
      null == model
          ? _value._model
          : model // ignore: cast_nullable_to_non_nullable
              as List<WalletHistoryModel>,
    ));
  }
}

/// @nodoc

class _$onGetWalletHistorySuccessImpl implements _onGetWalletHistorySuccess {
  const _$onGetWalletHistorySuccessImpl(final List<WalletHistoryModel> model)
      : _model = model;

  final List<WalletHistoryModel> _model;
  @override
  List<WalletHistoryModel> get model {
    if (_model is EqualUnmodifiableListView) return _model;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_model);
  }

  @override
  String toString() {
    return 'WalletState.onGetWalletHistorySuccess(model: $model)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$onGetWalletHistorySuccessImpl &&
            const DeepCollectionEquality().equals(other._model, _model));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_model));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$onGetWalletHistorySuccessImplCopyWith<_$onGetWalletHistorySuccessImpl>
      get copyWith => __$$onGetWalletHistorySuccessImplCopyWithImpl<
          _$onGetWalletHistorySuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() onLoading,
    required TResult Function(List<TransactionModel> model)
        onGetTransactionSuccess,
    required TResult Function(String message) onWithdrawSuccess,
    required TResult Function(BalanceModel model) onGetBalanceSuccess,
    required TResult Function(List<WalletHistoryModel> model)
        onGetWalletHistorySuccess,
    required TResult Function(String? message) onFailure,
  }) {
    return onGetWalletHistorySuccess(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? onLoading,
    TResult? Function(List<TransactionModel> model)? onGetTransactionSuccess,
    TResult? Function(String message)? onWithdrawSuccess,
    TResult? Function(BalanceModel model)? onGetBalanceSuccess,
    TResult? Function(List<WalletHistoryModel> model)?
        onGetWalletHistorySuccess,
    TResult? Function(String? message)? onFailure,
  }) {
    return onGetWalletHistorySuccess?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onLoading,
    TResult Function(List<TransactionModel> model)? onGetTransactionSuccess,
    TResult Function(String message)? onWithdrawSuccess,
    TResult Function(BalanceModel model)? onGetBalanceSuccess,
    TResult Function(List<WalletHistoryModel> model)? onGetWalletHistorySuccess,
    TResult Function(String? message)? onFailure,
    required TResult orElse(),
  }) {
    if (onGetWalletHistorySuccess != null) {
      return onGetWalletHistorySuccess(model);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_onLoading value) onLoading,
    required TResult Function(_onGetTransactionSuccess value)
        onGetTransactionSuccess,
    required TResult Function(_onWithdrawSuccess value) onWithdrawSuccess,
    required TResult Function(_onGetBalanceSuccess value) onGetBalanceSuccess,
    required TResult Function(_onGetWalletHistorySuccess value)
        onGetWalletHistorySuccess,
    required TResult Function(_onFailure value) onFailure,
  }) {
    return onGetWalletHistorySuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_onLoading value)? onLoading,
    TResult? Function(_onGetTransactionSuccess value)? onGetTransactionSuccess,
    TResult? Function(_onWithdrawSuccess value)? onWithdrawSuccess,
    TResult? Function(_onGetBalanceSuccess value)? onGetBalanceSuccess,
    TResult? Function(_onGetWalletHistorySuccess value)?
        onGetWalletHistorySuccess,
    TResult? Function(_onFailure value)? onFailure,
  }) {
    return onGetWalletHistorySuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_onLoading value)? onLoading,
    TResult Function(_onGetTransactionSuccess value)? onGetTransactionSuccess,
    TResult Function(_onWithdrawSuccess value)? onWithdrawSuccess,
    TResult Function(_onGetBalanceSuccess value)? onGetBalanceSuccess,
    TResult Function(_onGetWalletHistorySuccess value)?
        onGetWalletHistorySuccess,
    TResult Function(_onFailure value)? onFailure,
    required TResult orElse(),
  }) {
    if (onGetWalletHistorySuccess != null) {
      return onGetWalletHistorySuccess(this);
    }
    return orElse();
  }
}

abstract class _onGetWalletHistorySuccess implements WalletState {
  const factory _onGetWalletHistorySuccess(
      final List<WalletHistoryModel> model) = _$onGetWalletHistorySuccessImpl;

  List<WalletHistoryModel> get model;
  @JsonKey(ignore: true)
  _$$onGetWalletHistorySuccessImplCopyWith<_$onGetWalletHistorySuccessImpl>
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
    extends _$WalletStateCopyWithImpl<$Res, _$onFailureImpl>
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
    return 'WalletState.onFailure(message: $message)';
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
    required TResult Function(List<TransactionModel> model)
        onGetTransactionSuccess,
    required TResult Function(String message) onWithdrawSuccess,
    required TResult Function(BalanceModel model) onGetBalanceSuccess,
    required TResult Function(List<WalletHistoryModel> model)
        onGetWalletHistorySuccess,
    required TResult Function(String? message) onFailure,
  }) {
    return onFailure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? onLoading,
    TResult? Function(List<TransactionModel> model)? onGetTransactionSuccess,
    TResult? Function(String message)? onWithdrawSuccess,
    TResult? Function(BalanceModel model)? onGetBalanceSuccess,
    TResult? Function(List<WalletHistoryModel> model)?
        onGetWalletHistorySuccess,
    TResult? Function(String? message)? onFailure,
  }) {
    return onFailure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onLoading,
    TResult Function(List<TransactionModel> model)? onGetTransactionSuccess,
    TResult Function(String message)? onWithdrawSuccess,
    TResult Function(BalanceModel model)? onGetBalanceSuccess,
    TResult Function(List<WalletHistoryModel> model)? onGetWalletHistorySuccess,
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
    required TResult Function(_onGetTransactionSuccess value)
        onGetTransactionSuccess,
    required TResult Function(_onWithdrawSuccess value) onWithdrawSuccess,
    required TResult Function(_onGetBalanceSuccess value) onGetBalanceSuccess,
    required TResult Function(_onGetWalletHistorySuccess value)
        onGetWalletHistorySuccess,
    required TResult Function(_onFailure value) onFailure,
  }) {
    return onFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_onLoading value)? onLoading,
    TResult? Function(_onGetTransactionSuccess value)? onGetTransactionSuccess,
    TResult? Function(_onWithdrawSuccess value)? onWithdrawSuccess,
    TResult? Function(_onGetBalanceSuccess value)? onGetBalanceSuccess,
    TResult? Function(_onGetWalletHistorySuccess value)?
        onGetWalletHistorySuccess,
    TResult? Function(_onFailure value)? onFailure,
  }) {
    return onFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_onLoading value)? onLoading,
    TResult Function(_onGetTransactionSuccess value)? onGetTransactionSuccess,
    TResult Function(_onWithdrawSuccess value)? onWithdrawSuccess,
    TResult Function(_onGetBalanceSuccess value)? onGetBalanceSuccess,
    TResult Function(_onGetWalletHistorySuccess value)?
        onGetWalletHistorySuccess,
    TResult Function(_onFailure value)? onFailure,
    required TResult orElse(),
  }) {
    if (onFailure != null) {
      return onFailure(this);
    }
    return orElse();
  }
}

abstract class _onFailure implements WalletState {
  const factory _onFailure(final String? message) = _$onFailureImpl;

  String? get message;
  @JsonKey(ignore: true)
  _$$onFailureImplCopyWith<_$onFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
