part of 'booking_bloc.dart';

@freezed
class BookingState with _$BookingState {
  const factory BookingState.initial() = _Initial;
  const factory BookingState.onLoading() = _onLoading;
  const factory BookingState.onGetBookingSuccess(List<BookingModel> model) =
      _onGetBookingSuccess;
  const factory BookingState.onFailure(String? message) = _onFailure;
  const factory BookingState.onAddBookingSuccess(
      List<AddBookingResponseModel> model) = _onAddBookingSuccess;
  const factory BookingState.onGetUpcomingBookingsSuccess(
      List<BookingModel> model) = _onGetUpcomingBookingsSuccess;
  const factory BookingState.onGetPendingPaymentSuccess(
      List<BookingModel> model) = _onGetPendingPaymentSuccess;
  const factory BookingState.onGetBookingDetailSuccess(BookingModel model) =
      _onGetBookingDetailSuccess;
  const factory BookingState.onGetMultipleBookingDetailSuccess(
      BookingModel model) = _onGetMultipleBookingDetailSuccess;
}
