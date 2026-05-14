import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:workitpt/features/customer/data/model/customer_model.dart';
import 'package:workitpt/features/customer/domain/repository/i_customer_repository.dart';

import '../../data/model/customer_detail_model.dart';
import '../../data/model/customer_filter_model.dart';

abstract class ICustomerController {
  Future<Either<String, List<CustomerModel>>> getCustomerList(
      {CustomerFilterModel? filter});

  Future<Either<String, CustomerDetailModel>> getCustomerDetail(String id);
}

@Injectable(as: ICustomerController)
class CustomerController extends ICustomerController {
  final ICustomerRepository repository;

  CustomerController(this.repository);
  @override
  Future<Either<String, CustomerDetailModel>> getCustomerDetail(
      String id) async {
    return await repository.getCustomerDetail(id);
  }

  @override
  Future<Either<String, List<CustomerModel>>> getCustomerList(
      {CustomerFilterModel? filter}) async {
    return await repository.getCustomerList(filter: filter);
  }
}
