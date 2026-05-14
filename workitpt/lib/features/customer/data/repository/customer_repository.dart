import 'package:dartz/dartz.dart';
import 'package:flutter_rest_client/flutter_rest_client.dart';
import 'package:injectable/injectable.dart';
import 'package:workitpt/features/customer/data/model/customer_detail_model.dart';
import 'package:workitpt/features/customer/data/model/customer_model.dart';
import 'package:workitpt/features/customer/domain/repository/i_customer_repository.dart';

import '../../../../core/utils/app_utils.dart';
import '../../../authentication/signup/data/models/common_model.dart';
import '../model/customer_filter_model.dart';
import '../requests/customer_detail_endpoint.dart';
import '../requests/get_customer_list_endpoint.dart';

@Injectable(as: ICustomerRepository)
class CustomerRepository extends ICustomerRepository {
  final IHttpHelper _iHttpHelper;

  CustomerRepository(this._iHttpHelper);

  Map<String, dynamic> filterParse(CustomerFilterModel filter) => {
        if (filter.sort != null) 'sort': filter.sort,
        if (filter.search != null && filter.search != '')
          'search': filter.search,
        if (filter.price != null) 'price': filter.price,
        if (filter.page != null && filter.page! > 0) 'page': filter.page,
        if (filter.limit != null && filter.limit! > 0) 'limit': filter.limit,
      };

  @override
  Future<Either<String, CustomerDetailModel>> getCustomerDetail(
      String id) async {
    try {
      final response = await _iHttpHelper.request(
          CustomerDetailEndpoint(id), BaseRequestModel());
      if (response != null) {
        final model = CommonModel<CustomerDetailModel>.fromJson(
            response as Map<String, dynamic>,
            (data) =>
                CustomerDetailModel.fromJson(data as Map<String, dynamic>));

        return model.ok ? right(model.data!) : left(model.message!);
      } else {
        return left('Something went wrong');
      }
    } on Exception catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, List<CustomerModel>>> getCustomerList(
      {CustomerFilterModel? filter}) async {
    try {
      final response = await _iHttpHelper.request(
        queriesParams: filter != null ? filterParse(filter) : {},
        GetCustomerListEndpoint(),
        BaseRequestModel(),
      );
      if (response != null) {
        final model = CommonModel<List<CustomerModel>>.fromJson(
            response as Map<String, dynamic>,
            (data) => ArrayfromJson<CustomerModel>(
                data as List<dynamic>, CustomerModel.fromJson));

        return model.ok ? right(model.data!) : left(model.message!);
      } else {
        return left('Something went wrong');
      }
    } on Exception catch (e) {
      return left(e.toString());
    }
  }
}
