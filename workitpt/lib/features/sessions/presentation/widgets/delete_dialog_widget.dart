import 'package:sizer/sizer.dart';

import '../../../../config/typography.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/spacing.dart';
import '../../../../core/export.dart';

class DeleteDialogWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isBooked;
  const DeleteDialogWidget(
      {super.key, required this.onPressed, required this.isBooked});

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
              Assets.images.deleteImage.path,
              height: 52,
              width: 52,
            ),
            verticalMargin16,
            Text(
              isBooked
                  ? 'The session you are trying to delete \nhas already been booked. Do you want to \nprocessed?'
                  : 'Are you sure you want to delete this \nSession?',
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
                  onPressed: () => context.router.pop(),
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
                  onPressed: () {
                    onPressed();
                    context.router.pop();
                  },
                ),
              ],
            )
          ],
        ).width(100.w),
      );
}
