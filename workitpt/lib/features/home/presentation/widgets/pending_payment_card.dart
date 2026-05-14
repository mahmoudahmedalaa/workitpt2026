import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sizer/sizer.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:workitpt/core/utils/concat_image_url.dart';
import 'package:workitpt/core/utils/date_util.dart';
import 'package:workitpt/core/utils/text_formatter.dart';
import 'package:workitpt/features/booking/data/model/booking_model.dart';

import '../../../../config/typography.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/spacing.dart';
import '../../../../core/export.dart';
import '../../../../core/routes/app_router.dart';
import 'booked_row_item.dart';

class PendingPaymentCard extends StatelessWidget {
  final BookingModel model;
  final bool isTrainer;

  PendingPaymentCard({
    super.key,
    required this.model,
    this.isTrainer = false,
  });

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: isTrainer
            ? null
            : () {
                if (model.session!.pendingBookingId != null ||
                    model.session!.pendingBookingId != '') {
                  context.router.push(
                    PaymentCardRoute(
                      bookingId: [model.id!],
                    ),
                  );
                } else {
                  context.router.push(
                    UserSessionDetailRoute(
                      model: model.session!,
                    ),
                  );
                }
              },
        child: Container(
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
                blurRadius: 3,
              )
            ],
          ),
          child: Column(
            children: [
              Row(
                // mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    model.session?.session ?? '', //workout type
                    maxLines: 2,
                    style: AppTextStyle.subHeadLgSemiBold
                        .copyWith(color: colorPrimary),
                  ).expanded(flex: 1),
                  UserWidget(
                    name: model.session?.trainer?.firstName ?? '',
                    avatar: model.session?.trainer?.avatar ?? '',
                    rating: 4,
                  ).expanded(flex: 1),
                ],
              ),
              verticalMargin8,
              BookedRowItem(
                text1:
                    '${model.dateFrom!.getFormattedDateOnly()} (${model.timeFrom} - ${model.timeTo})',
                text2:
                    'Expires in: ${timeago.format(model.dateFrom!, locale: 'en_short', allowFromNow: true)}',
              ),
              verticalMargin4,
              BookedRowItem(
                text1: model.session?.sessionType ?? ''.capitalizeFirst(),
                text2: model.session?.difficultyLevel ?? ''.capitalizeFirst(),
              ),
              verticalMargin4,
              BookedRowItem(
                text1: model.session!.location == 'Online'
                    ? model.session!.location!
                    : model.session!.mapLocation!,
                text2: '\$${model.session?.price}',
                text2color: colorPrimary,
              ),
            ],
          ),
        ),
      );
}

class UserWidget extends StatelessWidget {
  final String name;
  final String avatar;
  final double rating;

  const UserWidget(
      {super.key,
      required this.name,
      required this.avatar,
      required this.rating});

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: CachedNetworkImageProvider(concatImageUrl(avatar)),
                      fit: BoxFit.cover),
                  border: Border.all(
                    width: 0.5,
                    color: colorPrimary,
                  ),
                ),
              ).flexible(),
              horizontalMargin4,
              Text(
                name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyle.subHeadLgBold.copyWith(color: blackText),
              ).expanded(),
            ],
          ),
          RatingBar.builder(
            itemBuilder: (context, index) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            itemSize: 12,
            allowHalfRating: true,
            initialRating: rating,
            maxRating: 5,
            ignoreGestures: true,
            unratedColor: shadowColor,
            onRatingUpdate: (val) {},
          )
        ],
      ).width(30.w);
}
