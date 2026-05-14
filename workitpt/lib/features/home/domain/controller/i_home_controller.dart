import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../sessions/data/models/session_response_model.dart';
import '../../data/model/activity_model.dart';
import '../../data/model/analytics_model.dart';
import '../../data/model/streak_model.dart';
import '../repository/i_home_repository.dart';

abstract class IHomeController {
  Future<Either<String, List<ActivityModel>>> getUserActivity();

  Future<Either<String, StreakModel>> getUserStreak();

  Future<Either<String, AnalyticsModel>> getAnalytics();

  Future<Either<String, List<SessionResponseModel>>> getCompletedSession();
}

@Injectable(as: IHomeController)
class HomeController extends IHomeController {
  final IHomeRepository _repository;

  HomeController(this._repository);

  @override
  Future<Either<String, List<ActivityModel>>> getUserActivity() async {
    final response = await _repository.getUserActivity();
    return response;
  }

  @override
  Future<Either<String, StreakModel>> getUserStreak() async {
    final response = await _repository.getUserStreak();
    return response;
  }
  @override
  Future<Either<String, AnalyticsModel>> getAnalytics() async {
    final response = await _repository.getAnalytics();
    return response;
  }

  @override
  Future<Either<String, List<SessionResponseModel>>>
      getCompletedSession() async {
    final response = await _repository.getCompletedSession();
    return response;
  }
}
