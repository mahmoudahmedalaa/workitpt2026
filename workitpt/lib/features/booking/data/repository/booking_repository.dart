import 'package:dartz/dartz.dart';
import 'package:flutter_rest_client/flutter_rest_client.dart';
import 'package:injectable/injectable.dart';
import 'package:workitpt/features/booking/data/model/add_booking_response_model.dart';
import 'package:workitpt/features/booking/data/requests/get_booking_detail_endpoint.dart';
import 'package:workitpt/features/booking/data/requests/pending_bookings_endpoint.dart';

import '../../../../core/utils/app_utils.dart';
import '../../../authentication/signup/data/models/common_model.dart';
import '../../domain/repository/i_booking_repository.dart';
import '../model/add_booking_model.dart';
import '../model/booking_model.dart';
import '../requests/add_booking_endpoint.dart';
import '../requests/get_bookings_endpoint.dart';
import '../requests/upcoming_bookings_endpoint.dart';

@Injectable(as: IBookingRepository)
class BookingRepository extends IBookingRepository {
  final IHttpHelper _iHttpHelper;

  BookingRepository(this._iHttpHelper);
  @override
  Future<Either<String, List<AddBookingResponseModel>>> addBooking(
      AddBookingModel model) async {
    try {
      final response = await _iHttpHelper.request(AddBookingEndpoint(), model);
      if (response != null) {
        final model = CommonModel<List<AddBookingResponseModel>>.fromJson(
            response as Map<String, dynamic>,
            (data) => ArrayfromJson<AddBookingResponseModel>(
                data as List<dynamic>, AddBookingResponseModel.fromJson));
        return model.ok ? right(model.data!) : left(model.message!);
      } else {
        return left('Something went wrong');
      }
    } on Exception catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, List<BookingModel>>> getBookings() async {
    try {
      final response = await _iHttpHelper.request(
          // queriesParams: filter != null ? filterParse(filter) : {},
          GetBookingEndpoint(),
          BaseRequestModel());
      if (response != null) {
        final model = CommonModel<List<BookingModel>>.fromJson(
            response as Map<String, dynamic>,
            (data) => ArrayfromJson<BookingModel>(
                data as List<dynamic>, BookingModel.fromJson));

        return model.ok ? right(model.data!) : left(model.message!);
      } else {
        return left('Something went wrong');
      }
    } on Exception catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, List<BookingModel>>> getPendingPayments() async {
    try {
      final response = await _iHttpHelper.request(
        GetPendingBookingsEndpoint(),
        BaseRequestModel(),
      );
      if (response != null) {
        final model = CommonModel<List<BookingModel>>.fromJson(
            response as Map<String, dynamic>,
            (data) => ArrayfromJson<BookingModel>(
                data as List<dynamic>, BookingModel.fromJson));

        return model.ok ? right(model.data!) : left(model.message!);
      } else {
        return left('Something went wrong');
      }
    } on Exception catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, List<BookingModel>>> getUpcomingBookings() async {
    try {
      final response = await _iHttpHelper.request(
          GetUpcomingBookingsEndpoint(), BaseRequestModel());
      if (response != null) {
        final model = CommonModel<List<BookingModel>>.fromJson(
            response as Map<String, dynamic>,
            (data) => ArrayfromJson<BookingModel>(
                data as List<dynamic>, BookingModel.fromJson));
        return model.ok ? right(model.data!) : left(model.message!);
      } else {
        return left('Something went wrong');
      }
    } on Exception catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, BookingModel>> getBookingDetail(String id) async {
    try {
      final response = await _iHttpHelper.request(
          GetBookingDetailEndpoint(id), BaseRequestModel());
      if (response != null) {
        final model = CommonModel<BookingModel>.fromJson(
          response as Map<String, dynamic>,
          (data) => BookingModel.fromJson(
            data as Map<String, dynamic>,
          ),
        );
        return model.ok ? right(model.data!) : left(model.message!);
      } else {
        return left('Something went wrong');
      }
    } on Exception catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, BookingModel>> getMultipleBookingDetail(
      List<String> id) async {
    try {
      final response = await _iHttpHelper.request(
          GetMultipleBookingDetailEndpoint(id), BaseRequestModel());
      if (response != null) {
        final model = CommonModel<BookingModel>.fromJson(
          response as Map<String, dynamic>,
          (data) => BookingModel.fromJson(
            data as Map<String, dynamic>,
          ),
        );
        return model.ok ? right(model.data!) : left(model.message!);
      } else {
        return left('Something went wrong');
      }
    } on Exception catch (e) {
      return left(e.toString());
    }
  }
}
