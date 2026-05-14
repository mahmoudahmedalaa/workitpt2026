import 'package:dartz/dartz.dart';
import 'package:flutter_rest_client/flutter_rest_client.dart';
import 'package:injectable/injectable.dart';
import 'package:workitpt/features/trainer/data/models/trainer_detail_model.dart';
import 'package:workitpt/features/trainer/data/request/trainer_detail_endpoint.dart';

import '../../../authentication/signup/data/models/common_model.dart';
import '../../domain/repository/i_trainer_repository.dart';
import '../models/trainer_filter_model.dart';
import '../models/trainer_model.dart';
import '../request/get_trainer_list_endpoint.dart';

@Injectable(as: ITrainerRepository)
class TrainerRepository extends ITrainerRepository {
  final IHttpHelper _iHttpHelper;

  TrainerRepository(this._iHttpHelper);

  Map<String, dynamic> filterParse(TrainerFilterModel filter) => {
        if (filter.workoutLocation != null &&
            filter.workoutLocation!.isNotEmpty)
          'location': filter.workoutLocation?.join(','),
        if (filter.search != null && filter.search!.isNotEmpty)
          'search': filter.search,
        if (filter.specialization != null && filter.specialization!.isNotEmpty)
          'specialization': filter.specialization?.join(','),
        if (filter.rating != null) 'rating': filter.rating,
        if (filter.priceMin != null && filter.priceMin! > 0)
          'minPrice': filter.priceMin,
        if (filter.priceMax != null && filter.priceMax! > 0)
          'maxPrice': filter.priceMax,
        if (filter.page != null && filter.page! > 0) 'page': filter.page,
        if (filter.limit != null && filter.limit! > 0) 'limit': filter.limit,
      };

  @override
  Future<Either<String, TrainerListModel>> getTrainerlist(
      {TrainerFilterModel? filter}) async {
    try {
      final response = await _iHttpHelper.request(
          queriesParams: filter != null ? filterParse(filter) : {},
          GetTrainerListEndpoint(),
          BaseRequestModel());
      if (response != null) {
        final model = CommonModel<TrainerListModel>.fromJson(
            response as Map<String, dynamic>,
            (data) => TrainerListModel.fromJson(data as Map<String, dynamic>));

        return model.ok ? right(model.data!) : left(model.message!);
      } else {
        return left('Something went wrong');
      }
    } on Exception catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, TrainerDetailModel>> getTrainerDetail(String id) async {
    try {
      final response = await _iHttpHelper.request(
          TrainerDetailEndpoint(id), BaseRequestModel());
      if (response != null) {
        final model = CommonModel<TrainerDetailModel>.fromJson(
            response as Map<String, dynamic>,
            (data) =>
                TrainerDetailModel.fromJson(data as Map<String, dynamic>));

        return model.ok ? right(model.data!) : left(model.message!);
      } else {
        return left('Something went wrong');
      }
    } on Exception catch (e) {
      return left(e.toString());
    }
  }
}
