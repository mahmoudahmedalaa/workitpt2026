import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:workitpt/core/utils/concat_image_url.dart';

import '../../../../config/typography.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/spacing.dart';
import '../../../../core/export.dart';
import '../../data/models/trainer_model.dart';

class TrainerCard extends StatelessWidget {
  final TrainerModel model;
  const TrainerCard({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) => Container(
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
            Container(
              width: 100,
              height: 110,
              child: CachedNetworkImage(
                imageUrl: concatImageUrl(model.avatar ?? ''),
                fit: BoxFit.cover,
              ).clipRRect(all: 8),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '${model.trainerName}',
                  style: AppTextStyle.headlineSMSemiBold.copyWith(
                    color: Color(0xFF1A1A1A),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                verticalMargin8,
                Text(
                  'Fitness Trainer',
                  style: AppTextStyle.subHeadSMRegular.copyWith(
                    color: Color(0xFF444444),
                    letterSpacing: 0.28,
                  ),
                ),
                verticalMargin8,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const VerticalDivider(
                          thickness: 4,
                          width: 5,
                          color: colorPrimary,
                        ),
                        horizontalMargin4,
                        Text(
                          'Sessions',
                          style: AppTextStyle.bodySMRegular.copyWith(
                            color: darkText,
                          ),
                        ),
                      ],
                    ).height(20),
                    horizontalMargin8,
                    Text(
                      '${model.totalSessions}',
                      style: AppTextStyle.bodyLgSemiBold.copyWith(
                        color: colorPrimary,
                      ),
                    )
                  ],
                ),
                verticalMargin8,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const VerticalDivider(
                          thickness: 4,
                          width: 5,
                          color: colorPrimary,
                        ),
                        horizontalMargin4,
                        Text(
                          'Rating',
                          style: AppTextStyle.bodySMRegular.copyWith(
                            color: darkText,
                          ),
                        ),
                      ],
                    ).height(20),
                    horizontalMargin8,
                    RatingBar.builder(
                      initialRating: model.averageRating ?? 0.0,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 12,
                      itemPadding: const EdgeInsets.only(right: 1),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: print,
                      ignoreGestures: true,
                    ),
                  ],
                )
              ],
            ).padding(left: 16).expanded()
          ],
        ).padding(all: 16),
      );
}
