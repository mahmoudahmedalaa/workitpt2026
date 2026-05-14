import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../config/typography.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/spacing.dart';
import '../../../../gen/assets.gen.dart';

class BookingRequestWidget extends StatelessWidget {
  const BookingRequestWidget({super.key});

  @override
  Widget build(BuildContext context) => Container(
        width: 100.w,
        margin: const EdgeInsets.only(bottom: 16),
        padding: allPadding12,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: darkText.withOpacity(0.2),
                  offset: const Offset(0, 4),
                  spreadRadius: 0.5,
                  blurRadius: 3)
            ]),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.asset(
                    Assets.images.loginPic.path,
                    height: 44,
                    width: 40,
                    fit: BoxFit.cover,
                  ),
                ),
                horizontalMargin12,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Weightlifting Session',
                        style: AppTextStyle.subHeadSMRegular,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'John Smith',
                            style: AppTextStyle.tinySMRegular,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 1.5.w, horizontal: 2.w),
                            decoration: BoxDecoration(
                              color: lightPrimary,
                              borderRadius: BorderRadius.circular(8.w),
                            ),
                            child: Text(
                              'Weightlifting',
                              style: AppTextStyle.tinySMRegular
                                  .copyWith(color: colorPrimary),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset(
                            Assets.icons.clock.path,
                            height: 14,
                            width: 14,
                          ),
                          horizontalMargin4,
                          Text(
                            '22 Sept (19:00 - 20:00)',
                            style: AppTextStyle.tinySMRegular
                                .copyWith(color: darkText),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // verticalMargin12,
            // Row(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     InkWell(
            //       onTap: () {},
            //       child: Container(
            //         padding:
            //             const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            //         decoration: BoxDecoration(
            //             color: colorPrimary,
            //             borderRadius: BorderRadius.circular(40)),
            //         child: Text(
            //           'Accept',
            //           style: AppTextStyle.bodySMRegular
            //               .copyWith(color: Colors.white),
            //         ),
            //       ),
            //     ),
            //     horizontalMargin16,
            //     InkWell(
            //       onTap: () {},
            //       child: Container(
            //         padding:
            //             const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            //         decoration: BoxDecoration(
            //             color: buttonBG,
            //             borderRadius: BorderRadius.circular(40)),
            //         child: Text(
            //           'Reject',
            //           style: AppTextStyle.bodySMRegular
            //               .copyWith(color: colorPrimary),
            //         ),
            //       ),
            //     ),
            //   ],
            // )
          ],
        ),
      );
}
