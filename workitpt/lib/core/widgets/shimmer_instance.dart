import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerInstanceWidget extends StatelessWidget {
  final Widget child;
  final ShimmerDirection direction;

  const ShimmerInstanceWidget(
      {Key? key, required this.child, this.direction = ShimmerDirection.ltr})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        period: const Duration(milliseconds: 1600),
        baseColor: Colors.grey.withOpacity(0.16),
        highlightColor: Colors.black.withOpacity(0.3),
        child: child);
  }
}
