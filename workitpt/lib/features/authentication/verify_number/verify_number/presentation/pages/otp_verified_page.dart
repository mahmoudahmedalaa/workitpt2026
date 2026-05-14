import 'package:sizer/sizer.dart';

import '../../../../../../config/typography.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/spacing.dart';
import '../../../../../../core/export.dart';
import '../../../../../../core/routes/app_router.dart';
import '../../../../../../core/widgets/app_button.dart';

@RoutePage()
class OTPVerifiedView extends StatefulWidget {
  const OTPVerifiedView({super.key, required this.role});
  final String role;

  @override
  State<OTPVerifiedView> createState() => _OTPVerifiedViewState();
}

class _OTPVerifiedViewState extends State<OTPVerifiedView> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  Assets.images.otpVerified.path,
                  height: 50.h,
                ),
                verticalMargin24,
                Text(
                  'OTP Verified',
                  style: AppTextStyle.titleMDSemiBold,
                ),
                verticalMargin8,
                Text(
                  'Hurray! your OTP has been verified, please click the continue button.',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.bodySMRegular.copyWith(color: darkText),
                ),
                horizontalMargin12,
              ],
            ).padding(top: 72, horizontal: 24, bottom: 24).expanded(),
            AppButton(
              buttonText: 'Continue',
              onPressed: () {
                if (widget.role == 'USER') {
                  context.router.popUntilRoot();
                  context.router.replace(DashboardRoute(role: 'USER'));
                  context.router.push(const SignupAdditionalRoute());
                } else if (widget.role == 'TRAINER') {
                  context.router.popUntilRoot();
                  context.router.replace(DashboardRoute(role: 'TRAINER'));
                  context.router.push(const SignupTrainerRoute());
                }
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).padding.bottom,
            ),
          ],
        ),
      );
}
