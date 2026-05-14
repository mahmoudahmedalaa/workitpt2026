import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:workitpt/features/trainer/data/models/trainer_detail_model.dart';
import 'package:workitpt/features/trainer/data/models/trainer_filter_model.dart';

import '../../data/models/trainer_model.dart';
import '../../domain/controller/i_trainer_controller.dart';

part 'trainer_bloc.freezed.dart';
part 'trainer_event.dart';
part 'trainer_state.dart';

@injectable
class TrainerBloc extends Bloc<TrainerEvent, TrainerState> {
  final ITrainerController _controller;
  TrainerBloc(this._controller) : super(_Initial()) {
    on<TrainerEvent>(
      (event, emit) async {
        emit(const TrainerState.onLoading());
        await event.when<FutureOr<void>>(
          getTrainerList: (model) async {
            try {
              final data = await _controller.getTrainerlist(filter: model);
              data.fold((l) => emit(TrainerState.onFailure(l)), (data) {
                emit(TrainerState.onGetTrainerListSuccess(data));
              });
            } on Exception catch (e) {
              emit(TrainerState.onFailure(e.toString()));
            }
          },
          getTrainerDetail: (String id) async {
            try {
              final data = await _controller.getTrainerDetail(id);
              data.fold((l) => emit(TrainerState.onFailure(l)), (data) {
                emit(TrainerState.onGetTrainerDetailSuccess(data));
              });
            } on Exception catch (e) {
              emit(TrainerState.onFailure(e.toString()));
            }
          },
        );
      },
    );
  }
}
