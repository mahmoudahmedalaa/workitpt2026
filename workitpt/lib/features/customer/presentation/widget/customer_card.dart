import 'package:cached_network_image/cached_network_image.dart';
import 'package:workitpt/core/utils/concat_image_url.dart';

import '../../../../config/typography.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/spacing.dart';
import '../../../../core/export.dart';
import '../../data/model/customer_model.dart';

class CustomerCard extends StatelessWidget {
  final VoidCallback onPressed;
  final CustomerModel model;
  const CustomerCard({super.key, required this.onPressed, required this.model});

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
                  '${model.customerName}',
                  style: TextStyle(
                    color: Color(0xFF1A1A1A),
                    fontSize: 18,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                verticalMargin8,
                Text(
                  '${model.intro ?? ''}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Color(0xFF444444),
                    fontSize: 14,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w400,
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
                          'Amount Received',
                          style: AppTextStyle.bodySMRegular.copyWith(
                            color: darkText,
                          ),
                        ),
                      ],
                    ).height(20),
                    horizontalMargin8,
                    Text(
                      '${model.amountReceived}',
                      style: AppTextStyle.bodyLgSemiBold.copyWith(
                        color: colorPrimary,
                      ),
                    )
                  ],
                )
              ],
            ).padding(left: 16).expanded()
          ],
        ).padding(all: 16),
      ).gestures(onTap: onPressed);
}
