import 'package:dartz/dartz.dart';
import 'package:flutter_rest_client/flutter_rest_client.dart';
import 'package:injectable/injectable.dart';
import 'package:workitpt/features/home/data/model/analytics_model.dart';
import 'package:workitpt/features/home/data/requests/completed_session_endpoint.dart';
import 'package:workitpt/features/home/data/requests/trainer_analytics_endpoint.dart';
import 'package:workitpt/features/home/data/requests/user_activity_endpoint.dart';
import 'package:workitpt/features/home/data/requests/user_streak_endpoint.dart';
import 'package:workitpt/features/home/domain/repository/i_home_repository.dart';
import 'package:workitpt/features/sessions/data/models/session_response_model.dart';
import '../../../../core/utils/app_utils.dart';
import '../../../authentication/signup/data/models/common_model.dart';
import '../model/activity_model.dart';
import '../model/streak_model.dart';

@Injectable(as: IHomeRepository)
class HomeRepository extends IHomeRepository {
  final IHttpHelper _iHttpHelper;

  HomeRepository(this._iHttpHelper);

  @override
  Future<Either<String, List<ActivityModel>>> getUserActivity() async {
    try {
      final response = await _iHttpHelper.request(
          UserActivityEndPoint(), BaseRequestModel());
      if (response != null) {
        final model = CommonModel<List<ActivityModel>>.fromJson(
            response as Map<String, dynamic>,
            (data) => ArrayfromJson<ActivityModel>(
                data as List<dynamic>, ActivityModel.fromJson));
        return model.ok ? right(model.data!) : left(model.message!);
      } else {
        return left('Something went wrong');
      }
    } on Exception catch (e) {
      return left(e.toString());
    }
  }
  @override
  Future<Either<String, List<SessionResponseModel>>> getCompletedSession() async {
    try {
      final response = await _iHttpHelper.request(
          CompletedSessionEndPoint(), BaseRequestModel());
      if (response != null) {
        final model = CommonModel<List<SessionResponseModel>>.fromJson(
            response as Map<String, dynamic>,
            (data) => ArrayfromJson<SessionResponseModel>(
                data as List<dynamic>, SessionResponseModel.fromJson));
        return model.ok ? right(model.data!) : left(model.message!);
      } else {
        return left('Something went wrong');
      }
    } on Exception catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, StreakModel>> getUserStreak() async {
    try {
      final response =
          await _iHttpHelper.request(UserStreakEndPoint(), BaseRequestModel());
      if (response != null) {
        final model = CommonModel<StreakModel>.fromJson(
            response as Map<String, dynamic>,
            (data) => StreakModel.fromJson(data as Map<String, dynamic>));

        return model.ok ? right(model.data!) : left(model.message!);
      } else {
        return left('Something went wrong');
      }
    } on Exception catch (e) {
      return left(e.toString());
    }
  }  @override
  Future<Either<String, AnalyticsModel>> getAnalytics() async {
    try {
      final response =
          await _iHttpHelper.request(TrainerAnalyticsEndPoint(), BaseRequestModel());
      if (response != null) {
        final model = CommonModel<AnalyticsModel>.fromJson(
            response as Map<String, dynamic>,
            (data) => AnalyticsModel.fromJson(data as Map<String, dynamic>));
        return model.ok ? right(model.data!) : left(model.message!);
      } else {
        return left('Something went wrong');
      }
    } on Exception catch (e) {
      return left(e.toString());
    }
  }
}
