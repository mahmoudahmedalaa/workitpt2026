import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:document_file_save_plus/document_file_save_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_rest_client/flutter_rest_client.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:workitpt/config/app_config.dart';
import 'package:workitpt/features/authentication/signup/data/models/common_model.dart';
import 'package:workitpt/features/payment/data/models/add_card_model.dart';
import 'package:workitpt/features/payment/data/models/card_model.dart';
import 'package:workitpt/features/payment/data/models/checkout_card_model.dart';
import 'package:workitpt/features/payment/data/requests/add_card_endpoint.dart';
import 'package:workitpt/features/payment/data/requests/checkout_card_endpoint.dart';
import 'package:workitpt/features/payment/data/requests/get_card_list_endpoint.dart';
import 'package:workitpt/features/payment/domain/repository/i_payment_repository.dart';

import '../../../../core/injection/injection.dart';
import '../../../../core/utils/app_utils.dart';
import '../../../authentication/session/i_session_manager.dart';
import '../models/get_payment_link_model.dart';
import '../requests/get_payment_link_endpoint.dart';

@Injectable(as: IPaymentRepository)
class PaymentRepository extends IPaymentRepository {
  final IHttpHelper _iHttpHelper;
  final AppConfig _appConfig;
  PaymentRepository(this._iHttpHelper, this._appConfig);
  @override
  Future<Either<String, CardModel>> addCard(
      {required AddCardModel card}) async {
    try {
      final response = await _iHttpHelper.request(AddCardEndpoint(), card);
      if (response != null) {
        final model = CommonModel.fromJson(response as Map<String, dynamic>,
            (data) => CardModel.fromJson(data as Map<String, dynamic>));

        return model.ok ? right(model.data!) : left(model.message!);
      } else {
        return left('Something went wrong');
      }
    } on Exception catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, List<CardModel>>> getCardList() async {
    try {
      final response =
          await _iHttpHelper.request(GetCardListEndpoint(), BaseRequestModel());
      if (response != null) {
        final model = CommonModel<List<CardModel>>.fromJson(
            response as Map<String, dynamic>,
            (data) => ArrayfromJson<CardModel>(
                data as List<dynamic>, CardModel.fromJson));

        return model.ok ? right(model.data!) : left(model.message!);
      } else {
        return left('Something went wrong');
      }
    } on Exception catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, String>> checkoutWithCard(
      {required CheckoutCardModel model}) async {
    try {
      final response =
          await _iHttpHelper.request(CheckoutCardEndpoint(), model);
      if (response != null) {
        final model = CommonModel.fromJson(
            response as Map<String, dynamic>, (data) => null);

        return model.ok ? right(model.message!) : left(model.message!);
      } else {
        return left('Something went wrong');
      }
    } on Exception catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, String>> getPaymentLink(
      GetPaymentLinkModel model) async {
    try {
      final response =
          await _iHttpHelper.request(GetPaymentLinkEndpoint(), model);
      if (response != null) {
        return response['ok']
            ? right(response['data'])
            : left(response['message']);
      } else {
        return left('Something went wrong');
      }
    } on Exception catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, File>> getPaymentReceipt(List<String> id) async {
    try {
      final response = await Dio().get<List<int>>(
        '${_appConfig.baseUrl}/booking/receipt?bookingIds=${id.join(',')}',
        options: Options(
          responseType: ResponseType.bytes,
          headers: <String, dynamic>{
            'Content-Type': 'application/pdf',
            'x-key-id': 'a9284717ab78f00a0b539972710c7427',
            'usersecret': await getIt<ISessionManager>().getUserSecret(),
            'Authorization':
                'Bearer ${await getIt<ISessionManager>().getToken()}'
          },
        ),
        queryParameters: <String, dynamic>{
          'x-key': 'b5c5dae9cb4caed79221a77f36c13a86'
        },
      );
      if (response.data != null) {
        final Directory? appDir = await getApplicationDocumentsDirectory();
        String tempPath = appDir!.path;
        // final String fileName =
        //     DateTime.now().microsecondsSinceEpoch.toString() + '-' + 'akt.pdf';
        final String fileName =
            'workitpt_payment_receipt_${DateTime.now().microsecondsSinceEpoch.toString()}.pdf';
        File file = new File('$tempPath/$fileName');
        if (!await file.exists()) {
          await file.create();
        }
        await file.writeAsBytes(response.data!, flush: true);
        Uint8List byte = Uint8List.fromList(response.data!);
        DocumentFileSavePlus().saveFile(byte, fileName, "appliation/pdf");
        return right(file);
      } else {
        return left('Something went wrong');
      }
      // throw DownloadException('The download failed.', response);
    } on Exception catch (value) {
      return left(value.toString());
    }
  }
}
