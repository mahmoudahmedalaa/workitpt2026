part of 'wallet_bloc.dart';

@freezed
class WalletEvent with _$WalletEvent {
  const factory WalletEvent.withdrawAmount(BankDetails model) =
      _onWithdrawAmount;
  const factory WalletEvent.getBalance() = _getBalance;
  const factory WalletEvent.getTransactions() = _getTransactions;
  const factory WalletEvent.getWalletHistory() = _getWalletHistory;
}
