part of 'payment_bloc.dart';

@freezed
class PaymentState with _$PaymentState {
  const factory PaymentState.initial() = _Initial;
  const factory PaymentState.onLoading() = _onLoading;
  const factory PaymentState.onFailure(String? message) = _onFailure;
  const factory PaymentState.onGetCardListSuccess(List<CardModel> model) =
      _onGetCardListSuccess;
  const factory PaymentState.onAddCardSuccess(CardModel model) =
      _onAddCardSuccess;
  const factory PaymentState.onCheckoutWithCardSuccess(String message) =
      _onCheckoutWithCardSuccess;
  const factory PaymentState.onGetPaymentLinkSuccess(String model) =
      _onGetPaymentLinkSuccess;
  const factory PaymentState.onGetPaymentReceiptSuccess(File model) =
      _onGetPaymentReceiptSuccess;
}
