import 'package:flutter/material.dart';

class ShimmerContainer extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Decoration? decoration;

  const ShimmerContainer({
    Key? key,
    this.color,
    this.padding,
    this.decoration,
    this.margin,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      color: decoration == null ? color ?? Colors.white.withOpacity(.15) : null,
      decoration: decoration,
      padding: padding,
    );
  }
}
