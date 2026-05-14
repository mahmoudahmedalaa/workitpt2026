import 'package:workitpt/config/typography.dart';
import 'package:workitpt/core/constants/spacing.dart';
import 'package:workitpt/core/widgets/app_button.dart';
import 'package:workitpt/core/widgets/base_view.dart';

import '../../../../core/export.dart';

@RoutePage()
class PaymentReceiptView extends StatelessWidget {
  const PaymentReceiptView({super.key});

  @override
  Widget build(BuildContext context) => BaseView(
        color: Colors.white,
        titleText: 'Payment Details',
        appBarColor: Colors.white,
        padding: EdgeInsets.zero,
        elevation: 0,
        body: Padding(
          padding: allPadding16,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Please enter your payment details",
                style: AppTextStyle.bodyLgRegular,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Card Details",
                style: AppTextStyle.bodyMDSemiBold,
              ),
              SizedBox(
                height: 10,
              ),
              Spacer(),
              Align(
                alignment: Alignment.bottomCenter,
                child: AppButton(
                  buttonText: "Next",
                  onPressed: () {
                    // context.router.push(PaymentSuccessRoute(role: 'USER'));
                  },
                ),
              ),
            ],
          ),
        ),
      );
}
