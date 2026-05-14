import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:workitpt/features/booking/data/model/add_booking_model.dart';
import 'package:workitpt/features/booking/data/model/add_booking_response_model.dart';

import '../../data/model/booking_model.dart';
import '../repository/i_booking_repository.dart';

abstract class IBookingController {
  Future<Either<String, List<BookingModel>>> getBookings();

  Future<Either<String, List<AddBookingResponseModel>>> addBooking(
      AddBookingModel model);
  Future<Either<String, List<BookingModel>>> getUpcomingBookings();
  Future<Either<String, List<BookingModel>>> getPendingPayments();
  Future<Either<String, BookingModel>> getBookingDetail(String id);
  Future<Either<String, BookingModel>> getMultipleBookingDetail(
      List<String> id);
}

@Injectable(as: IBookingController)
class BookingController extends IBookingController {
  final IBookingRepository _repository;

  BookingController(this._repository);

  @override
  Future<Either<String, List<AddBookingResponseModel>>> addBooking(
      AddBookingModel model) async {
    final response = await _repository.addBooking(model);
    return response;
  }

  @override
  Future<Either<String, List<BookingModel>>> getUpcomingBookings() async {
    final response = await _repository.getUpcomingBookings();
    return response;
  }

  @override
  Future<Either<String, List<BookingModel>>> getBookings() async {
    final response = await _repository.getBookings();
    return response;
  }

  @override
  Future<Either<String, List<BookingModel>>> getPendingPayments() async {
    final response = await _repository.getPendingPayments();
    return response;
  }

  @override
  Future<Either<String, BookingModel>> getBookingDetail(String id) async {
    final response = await _repository.getBookingDetail(id);
    return response;
  }

  @override
  Future<Either<String, BookingModel>> getMultipleBookingDetail(
      List<String> id) async {
    final response = await _repository.getMultipleBookingDetail(id);
    return response;
  }
}
