// ignore_for_file: type_annotate_public_apis

import 'package:sizer/sizer.dart';

import '../../config/typography.dart';
import '../constants/app_colors.dart';
import '../constants/spacing.dart';
import '../export.dart';

showAlertDialog({
  required BuildContext context,
  required String message,
  required VoidCallback okBtnHandler,
  VoidCallback? cancelBtnHandler,
  String? icon,
}) {
  // set up the AlertDialog
  final alert = AppDialogWidget(
    title: message,
    icon: icon,
    onPressed: okBtnHandler,
    onCancel: cancelBtnHandler ?? () => context.router.pop(),
  );

  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) => alert,
  );
}

class AppDialogWidget extends StatelessWidget {
  final String title;
  final String? icon;
  final VoidCallback onPressed;
  final VoidCallback onCancel;
  const AppDialogWidget({
    super.key,
    required this.title,
    this.icon,
    required this.onPressed,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) => AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        contentPadding: allPadding12,
        insetPadding: allPadding16,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            verticalMargin16,
            Image.asset(
              icon ?? Assets.images.deleteImage.path,
              height: 52,
              width: 52,
            ),
            verticalMargin16,
            Text(
              title,
              textAlign: TextAlign.center,
              style: AppTextStyle.bodySMRegular.copyWith(
                color: const Color(0xFF1A1A1A),
                height: 1.8,
                letterSpacing: 0.24,
              ),
            ),
            verticalMargin16,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  child: Text(
                    'No',
                    style: AppTextStyle.subHeadSMSemiBold.copyWith(
                      color: darkText,
                      letterSpacing: 0.28,
                    ),
                  ),
                  onPressed: onCancel,
                ),
                horizontalMargin16,
                TextButton(
                  child: Text(
                    'Yes',
                    style: AppTextStyle.subHeadSMSemiBold.copyWith(
                      color: const Color(0xFFF97316),
                      letterSpacing: 0.28,
                    ),
                  ),
                  onPressed: onPressed,
                ),
              ],
            )
          ],
        ).width(100.w),
      );
}
