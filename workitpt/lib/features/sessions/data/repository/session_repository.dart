import 'package:dartz/dartz.dart';
import 'package:flutter_rest_client/flutter_rest_client.dart';
import 'package:injectable/injectable.dart';
import 'package:workitpt/features/booking/data/model/add_booking_model.dart';
import 'package:workitpt/features/sessions/data/models/locationvalidate_model.dart';
import 'package:workitpt/features/sessions/data/requests/rating_endpoint.dart';

import '../../../../core/utils/app_utils.dart';
import '../../../authentication/signup/data/models/common_model.dart';
import '../../domain/repository/i_session_repository.dart';
import '../models/rating_model.dart';
import '../models/session_filter_model.dart';
import '../models/session_model.dart';
import '../models/session_response_model.dart';
import '../requests/add_session_endpoint.dart';
import '../requests/delete_session_endpoint.dart';
import '../requests/get_session_endpoint.dart';
import '../requests/location_validate_endpoint.dart';
import '../requests/update_session_endpoint.dart';
import '../requests/view_session_endpoint.dart';

@Injectable(as: ISessionRepository)
class SessionRepository extends ISessionRepository {
  final IHttpHelper _iHttpHelper;

  SessionRepository(this._iHttpHelper);
  @override
  Future<Either<String, String>> addSession(SessionModel sessionModel) async {
    try {
      final response =
          await _iHttpHelper.request(AddSessionEndpoint(), sessionModel);
      if (response != null) {
        final model = CommonModel.fromJson(
            response as Map<String, dynamic>, (data) => null);

        return model.ok ? right(model.message!) : left(model.message!);
      } else {
        return left('Something went wrong');
      }
    } on Exception catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, String>> validateSelectedTime(
      List<Date> timeList) async {
    try {
      final response = await _iHttpHelper.request(
          AddSessionEndpoint(), AddBookingModel(dates: timeList));
      if (response != null) {
        final model = CommonModel.fromJson(
            response as Map<String, dynamic>, (data) => null);

        return model.ok ? right(model.message!) : left(model.message!);
      } else {
        return left('Something went wrong');
      }
    } on Exception catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, CommonModel<List<SessionResponseModel>>>> getSession(
      {SessionFilterModel? filter}) async {
    try {
      final response = await _iHttpHelper.request(
          queriesParams: filter != null ? filterParse(filter) : {},
          GetSessionEndpoint(),
          BaseRequestModel());
      if (response != null) {
        final model = CommonModel<List<SessionResponseModel>>.fromJson(
            response as Map<String, dynamic>,
            (data) => ArrayfromJson<SessionResponseModel>(
                data as List<dynamic>, SessionResponseModel.fromJson));

        return model.ok ? right(model) : left(model.message!);
      } else {
        return left('Something went wrong');
      }
    } on Exception catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, SessionModel>> deleteSession(String sessionID) async {
    try {
      final response = await _iHttpHelper.request(
          DeleteSessionEndpoint(sessionID), BaseRequestModel());
      if (response != null) {
        final model = CommonModel<SessionModel>.fromJson(
            response as Map<String, dynamic>,
            (data) => SessionModel.fromJson(data as Map<String, dynamic>));

        return model.ok ? right(model.data!) : left(model.message!);
      } else {
        return left('Something went wrong');
      }
    } on Exception catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, List<SessionResponseModel>>> updateSession(
      SessionModel sessionModel, String referenceID) async {
    try {
      final response = await _iHttpHelper.request(
          UpdateSessionEndpoint(referenceID), sessionModel);
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
  Future<Either<String, String>> putRating(RatingModel model, String id) async {
    try {
      final response = await _iHttpHelper.request(
        RatingEndPoint(id),
        model,
      );
      if (response != null) {
        final model = CommonModel.fromJson(
            response as Map<String, dynamic>, (data) => null);

        return model.ok ? right(model.message!) : left(model.message!);
      } else {
        return left('Something went wrong');
      }
    } on Exception catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, CommonModel<List<SessionResponseModel>>>>
      getPreviousSession({SessionFilterModel? filter}) async {
    try {
      final response = await _iHttpHelper.request(
          queriesParams: filter != null ? filterParse(filter) : {},
          GetPreviousSessionEndpoint(),
          BaseRequestModel());
      if (response != null) {
        final model = CommonModel<List<SessionResponseModel>>.fromJson(
            response as Map<String, dynamic>,
            (data) => ArrayfromJson<SessionResponseModel>(
                data as List<dynamic>, SessionResponseModel.fromJson));

        return model.ok ? right(model) : left(model.message!);
      } else {
        return left('Something went wrong');
      }
    } on Exception catch (e) {
      return left(e.toString());
    }
  }

  Map<String, dynamic> filterParse(SessionFilterModel filter) => {
        if (filter.selectType != null && filter.selectType != '')
          'selectType': filter.selectType,
        if (filter.search != null && filter.search != '')
          'search': filter.search,
        if (filter.sessionType != null && filter.sessionType != '')
          'sessionType': filter.sessionType,
        if (filter.workoutLocation != null &&
            filter.workoutLocation!.isNotEmpty)
          'workoutLocation': filter.workoutLocation?.join(','),
        if (filter.session != null && filter.session!.isNotEmpty)
          'workoutType': filter.session?.join(','),
        if (filter.difficult != null && filter.difficult != '')
          'difficultyLevel': filter.difficult,
        if (filter.minPrice != null && filter.minPrice! > 0)
          'minPrice': filter.minPrice,
        if (filter.maxPrice != null && filter.maxPrice! > 0)
          'maxPrice': filter.maxPrice,
        if (filter.booked != null && filter.booked != '')
          'booked': filter.booked!.toLowerCase() == 'booked',
        if (filter.page != null && filter.page! > 0) 'page': filter.page,
        if (filter.limit != null && filter.limit! > 0) 'limit': filter.limit,
      };

  @override
  Future<Either<String, CommonModel<List<SessionResponseModel>>>>
      getUpcomingSession({SessionFilterModel? filter}) async {
    try {
      final response = await _iHttpHelper.request(
          queriesParams: filter != null ? filterParse(filter) : {},
          GetUpcomingSessionEndpoint(),
          BaseRequestModel());
      if (response != null) {
        final model = CommonModel<List<SessionResponseModel>>.fromJson(
            response as Map<String, dynamic>,
            (data) => ArrayfromJson<SessionResponseModel>(
                data as List<dynamic>, SessionResponseModel.fromJson));

        return model.ok ? right(model) : left(model.message!);
      } else {
        return left('Something went wrong');
      }
    } on Exception catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<String?> validateLocation(LocationValidateModel model) async {
    try {
      final response =
          await _iHttpHelper.request(LocationValidateEndPoint(), model);
      if (response['ok']) {
        return null;
      } else {
        return response['message'];
      }
    } on Exception catch (e) {
      return e.toString();
    }
  }

  @override
  Future<Either<String, SessionResponseModel>> viewSession(
      String sessionID) async {
    try {
      final response = await _iHttpHelper.request(
          ViewSessionEndpoint(sessionID), BaseRequestModel());
      if (response != null) {
        final model = CommonModel<SessionResponseModel>.fromJson(
            response as Map<String, dynamic>,
            (data) =>
                SessionResponseModel.fromJson(data as Map<String, dynamic>));
        return model.ok ? right(model.data!) : left(model.message!);
      } else {
        return left('Something went wrong');
      }
    } on Exception catch (e) {
      return left(e.toString());
    }
  }
}
