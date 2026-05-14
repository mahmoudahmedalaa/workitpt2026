import 'package:dartz/dartz.dart';

import '../../data/model/customer_detail_model.dart';
import '../../data/model/customer_filter_model.dart';
import '../../data/model/customer_model.dart';

abstract class ICustomerRepository {
  Future<Either<String, List<CustomerModel>>> getCustomerList(
      {CustomerFilterModel? filter});

  Future<Either<String, CustomerDetailModel>> getCustomerDetail(String id);
}
