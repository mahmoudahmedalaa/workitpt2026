import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

enum ButtonWidth { large, small }

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.buttonText,
    this.onPressed,
    this.buttonWidth,
    this.padding = const EdgeInsets.all(10),
    this.duration = const Duration(seconds: 5),
    this.suffixWidget,
    this.prefixWidget,
    this.textColor,
    this.backgroundColor,
    this.outlinedBorder = const StadiumBorder(),
  });

  final Color? backgroundColor;
  final String buttonText;
  final ButtonWidth? buttonWidth;
  final Duration duration;
  final GestureTapCallback? onPressed;
  final OutlinedBorder outlinedBorder;
  final EdgeInsets padding;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final Color? textColor;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onPressed,
        child: Container(
          width: buttonWidth == ButtonWidth.small
              ? MediaQuery.of(context).size.width / 2.5
              : MediaQuery.of(context).size.width / 1.10,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          decoration: BoxDecoration(
              color: backgroundColor ?? colorPrimary,
              borderRadius: BorderRadius.circular(32)),
          margin: padding,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              prefixWidget ?? const SizedBox.shrink(),
              Text(
                buttonText,
                style: TextStyle(
                  color: textColor ?? Colors.white,
                  fontSize: 14,
                  letterSpacing: 0.2,
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w600,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              suffixWidget ??
                  const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 24,
                  ),
            ],
          ),
        ),
      );
}
