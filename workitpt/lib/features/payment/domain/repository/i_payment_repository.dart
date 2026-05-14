import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../data/models/add_card_model.dart';
import '../../data/models/card_model.dart';
import '../../data/models/checkout_card_model.dart';
import '../../data/models/get_payment_link_model.dart';

abstract class IPaymentRepository {
  Future<Either<String, List<CardModel>>> getCardList();

  Future<Either<String, CardModel>> addCard({required AddCardModel card});

  Future<Either<String, String>> checkoutWithCard(
      {required CheckoutCardModel model});

  Future<Either<String, String>> getPaymentLink(GetPaymentLinkModel model);

  Future<Either<String, File>> getPaymentReceipt(List<String> id);
}
