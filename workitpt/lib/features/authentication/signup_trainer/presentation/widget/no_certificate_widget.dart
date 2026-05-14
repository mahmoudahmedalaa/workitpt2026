import 'package:sizer/sizer.dart';

import '../../../../../config/typography.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/spacing.dart';
import '../../../../../core/export.dart';

class NoCertificateWidget extends StatefulWidget {
  final VoidCallback onPressed;
  const NoCertificateWidget({super.key, required this.onPressed});

  @override
  State<NoCertificateWidget> createState() => _NoCertificateWidgetState();
}

class _NoCertificateWidgetState extends State<NoCertificateWidget> {
  @override
  Widget build(BuildContext context) => Column(
        children: [
          Image.asset(
            Assets.icons.noCertificate.path,
            width: 45.w,
          ).center(),
          verticalMargin12,
          Text(
            'No  Certificate Found',
            style: AppTextStyle.headlineSMSemiBold.copyWith(
              height: 1.20,
            ),
          ).center(),
          Text(
            'Oop! there are no certificate found here.  ',
            style: AppTextStyle.subHeadSMRegular.copyWith(
              color: const Color(0xFF59798F),
              height: 1.80,
              letterSpacing: 0.28,
            ),
          ).center(),
          verticalMargin24,
          Text(
            'Upload File',
            style: AppTextStyle.bodySMRegular.copyWith(
              color: darkText,
              // fontSize: 10,
              height: 1.80,
              letterSpacing: 0.20,
            ),
          ),
          verticalMargin12,
          Container(
            width: 100.w,
            height: 120,
            decoration: ShapeDecoration(
              color: const Color(0xFFFEF1E8),
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 0.50, color: Color(0xFFFCBF94)),
                borderRadius: BorderRadius.circular(2.57),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  Assets.icons.uploadIcon.path,
                  width: 15.w,
                  color: colorPrimary,
                ),
                verticalMargin8,
                Text(
                  'Upload your File',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.bodyMDSemiBold.copyWith(
                    color: blackText,
                    fontSize: 12,
                    height: 1.20,
                  ),
                ),
                Text(
                  'Supported formates: JPEG, PNG, PDF',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.bodySMRegular.copyWith(
                    color: darkText,
                    height: 1.80,
                    letterSpacing: 0.16,
                  ),
                )
              ],
            ),
          ).gestures(
            onTap: widget.onPressed,
          ),
        ],
      );
}
