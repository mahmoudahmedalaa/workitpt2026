import 'package:dartz/dartz.dart';
import 'package:workitpt/features/home/data/model/activity_model.dart';
import 'package:workitpt/features/home/data/model/analytics_model.dart';

import '../../../sessions/data/models/session_response_model.dart';
import '../../data/model/streak_model.dart';


abstract class IHomeRepository {
  Future<Either<String, List<ActivityModel>>> getUserActivity();
  Future<Either<String, StreakModel>> getUserStreak();
  Future<Either<String, AnalyticsModel>> getAnalytics();
  Future<Either<String, List<SessionResponseModel>>> getCompletedSession();
}
