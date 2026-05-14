import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:workitpt/features/authentication/signup/data/models/common_model.dart';

import '../../../booking/data/model/add_booking_model.dart';
import '../../data/models/rating_model.dart';
import '../../data/models/session_filter_model.dart';
import '../../data/models/session_model.dart';
import '../../data/models/session_response_model.dart';
import '../../domain/controller/i_session_controller.dart';

part 'session_bloc.freezed.dart';
part 'session_event.dart';
part 'session_state.dart';

@injectable
class SessionBloc extends Bloc<SessionEvent, SessionState> {
  final ISessionController _controller;
  SessionBloc(this._controller) : super(const _Initial()) {
    on<SessionEvent>((event, emit) async {
      emit(const SessionState.onLoading());
      await event.when<FutureOr<void>>(
        validateSelectedTime: (timeList) async {
          try {
            final data = await _controller.validateSelectedTime(timeList);
            data.fold((l) => emit(SessionState.onFailure(l)), (data) {
              emit(SessionState.onTimeValidateSuccess());
            });
          } on Exception catch (e) {
            emit(SessionState.onTimeValidateFailure(e.toString()));
          }
        },
        putRating: (model, id) async {
          try {
            final data = await _controller.putRating(model, id);
            data.fold((l) => emit(SessionState.onFailure(l)), (data) {
              emit(SessionState.onRatingSuccess(data));
            });
          } on Exception catch (e) {
            emit(SessionState.onFailure(e.toString()));
          }
        },
        addSession: (model) async {
          try {
            final data = await _controller.addSession(model);
            data.fold((l) => emit(SessionState.onFailure(l)), (data) {
              emit(SessionState.onAddSessionSuccess(data));
            });
          } on Exception catch (e) {
            emit(SessionState.onFailure(e.toString()));
          }
        },
        viewSession: (sessionID) async {
          try {
            final data = await _controller.viewSession(sessionID);
            data.fold((l) => emit(SessionState.onFailure(l)), (data) {
              emit(SessionState.onGetSessionDetailsSuccess(data));
            });
          } on Exception catch (e) {
            emit(SessionState.onFailure(e.toString()));
          }
        },
        deleteSession: (sessionID) async {
          try {
            final data = await _controller.deleteSession(sessionID);
            data.fold((l) => emit(SessionState.onFailure(l)), (data) {
              emit(SessionState.onDeleteSessionSuccess(data));
            });
          } on Exception catch (e) {
            emit(SessionState.onFailure(e.toString()));
          }
        },
        getSession: (model) async {
          try {
            final data = await _controller.getSession(filter: model);
            data.fold((l) => emit(SessionState.onFailure(l)), (data) {
              emit(SessionState.onGetSessionSuccess(data));
            });
          } on Exception catch (e) {
            emit(SessionState.onFailure(e.toString()));
          }
        },
        updateSession: (model, referenceID) async {
          try {
            final data = await _controller.updateSession(model, referenceID);
            data.fold((l) => emit(SessionState.onFailure(l)), (data) {
              emit(SessionState.onUpdateSessionSuccess(data));
            });
          } on Exception catch (e) {
            emit(SessionState.onFailure(e.toString()));
          }
        },
        getPreviousSession: (model) async {
          try {
            final data = await _controller.getPreviousSession(filter: model);
            data.fold((l) => emit(SessionState.onFailure(l)), (data) {
              emit(SessionState.onGetPreviousSessionSuccess(data));
            });
          } on Exception catch (e) {
            emit(SessionState.onFailure(e.toString()));
          }
        },
        getUpcomingSession: (model) async {
          try {
            final data = await _controller.getUpcomingSession(filter: model);
            data.fold((l) => emit(SessionState.onFailure(l)), (data) {
              emit(SessionState.onGetUpcomingSessionSuccess(data));
            });
          } on Exception catch (e) {
            emit(SessionState.onFailure(e.toString()));
          }
        },
      );
    });
  }
}
