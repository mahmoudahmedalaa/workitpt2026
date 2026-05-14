import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:workitpt/features/wallet/data/models/balance_model.dart';
import 'package:workitpt/features/wallet/data/models/transaction_model.dart';
import 'package:workitpt/features/wallet/data/models/wallet_history_model.dart';
import 'package:workitpt/features/wallet/data/models/withdraw_model.dart';
import 'package:workitpt/features/wallet/domain/controller/i_wallet_controller.dart';

part 'wallet_bloc.freezed.dart';
part 'wallet_event.dart';
part 'wallet_state.dart';

@injectable
class WalletBloc extends Bloc<WalletEvent, WalletState> {
  IWalletController _controller;

  WalletBloc(this._controller) : super(const WalletState.initial()) {
    on<WalletEvent>((event, emit) async {
      emit(const WalletState.onLoading());
      await event.when<FutureOr<void>>(
        withdrawAmount: (model) async {
          try {
            final data = await _controller.withdrawBalance(model);
            data.fold((l) => emit(WalletState.onFailure(l)), (data) {
              emit(WalletState.onWithdrawSuccess(data));
            });
          } on Exception catch (e) {
            emit(WalletState.onFailure(e.toString()));
          }
        },
        getBalance: () async {
          try {
            final data = await _controller.getBalance();
            data.fold((l) => emit(WalletState.onFailure(l)), (data) {
              emit(WalletState.onGetBalanceSuccess(data));
            });
          } on Exception catch (e) {
            emit(WalletState.onFailure(e.toString()));
          }
        },
        getTransactions: () async {
          try {
            final data = await _controller.getTransactions();
            data.fold((l) => emit(WalletState.onFailure(l)), (data) {
              emit(WalletState.onGetTransactionSuccess(data));
            });
          } on Exception catch (e) {
            emit(WalletState.onFailure(e.toString()));
          }
        },
        getWalletHistory: () async {
          try {
            final data = await _controller.getWalletHistory();
            data.fold((l) => emit(WalletState.onFailure(l)), (data) {
              emit(WalletState.onGetWalletHistorySuccess(data));
            });
          } on Exception catch (e) {
            emit(WalletState.onFailure(e.toString()));
          }
        },
      );
    });
  }
}
