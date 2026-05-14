import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../config/typography.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/spacing.dart';
import '../../../../core/utils/date_util.dart';
import '../../../../gen/assets.gen.dart';
import '../../../sessions/data/models/session_response_model.dart';

class UpcomingSessionWidget extends StatelessWidget {
  final SessionResponseModel model;

  const UpcomingSessionWidget({super.key, required this.model});

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
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 1.w, horizontal: 2.w),
                decoration: BoxDecoration(
                  color: lightPrimary,
                  borderRadius: BorderRadius.circular(8.w),
                ),
                child: Text(
                  model.session ?? '',
                  style:
                      AppTextStyle.tinySMRegular.copyWith(color: colorPrimary),
                ),
              ),
            ),
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
                        model.trainer!.firstName ?? '', //Trainer name
                        style: AppTextStyle.subHeadSMRegular,
                      ),
                      verticalMargin8,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                Assets.icons.clock.path,
                                height: 14,
                                width: 14,
                              ),
                              horizontalMargin4,
                              Text(
                                '${model.dateFrom?.getFormattedDateOnly() ?? ''} (${model.timeFrom} - ${model.timeTo})',
                                style: AppTextStyle.tinySMRegular
                                    .copyWith(color: darkText),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset(
                                Assets.icons.location.path,
                                height: 14,
                                width: 14,
                              ),
                              horizontalMargin4,
                              Text(
                                model.location ?? 'Home',
                                style: AppTextStyle.tinySMRegular
                                    .copyWith(color: darkText),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      );
}
