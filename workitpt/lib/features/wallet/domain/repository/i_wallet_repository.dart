import 'package:dartz/dartz.dart';

import '../../data/models/balance_model.dart';
import '../../data/models/transaction_model.dart';
import '../../data/models/wallet_history_model.dart';
import '../../data/models/withdraw_model.dart';

abstract class IWalletRepository {
  Future<Either<String, List<TransactionModel>>> getTransactions();
  Future<Either<String, BalanceModel>> getBalance();

  Future<Either<String, String>> withdrawBalance(BankDetails model);

  Future<Either<String, List<WalletHistoryModel>>> getWalletHistory();
}
