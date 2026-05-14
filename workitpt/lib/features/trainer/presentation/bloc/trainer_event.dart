part of 'trainer_bloc.dart';

@freezed
class TrainerEvent with _$TrainerEvent {
  const factory TrainerEvent.getTrainerList({TrainerFilterModel? filter}) =
      _onGetTrainerList;
  const factory TrainerEvent.getTrainerDetail(String id) = _onGetTrainerDetail;
}
