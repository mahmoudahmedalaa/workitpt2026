import 'package:dartz/dartz.dart';
import 'package:workitpt/features/booking/data/model/add_booking_model.dart';
import 'package:workitpt/features/sessions/data/models/rating_model.dart';

import '../../../authentication/signup/data/models/common_model.dart';
import '../../data/models/locationvalidate_model.dart';
import '../../data/models/session_filter_model.dart';
import '../../data/models/session_model.dart';
import '../../data/models/session_response_model.dart';

abstract class ISessionRepository {
  Future<Either<String, CommonModel<List<SessionResponseModel>>>> getSession(
      {SessionFilterModel? filter});

  Future<Either<String, String>> addSession(SessionModel sessionModel);
  Future<Either<String, String>> validateSelectedTime(List<Date> timeList);

  Future<Either<String, List<SessionResponseModel>>> updateSession(
      SessionModel sessionModel, String referenceID);
  Future<Either<String, String>> putRating(RatingModel model, String id);
  Future<Either<String, SessionModel>> deleteSession(String sessionID);

  Future<Either<String, CommonModel<List<SessionResponseModel>>>>
      getUpcomingSession({SessionFilterModel? filter});
  Future<String?> validateLocation(LocationValidateModel model);
  Future<Either<String, CommonModel<List<SessionResponseModel>>>>
      getPreviousSession({SessionFilterModel? filter});

  Future<Either<String, SessionResponseModel>> viewSession(String sessionID);
}
