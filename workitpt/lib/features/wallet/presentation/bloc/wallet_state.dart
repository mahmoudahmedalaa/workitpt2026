part of 'wallet_bloc.dart';

@freezed
class WalletState with _$WalletState {
  const factory WalletState.initial() = _Initial;
  const factory WalletState.onLoading() = _onLoading;
  const factory WalletState.onGetTransactionSuccess(
      List<TransactionModel> model) = _onGetTransactionSuccess;
  const factory WalletState.onWithdrawSuccess(String message) =
      _onWithdrawSuccess;
  const factory WalletState.onGetBalanceSuccess(BalanceModel model) =
      _onGetBalanceSuccess;
  const factory WalletState.onGetWalletHistorySuccess(
      List<WalletHistoryModel> model) = _onGetWalletHistorySuccess;
  const factory WalletState.onFailure(String? message) = _onFailure;
}
