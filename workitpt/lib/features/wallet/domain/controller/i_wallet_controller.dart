import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:workitpt/features/wallet/data/models/transaction_model.dart';
import 'package:workitpt/features/wallet/data/models/wallet_history_model.dart';
import 'package:workitpt/features/wallet/data/models/withdraw_model.dart';

import '../../data/models/balance_model.dart';
import '../repository/i_wallet_repository.dart';

abstract class IWalletController {
  Future<Either<String, List<TransactionModel>>> getTransactions();

  Future<Either<String, BalanceModel>> getBalance();

  Future<Either<String, String>> withdrawBalance(BankDetails model);

  Future<Either<String, List<WalletHistoryModel>>> getWalletHistory();
}

@Injectable(as: IWalletController)
class WalletController extends IWalletController {
  final IWalletRepository _repository;

  WalletController(this._repository);

  @override
  Future<Either<String, List<TransactionModel>>> getTransactions() async {
    final response = await _repository.getTransactions();
    return response;
  }

  @override
  Future<Either<String, BalanceModel>> getBalance() {
    final response = _repository.getBalance();
    return response;
  }

  Future<Either<String, String>> withdrawBalance(BankDetails model) {
    final response = _repository.withdrawBalance(model);
    return response;
  }

  @override
  Future<Either<String, List<WalletHistoryModel>>> getWalletHistory() {
    final response = _repository.getWalletHistory();
    return response;
  }
}
