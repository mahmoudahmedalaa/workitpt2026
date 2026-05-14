import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgIconButton extends StatelessWidget {
  final String svgPath;
  final VoidCallback onPressed;
  final Color? iconColor;
  final double iconSize;

  const SvgIconButton(
      {super.key,
      required this.svgPath,
      required this.onPressed,
      this.iconColor,
      this.iconSize = 40});

  @override
  Widget build(BuildContext context) => IconButton(
        onPressed: onPressed,
        icon: SvgPicture.asset(
          svgPath,
          colorFilter: iconColor != null
              ? ColorFilter.mode(iconColor!, BlendMode.srcIn)
              : null,
        ),
        iconSize: iconSize,
      );
}
