import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:workitpt/features/trainer/data/models/trainer_detail_model.dart';
import 'package:workitpt/features/trainer/data/models/trainer_filter_model.dart';

import '../../data/models/trainer_model.dart';
import '../repository/i_trainer_repository.dart';

abstract class ITrainerController {
  Future<Either<String, TrainerListModel>> getTrainerlist(
      {TrainerFilterModel? filter});

  Future<Either<String, TrainerDetailModel>> getTrainerDetail(String id);
}

@Injectable(as: ITrainerController)
class TrainerController extends ITrainerController {
  final ITrainerRepository _repository;

  TrainerController(this._repository);
  @override
  Future<Either<String, TrainerListModel>> getTrainerlist(
      {TrainerFilterModel? filter}) async {
    return await _repository.getTrainerlist(filter: filter);
  }

  @override
  Future<Either<String, TrainerDetailModel>> getTrainerDetail(String id) async {
    return await _repository.getTrainerDetail(id);
  }
}
