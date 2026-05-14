import 'package:dartz/dartz.dart';
import 'package:workitpt/features/booking/data/model/add_booking_model.dart';
import 'package:workitpt/features/booking/data/model/add_booking_response_model.dart';

import '../../data/model/booking_model.dart';

abstract class IBookingRepository {
  Future<Either<String, List<BookingModel>>> getBookings();

  Future<Either<String, List<AddBookingResponseModel>>> addBooking(
      AddBookingModel model);

  Future<Either<String, List<BookingModel>>> getPendingPayments();
  Future<Either<String, List<BookingModel>>> getUpcomingBookings();
  Future<Either<String, BookingModel>> getBookingDetail(String id);
  Future<Either<String, BookingModel>> getMultipleBookingDetail(
      List<String> id);
}
