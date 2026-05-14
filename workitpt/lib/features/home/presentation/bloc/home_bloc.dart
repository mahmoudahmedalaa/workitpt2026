import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:workitpt/features/home/data/model/activity_model.dart';
import 'package:workitpt/features/sessions/data/models/session_response_model.dart';
import '../../data/model/analytics_model.dart';
import '../../data/model/streak_model.dart';
import '../../domain/controller/i_home_controller.dart';

part 'home_event.dart';

part 'home_state.dart';

part 'home_bloc.freezed.dart';

@Injectable()
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  IHomeController _controller;

  HomeBloc(this._controller) : super(const HomeState.initial()) {
    on<HomeEvent>(
      (event, emit) async {
        emit(const HomeState.onLoading());
        await event.whenOrNull<FutureOr<void>>(
          getUserActivity: () async {
            try {
              final data = await _controller.getUserActivity();
              data.fold((l) => emit(HomeState.onFailure(l)), (data) {
                emit(HomeState.onGetUserActivitySuccess(data));
              });
            } on Exception catch (e) {
              emit(HomeState.onFailure(e.toString()));
            }
          },
          getUserStreak: () async {
            try {
              final data = await _controller.getUserStreak();
              data.fold((l) => emit(HomeState.onFailure(l)), (data) {
                emit(HomeState.onGetUserStreakSuccess(data));
              });
            } on Exception catch (e) {
              emit(HomeState.onFailure(e.toString()));
            }
          },   getAnalytics: () async {
            try {
              final data = await _controller.getAnalytics();
              data.fold((l) => emit(HomeState.onFailure(l)), (data) {
                emit(HomeState.onGetAnalyticsSuccess(data));
              });
            } on Exception catch (e) {
              emit(HomeState.onFailure(e.toString()));
            }
          },   getCompletedSessions: () async {
            try {
              final data = await _controller.getCompletedSession();
              data.fold((l) => emit(HomeState.onFailure(l)), (data) {
                emit(HomeState.onGetCompletedSessionSuccess(data));
              });
            } on Exception catch (e) {
              emit(HomeState.onFailure(e.toString()));
            }
          },
        );
      },
    );
  }
}
