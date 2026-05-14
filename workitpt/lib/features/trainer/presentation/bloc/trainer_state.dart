part of 'trainer_bloc.dart';

@freezed
class TrainerState with _$TrainerState {
  const factory TrainerState.initial() = _Initial;
  const factory TrainerState.onLoading() = _onLoading;
  const factory TrainerState.onFailure(String? message) = _onFailure;
  const factory TrainerState.onGetTrainerListSuccess(TrainerListModel model) =
      _onGetTrainerListSuccess;
  const factory TrainerState.onGetTrainerDetailSuccess(
      TrainerDetailModel model) = _onGetTrainerDetailSuccess;
}
