part of 'booking_bloc.dart';

@freezed
class BookingEvent with _$BookingEvent {
  const factory BookingEvent.started() = _Started;
  const factory BookingEvent.addBooking(AddBookingModel model) = _onAddBooking;
  const factory BookingEvent.getBookings() = _onGetBookings;
  const factory BookingEvent.getPendingPayments() = _onGetPendingPayments;
  const factory BookingEvent.getBookingDetail(String id) = _onGetBookingDetail;
  const factory BookingEvent.getMultipleBookingDetail(List<String> id) =
      _onGetMultipleBookingDetail;
  const factory BookingEvent.getUpcomingBookings() = _onGetUpcomingBookings;
}
