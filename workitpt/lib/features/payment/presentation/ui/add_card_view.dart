import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workitpt/core/injection/injection.dart';
import 'package:workitpt/core/widgets/base_view.dart';
import 'package:workitpt/features/payment/data/models/add_card_model.dart';
import 'package:workitpt/features/payment/presentation/widgets/credit_card_textfield.dart';

import '../../../../config/typography.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/spacing.dart';
import '../../../../core/export.dart';
import '../../../../core/utils/validator.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../bloc/payment_bloc.dart';
import '../widgets/card_utils.dart';

@RoutePage()
class AddCardView extends StatefulWidget {
  AddCardView({
    super.key,
  });

  @override
  State<AddCardView> createState() => _AddCardViewState();
}

class _AddCardViewState extends State<AddCardView> {
  final TextEditingController _cardNumber = TextEditingController();
  final TextEditingController _cardHolder = TextEditingController();
  final TextEditingController _cardCVC = TextEditingController();
  final TextEditingController _cardExpiry = TextEditingController();

  AddCardModel? model;

  final paymentBloc = getIt<PaymentBloc>();

  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => paymentBloc,
      child: BlocListener<PaymentBloc, PaymentState>(
        listener: (context, state) {
          state.whenOrNull(
            onLoading: () => EasyLoading.show(),
            onFailure: (status) => EasyLoading.showError(status!),
            onAddCardSuccess: (model) {
              EasyLoading.showSuccess('Card added successfully');
              paymentBloc.add(PaymentEvent.getCardList());
            },
            onGetCardListSuccess: (model) {
              EasyLoading.dismiss();
              context.router.pop(model);
            },
          );
        },
        child: BaseView(
          color: Colors.white,
          titleText: 'Payment Details',
          appBarColor: Colors.white,
          padding: allPadding16,
          elevation: 0,
          body: Form(
            key: key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Please enter your payment details",
                        style: AppTextStyle.bodyMDMedium,
                      ),
                      verticalMargin16,
                      Text(
                        "Card Details",
                        style: AppTextStyle.bodyMDSemiBold,
                      ),
                      verticalMargin12,
                      CreditCardTextField(controller: _cardNumber),
                      AppTextField(
                        controller: _cardHolder,
                        labelText: 'Name',
                        hintText: 'Sam Louis',
                        validator: (value) =>
                            validateNotEmpty(value, 'Card Holder\'s Name'),
                        // prefixIcon: Assets.icons.profile.path,
                        textColor: colorPrimary,
                        textInputType: TextInputType.name,
                      ),
                      Row(
                        children: [
                          ExpiryDateTextField(
                            controller: _cardExpiry,
                          ).expanded(),
                          horizontalMargin12,
                          CVCTextField(
                            controller: _cardCVC,
                          ).expanded(),
                        ],
                      ),
                    ],
                  ),
                ).expanded(),
                AppButton(
                  buttonText: "Done",
                  suffixWidget: SizedBox.shrink(),
                  onPressed: () {
                    if (key.currentState!.validate()) {
                      paymentBloc.add(
                        PaymentEvent.addCard(
                          AddCardModel(
                            card: CardDetails(
                              cardHolderName: _cardHolder.text,
                              number:
                                  CardUtils.getCleanedNumber(_cardNumber.text),
                              cvc: int.parse(_cardCVC.text).toString(),
                              expMonth:
                                  CardUtils.getExpiryDate(_cardExpiry.text)[0],
                              expYear:
                                  CardUtils.getExpiryDate(_cardExpiry.text)[1],
                            ),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
