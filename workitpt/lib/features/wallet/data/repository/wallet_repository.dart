import 'package:dartz/dartz.dart';
import 'package:flutter_rest_client/flutter_rest_client.dart';
import 'package:injectable/injectable.dart';
import 'package:workitpt/core/utils/app_utils.dart';
import 'package:workitpt/features/wallet/data/models/wallet_history_model.dart';
import 'package:workitpt/features/wallet/data/requests/balance_endpoint.dart';
import 'package:workitpt/features/wallet/data/requests/wallet_history_endpoint.dart';
import 'package:workitpt/features/wallet/data/requests/withdraw_endpoint.dart';
import 'package:workitpt/features/wallet/domain/repository/i_wallet_repository.dart';

import '../../../authentication/signup/data/models/common_model.dart';
import '../models/balance_model.dart';
import '../models/transaction_model.dart';
import '../models/withdraw_model.dart';
import '../requests/transaction_endpoint.dart';

@Injectable(as: IWalletRepository)
class WalletRepository extends IWalletRepository {
  final IHttpHelper _iHttpHelper;

  WalletRepository(this._iHttpHelper);

  @override
  Future<Either<String, List<TransactionModel>>> getTransactions() async {
    try {
      final response = await _iHttpHelper.request(
          GetTransactionsEndPoint(), BaseRequestModel());
      if (response != null) {
        final model = CommonModel<List<TransactionModel>>.fromJson(
            response as Map<String, dynamic>,
            (data) => ArrayfromJson<TransactionModel>(
                data as List<dynamic>, TransactionModel.fromJson));
        return model.ok ? right(model.data!) : left(model.message!);
      } else {
        return left('Something went wrong');
      }
    } on Exception catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, BalanceModel>> getBalance() async {
    try {
      final response =
          await _iHttpHelper.request(GetBalanceEndPoint(), BaseRequestModel());
      if (response != null) {
        final model = CommonModel<BalanceModel>.fromJson(
            response as Map<String, dynamic>,
            (data) => BalanceModel.fromJson(data as Map<String, dynamic>));
        return model.ok ? right(model.data!) : left(model.message!);
      } else {
        return left('Something went wrong');
      }
    } on Exception catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, String>> withdrawBalance(BankDetails model) async {
    try {
      final response = await _iHttpHelper.request(WithdrawEndPoint(), model);
      if (response != null) {
        final model = CommonModel.fromJson(
            response as Map<String, dynamic>, (data) => null);

        return model.ok
            ? right(
                'Amount withdraw request has been sent to admin, you will receive this amount once it is approved within 1 to 2 business days')
            : left(model.message!);
      } else {
        return left('Something went wrong');
      }
    } on Exception catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, List<WalletHistoryModel>>> getWalletHistory() async {
    try {
      final response = await _iHttpHelper.request(
          WalletHistoryEndpoint(), BaseRequestModel());
      if (response != null) {
        final model = CommonModel<List<WalletHistoryModel>>.fromJson(
            response as Map<String, dynamic>,
            (data) => ArrayfromJson<WalletHistoryModel>(
                data as List<dynamic>, WalletHistoryModel.fromJson));
        return model.ok ? right(model.data!) : left(model.message!);
      } else {
        return left('Something went wrong');
      }
    } on Exception catch (e) {
      return left(e.toString());
    }
  }
}
