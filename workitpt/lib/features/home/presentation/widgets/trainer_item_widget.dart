import 'package:cached_network_image/cached_network_image.dart';
import 'package:sizer/sizer.dart';
import 'package:workitpt/core/utils/concat_image_url.dart';
import 'package:workitpt/features/trainer/data/models/trainer_model.dart';

import '../../../../config/typography.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/spacing.dart';
import '../../../../core/export.dart';
import '../../../../core/routes/app_router.dart';

class TrainerItemWidget extends StatelessWidget {
  final TrainerModel model;
  const TrainerItemWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) => Container(
        width: ((118 / 375) * 100).w,
        margin: const EdgeInsets.only(right: 12, bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: darkText.withOpacity(0.2),
              offset: const Offset(0, 4),
              spreadRadius: 0.5,
              blurRadius: 3,
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: CachedNetworkImageProvider(
                      concatImageUrl(model.avatar ?? '')),
                ),
                Text(
                  '${model.trainerName}',
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.subHeadSMSemiBold,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ).expanded(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Sessions',
                  style: AppTextStyle.tinySMRegular.copyWith(color: darkText),
                ),
                Text(
                  '15',
                  maxLines: 1,
                  style:
                      AppTextStyle.subHeadSMRegular.copyWith(color: blackText),
                  overflow: TextOverflow.ellipsis,
                ).flexible(),
              ],
            ),
            verticalMargin4,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Amount\nSpend',
                  maxLines: 2,
                  style: AppTextStyle.tinySMRegular.copyWith(color: darkText),
                ),
                Text(
                  '\$ 100',
                  maxLines: 1,
                  style:
                      AppTextStyle.subHeadSMRegular.copyWith(color: blackText),
                  overflow: TextOverflow.ellipsis,
                ).flexible(),
              ],
            ),
          ],
        ),
      ).gestures(
        onTap: () => context.router.push(
          TrainerDetailRoute(model: model),
        ),
      );
}
