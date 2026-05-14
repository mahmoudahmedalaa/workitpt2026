part of 'payment_bloc.dart';

@freezed
class PaymentEvent with _$PaymentEvent {
  const factory PaymentEvent.started() = _Started;
  const factory PaymentEvent.addCard(AddCardModel model) = _onAddCard;
  const factory PaymentEvent.getCardList() = _onGetCardList;
  const factory PaymentEvent.checkoutWithCard(CheckoutCardModel model) =
      _onCheckoutWithCard;
  const factory PaymentEvent.getPaymentLink(GetPaymentLinkModel model) =
      _onGetPaymentLink;
  const factory PaymentEvent.getPaymentReceipt(List<String> id) =
      _onGetPaymentReceipt;
}
