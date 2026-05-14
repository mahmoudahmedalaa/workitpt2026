import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sizer/sizer.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:workitpt/core/utils/concat_image_url.dart';

import '../../../../config/typography.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/spacing.dart';
import '../../../../core/export.dart';
import '../../../sessions/data/models/session_response_model.dart';
import 'booked_row_item.dart';

class BookedWidget extends StatelessWidget {
  final SessionResponseModel? model;
  final bool showDecoration;
  BookedWidget({super.key, this.model, this.showDecoration = true});

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () {
          // context.router.push(BookingDetailsRoute(id: model!.id!));
        },
        child: Container(
          width: 100.w,
          margin: const EdgeInsets.only(bottom: 16),
          padding: allPadding12,
          decoration: showDecoration
              ? BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                      BoxShadow(
                          color: darkText.withOpacity(0.2),
                          offset: const Offset(0, 4),
                          spreadRadius: 0.5,
                          blurRadius: 3)
                    ])
              : BoxDecoration(),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    model?.session ?? '', //workout type
                    maxLines: 2,
                    style: AppTextStyle.subHeadLgSemiBold
                        .copyWith(color: colorPrimary),
                  ).expanded(flex: 2),
                  UserWidget(
                    name: model?.trainer?.firstName ?? '',
                    avatar: model?.trainer?.avatar ?? '',
                    rating: 4,
                  ).expanded(flex: 1),
                ],
              ),
              verticalMargin8,
              BookedRowItem(
                text1: '${model?.timeFrom} - ${model?.timeTo}',
                text2:
                    'Expires in: ${timeago.format(model!.dateFrom!, locale: 'en_short', allowFromNow: true)}',
              ),
              verticalMargin4,
              BookedRowItem(
                text1: model?.sessionType ?? '',
                text2: model?.difficultyLevel ?? '',
              ),
              verticalMargin4,
              BookedRowItem(
                text1: model?.location ?? '',
                text2: '\$${model?.price}',
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
                  border: Border.all(
                    width: 0.5,
                    color: colorPrimary,
                  ),
                ),
                child: avatar.isNotEmpty
                    ? CachedNetworkImage(imageUrl: concatImageUrl(avatar))
                    : Image.asset(Assets.images.onboard1.path),
              ),
              horizontalMargin4,
              Text(
                name,
                maxLines: 2,
                style: AppTextStyle.subHeadLgBold.copyWith(color: blackText),
              ),
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
      );
}
