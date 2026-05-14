import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:workitpt/features/booking/data/model/add_booking_model.dart';
import 'package:workitpt/features/booking/data/model/add_booking_response_model.dart';

import '../../data/model/booking_model.dart';
import '../../domain/controller/i_booking_controller.dart';

part 'booking_bloc.freezed.dart';
part 'booking_event.dart';
part 'booking_state.dart';

@injectable
class BookingBloc extends Bloc<BookingEvent, BookingState> {
  final IBookingController _controller;
  BookingBloc(this._controller) : super(const BookingState.initial()) {
    on<BookingEvent>(
      (event, emit) async {
        emit(const BookingState.onLoading());
        await event.whenOrNull<FutureOr<void>>(
          addBooking: (model) async {
            try {
              final data = await _controller.addBooking(model);
              data.fold((l) => emit(BookingState.onFailure(l)), (data) {
                emit(BookingState.onAddBookingSuccess(data));
              });
            } on Exception catch (e) {
              emit(BookingState.onFailure(e.toString()));
            }
          },
          getUpcomingBookings: () async {
            try {
              final data = await _controller.getUpcomingBookings();
              data.fold((l) => emit(BookingState.onFailure(l)), (data) {
                emit(BookingState.onGetUpcomingBookingsSuccess(data));
              });
            } on Exception catch (e) {
              emit(BookingState.onFailure(e.toString()));
            }
          },
          getBookings: () async {
            try {
              final data = await _controller.getBookings();
              data.fold((l) => emit(BookingState.onFailure(l)), (data) {
                emit(BookingState.onGetBookingSuccess(data));
              });
            } on Exception catch (e) {
              emit(BookingState.onFailure(e.toString()));
            }
          },
          getPendingPayments: () async {
            try {
              final data = await _controller.getPendingPayments();
              data.fold((l) => emit(BookingState.onFailure(l)), (data) {
                emit(BookingState.onGetPendingPaymentSuccess(data));
              });
            } on Exception catch (e) {
              emit(BookingState.onFailure(e.toString()));
            }
          },
          getBookingDetail: (id) async {
            try {
              final data = await _controller.getBookingDetail(id);
              data.fold((l) => emit(BookingState.onFailure(l)), (data) {
                emit(BookingState.onGetBookingDetailSuccess(data));
              });
            } on Exception catch (e) {
              emit(BookingState.onFailure(e.toString()));
            }
          },
          getMultipleBookingDetail: (id) async {
            try {
              final data = await _controller.getMultipleBookingDetail(id);
              data.fold((l) => emit(BookingState.onFailure(l)), (data) {
                emit(BookingState.onGetMultipleBookingDetailSuccess(data));
              });
            } on Exception catch (e) {
              emit(BookingState.onFailure(e.toString()));
            }
          },
        );
      },
    );
  }
}
