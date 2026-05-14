import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:workitpt/core/widgets/shimmer_instance.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/spacing.dart';
import '../../../../core/widgets/shimmer_container.dart';

class TrainerCardShimmer extends StatelessWidget {
  const TrainerCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16, left: 16, bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 16,
            offset: Offset(0, 8),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 4,
            offset: Offset.zero,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ShimmerInstanceWidget(
            child: ShimmerContainer(
              width: 100,
              height: 110,
              color: darkText,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ShimmerInstanceWidget(
                child: ShimmerContainer(
                  height: 20,
                  width: 100,
                ),
              ),
              verticalMargin8,
              ShimmerInstanceWidget(
                child: ShimmerContainer(
                  height: 15,
                  width: 50,
                ),
              ),
              verticalMargin8,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ShimmerInstanceWidget(
                    child: ShimmerContainer(
                      height: 15,
                      width: 50,
                    ),
                  ),
                  ShimmerInstanceWidget(
                    child: ShimmerContainer(
                      height: 15,
                      width: 50,
                    ),
                  ),
                ],
              ),
              verticalMargin8,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ShimmerInstanceWidget(
                    child: ShimmerContainer(
                      height: 15,
                      width: 50,
                    ),
                  ),
                  ShimmerInstanceWidget(
                    child: ShimmerContainer(
                      height: 15,
                      width: 50,
                    ),
                  ),
                ],
              )
            ],
          ).padding(left: 16).expanded()
        ],
      ).padding(all: 16),
    );
  }
}
