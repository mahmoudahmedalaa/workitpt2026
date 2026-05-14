import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/constants/app_colors.dart';

class ChatIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget iconChild;
  final Color? backgroundCololr;
  const ChatIconButton({
    super.key,
    required this.onPressed,
    this.backgroundCololr,
    required this.iconChild,
  });

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onPressed,
        child: Container(
          height: 12.w,
          width: 12.w,
          margin: EdgeInsets.only(right: 3.w, bottom: 4.w),
          decoration: BoxDecoration(
              color: colorBackground, borderRadius: BorderRadius.circular(100)),
          // padding: EdgeInsets.all(16.0),
          child: iconChild,
        ),
      );
}
