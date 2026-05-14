import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../config/typography.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/spacing.dart';

class IntroSliderWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final String image;
  final int index;
  final PageController pageController;
  final Widget? skipButton;

  const IntroSliderWidget({
    super.key,
    required this.title,
    required this.image,
    required this.subTitle,
    required this.pageController,
    required this.index,
    this.skipButton,
  });

  @override
  Widget build(BuildContext context) => Center(
        child: Padding(
          padding: horizontalPadding24,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ...[
                Image.asset(
                  image,
                  height: 45.h,
                ),
                SmoothPageIndicator(
                  controller: pageController, // PageController
                  count: 3,
                  effect: const ExpandingDotsEffect(
                    expansionFactor: 2,
                    dotWidth: 12,
                    dotColor: shadowColor,
                    activeDotColor: colorPrimary,
                    dotHeight: 6,
                  ),
                  onDotClicked: (index) {},
                ),
              ],
              Column(
                children: [
                  Text(
                    title,
                    style: AppTextStyle.titleMDSemiBold,
                    textAlign: TextAlign.center,
                  ),
                  verticalMargin12,
                  Text(
                    subTitle,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.bodySMRegular.copyWith(
                      color: darkText,
                      height: 1.8,
                      letterSpacing: 0.24,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
}
