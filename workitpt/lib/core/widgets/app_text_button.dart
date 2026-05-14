import 'package:flutter/material.dart';

import '../../config/typography.dart';
import '../constants/app_colors.dart';

class AppTextButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const AppTextButton({
    super.key,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        child: Text(
          text,
          style: AppTextStyle.bodySMSemiBold.copyWith(color: colorPrimary),
        ),
      );
}
