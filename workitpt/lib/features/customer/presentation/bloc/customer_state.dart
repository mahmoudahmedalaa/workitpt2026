part of 'customer_bloc.dart';

@freezed
class CustomerState with _$CustomerState {
  const factory CustomerState.initial() = _Initial;
  const factory CustomerState.onLoading() = _onLoading;
  const factory CustomerState.onFailure(String? message) = _onFailure;
  const factory CustomerState.onGetCustomerListSuccess(
      List<CustomerModel> model) = _onGetCustomerListSuccess;
  const factory CustomerState.onGetCustomerDetailSuccess(
      CustomerDetailModel model) = _onGetCustomerDetailSuccess;
}
