import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:workitpt/features/payment/data/models/card_model.dart';
import 'package:workitpt/features/payment/data/models/checkout_card_model.dart';
import 'package:workitpt/features/payment/domain/controller/i_payment_controller.dart';

import '../../data/models/add_card_model.dart';
import '../../data/models/get_payment_link_model.dart';

part 'payment_bloc.freezed.dart';
part 'payment_event.dart';
part 'payment_state.dart';

@injectable
class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  final IPaymentController _controller;
  PaymentBloc(this._controller) : super(_Initial()) {
    on<PaymentEvent>((event, emit) async {
      emit(const PaymentState.onLoading());
      await event.when<FutureOr<void>>(
        addCard: (AddCardModel model) async {
          try {
            final data = await _controller.addCard(card: model);
            data.fold((l) => emit(PaymentState.onFailure(l)), (data) {
              emit(PaymentState.onAddCardSuccess(data));
            });
          } on Exception catch (e) {
            emit(PaymentState.onFailure(e.toString()));
          }
        },
        checkoutWithCard: (CheckoutCardModel model) async {
          try {
            final data = await _controller.checkoutWithCard(model: model);
            data.fold((l) => emit(PaymentState.onFailure(l)), (data) {
              emit(PaymentState.onCheckoutWithCardSuccess(data));
            });
          } on Exception catch (e) {
            emit(PaymentState.onFailure(e.toString()));
          }
        },
        getCardList: () async {
          try {
            final data = await _controller.getCardList();
            data.fold((l) => emit(PaymentState.onFailure(l)), (data) {
              emit(PaymentState.onGetCardListSuccess(data));
            });
          } on Exception catch (e) {
            emit(PaymentState.onFailure(e.toString()));
          }
        },
        started: () {},
        getPaymentLink: (GetPaymentLinkModel model) async {
          try {
            final data = await _controller.getPaymentLink(model);
            data.fold((l) => emit(PaymentState.onFailure(l)), (data) {
              emit(PaymentState.onGetPaymentLinkSuccess(data));
            });
          } on Exception catch (e) {
            emit(PaymentState.onFailure(e.toString()));
          }
        },
        getPaymentReceipt: (id) async {
          try {
            final data = await _controller.getPaymentReceipt(id);
            data.fold((l) => emit(PaymentState.onFailure(l)), (data) {
              emit(PaymentState.onGetPaymentReceiptSuccess(data));
            });
          } on Exception catch (e) {
            emit(PaymentState.onFailure(e.toString()));
          }
        },
      );
    });
  }
}
