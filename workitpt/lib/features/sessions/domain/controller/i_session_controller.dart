import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:workitpt/features/authentication/signup/data/models/common_model.dart';

import '../../../booking/data/model/add_booking_model.dart';
import '../../data/models/locationvalidate_model.dart';
import '../../data/models/rating_model.dart';
import '../../data/models/session_filter_model.dart';
import '../../data/models/session_model.dart';
import '../../data/models/session_response_model.dart';
import '../repository/i_session_repository.dart';

abstract class ISessionController {
  Future<Either<String, CommonModel<List<SessionResponseModel>>>> getSession(
      {SessionFilterModel? filter});
  Future<Either<String, String>> validateSelectedTime(List<Date> timeList);

  Future<Either<String, CommonModel<List<SessionResponseModel>>>>
      getUpcomingSession({SessionFilterModel? filter});
  Future<String?> validateLocation(LocationValidateModel model);
  Future<Either<String, CommonModel<List<SessionResponseModel>>>>
      getPreviousSession({SessionFilterModel? filter});

  Future<Either<String, SessionResponseModel>> viewSession(String sessionID);

  Future<Either<String, String>> addSession(SessionModel sessionModel);

  Future<Either<String, List<SessionResponseModel>>> updateSession(
      SessionModel sessionModel, String referenceID);
  Future<Either<String, String>> putRating(RatingModel model, String id);
  Future<Either<String, SessionModel>> deleteSession(String sessionID);
}

@Injectable(as: ISessionController)
class SessionController extends ISessionController {
  final ISessionRepository _repository;

  SessionController(this._repository);

  @override
  Future<Either<String, String>> addSession(SessionModel sessionModel) async {
    final response = await _repository.addSession(sessionModel);
    return response;
  }

  @override
  Future<String?> validateLocation(LocationValidateModel model) {
    final response = _repository.validateLocation(model);
    return response;
  }

  Future<Either<String, String>> putRating(RatingModel model, String id) {
    final response = _repository.putRating(model, id);
    return response;
  }

  @override
  Future<Either<String, String>> validateSelectedTime(List<Date> timeList) {
    final response = _repository.validateSelectedTime(timeList);
    return response;
  }

  @override
  Future<Either<String, CommonModel<List<SessionResponseModel>>>> getSession(
      {SessionFilterModel? filter}) async {
    final response = await _repository.getSession(filter: filter);
    return response;
  }

  @override
  Future<Either<String, SessionModel>> deleteSession(String sessionID) async {
    final response = await _repository.deleteSession(sessionID);
    return response;
  }

  @override
  Future<Either<String, List<SessionResponseModel>>> updateSession(
      SessionModel sessionModel, String referenceID) async {
    final response = await _repository.updateSession(sessionModel, referenceID);
    return response;
  }

  @override
  Future<Either<String, CommonModel<List<SessionResponseModel>>>>
      getPreviousSession({SessionFilterModel? filter}) async {
    final response = await _repository.getPreviousSession(filter: filter);
    return response;
  }

  @override
  Future<Either<String, CommonModel<List<SessionResponseModel>>>>
      getUpcomingSession({SessionFilterModel? filter}) async {
    final response = await _repository.getUpcomingSession(filter: filter);
    return response;
  }

  @override
  Future<Either<String, SessionResponseModel>> viewSession(
      String sessionID) async {
    final response = await _repository.viewSession(sessionID);
    return response;
  }
}
