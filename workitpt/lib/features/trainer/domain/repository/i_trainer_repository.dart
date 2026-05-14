import 'package:dartz/dartz.dart';

import '../../data/models/trainer_detail_model.dart';
import '../../data/models/trainer_filter_model.dart';
import '../../data/models/trainer_model.dart';

abstract class ITrainerRepository {
  Future<Either<String, TrainerListModel>> getTrainerlist(
      {TrainerFilterModel? filter});

  Future<Either<String, TrainerDetailModel>> getTrainerDetail(String id);
}
