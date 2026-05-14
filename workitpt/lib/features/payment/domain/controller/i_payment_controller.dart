import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:workitpt/features/payment/data/models/add_card_model.dart';
import 'package:workitpt/features/payment/data/models/card_model.dart';
import 'package:workitpt/features/payment/data/models/checkout_card_model.dart';
import 'package:workitpt/features/payment/domain/repository/i_payment_repository.dart';

import '../../data/models/get_payment_link_model.dart';

abstract class IPaymentController {
  Future<Either<String, List<CardModel>>> getCardList();

  Future<Either<String, CardModel>> addCard({required AddCardModel card});

  Future<Either<String, String>> checkoutWithCard(
      {required CheckoutCardModel model});

  Future<Either<String, String>> getPaymentLink(GetPaymentLinkModel model);

  Future<Either<String, File>> getPaymentReceipt(List<String> id);
}

@Injectable(as: IPaymentController)
class PaymentController extends IPaymentController {
  final IPaymentRepository repository;

  PaymentController(this.repository);
  @override
  Future<Either<String, CardModel>> addCard({required AddCardModel card}) {
    final response = repository.addCard(card: card);
    return response;
  }

  @override
  Future<Either<String, List<CardModel>>> getCardList() {
    final response = repository.getCardList();
    return response;
  }

  @override
  Future<Either<String, String>> checkoutWithCard(
      {required CheckoutCardModel model}) {
    final response = repository.checkoutWithCard(model: model);
    return response;
  }

  @override
  Future<Either<String, String>> getPaymentLink(
      GetPaymentLinkModel model) async {
    final response = await repository.getPaymentLink(model);
    return response;
  }

  @override
  Future<Either<String, File>> getPaymentReceipt(List<String> id) async {
    final response = await repository.getPaymentReceipt(id);
    return response;
  }
}
