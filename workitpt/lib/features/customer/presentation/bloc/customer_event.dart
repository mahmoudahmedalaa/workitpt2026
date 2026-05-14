part of 'customer_bloc.dart';

@freezed
class CustomerEvent with _$CustomerEvent {
  const factory CustomerEvent.getCustomerList({CustomerFilterModel? filter}) =
      _onGetCustomerList;
  const factory CustomerEvent.getCustomerDetail(String id) =
      _onGetCustomerDetail;
}
