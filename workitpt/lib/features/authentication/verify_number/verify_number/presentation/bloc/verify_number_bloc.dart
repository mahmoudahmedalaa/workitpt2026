import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/otp_model.dart';
import '../../domain/controller/verify_number_controller.dart';

part 'verify_number_bloc.freezed.dart';
part 'verify_number_event.dart';
part 'verify_number_state.dart';

@injectable
class VerifyNumberBloc extends Bloc<VerifyNumberEvent, VerifyNumberState> {
  final IVerifyNumberController _controller;

  VerifyNumberBloc(this._controller) : super(const _verifyNumberInitial()) {
    on<VerifyNumberEvent>((event, emit) async {
      emit(const VerifyNumberState.onLoading());
      await event.when<FutureOr<void>>(getOTP: () async {
        try {
          final data = await _controller.getOTP();
          data.fold((l) => emit(VerifyNumberState.onFailure(l)), (data) {
            emit(VerifyNumberState.onGetOTPSuccess(data));
          });
        } on Exception catch (e) {
          emit(VerifyNumberState.onFailure(e.toString()));
        }
      }, verifyOTP: (key, code) async {
        try {
          final data = await _controller.verifyOTP(code, key);
          data.fold((l) => emit(VerifyNumberState.onFailure(l)), (data) {
            emit(const VerifyNumberState.onVerifyOTPSuccess());
          });
        } on Exception catch (e) {
          emit(VerifyNumberState.onFailure(e.toString()));
        }
      });
    });
  }
}
