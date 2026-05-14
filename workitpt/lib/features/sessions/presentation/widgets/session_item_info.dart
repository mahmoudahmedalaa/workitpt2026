import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sizer/sizer.dart';
import 'package:workitpt/features/sessions/data/models/session_response_model.dart';

import '../../../../config/typography.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/spacing.dart';
import '../../../../core/export.dart';
import '../../../../core/utils/date_util.dart';
import '../../../../core/utils/text_formatter.dart';
import 'trainer_info_widget.dart';

class SessionItemInfoWidget extends StatefulWidget {
  final SessionResponseModel model;
  final String role;
  const SessionItemInfoWidget(
      {super.key, required this.model, required this.role});

  @override
  State<SessionItemInfoWidget> createState() => _SessionItemInfoWidgetState();
}

class _SessionItemInfoWidgetState extends State<SessionItemInfoWidget> {
  @override
  Widget build(BuildContext context) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  widget.model.sessionTitle?.capitalizeEachFirst() ?? '',
                  maxLines: 2,
                  style:
                      AppTextStyle.subHeadLgSemiBold.copyWith(color: blackText),
                ),
              ),
              if (widget.role == 'USER')
                TrainerInfoWidget(
                  name: widget.model.trainer?.firstName ?? '',
                  avatar: widget.model.trainer?.avatar ?? '',
                  titleColor: Colors.black,
                ).width(30.w),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.model.session ?? '',
                maxLines: 2,
                style: AppTextStyle.subHeadSMRegular.copyWith(color: darkText),
              ).flexible(flex: 2),
              if (widget.role == 'USER')
                RatingBar.builder(
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemSize: 16,
                  allowHalfRating: true,
                  initialRating: 4.5,
                  maxRating: 5,
                  unratedColor: shadowColor,
                  ignoreGestures: true,
                  onRatingUpdate: (val) {},
                ).flexible(flex: 1)
            ],
          ),
          verticalMargin8,
          // if (widget.model.dateFrom != null)
          Row(
            children: [
              verticalDivider,
              horizontalMargin4,
              Text(
                '${widget.model.date!.getFormattedDateOnly()} (${widget.model.timeFrom} - ${widget.model.timeTo})',
                style: AppTextStyle.bodySMRegular.copyWith(color: blackText),
              ),
            ],
          ).height(20),
          verticalMargin8,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalDivider,
              horizontalMargin4,
              Text(
                widget.model.selectType!.contains('one_time')
                    ? 'One Time'
                    : 'Recurring'.capitalizeEachFirst(),
                style: AppTextStyle.bodySMRegular.copyWith(color: blackText),
              ),
              Spacer(),
              verticalDivider,
              horizontalMargin4,
              Text(
                widget.model.difficultyLevel?.capitalizeEachFirst() ??
                    'Beginner',
                style: AppTextStyle.bodySMRegular.copyWith(color: blackText),
              ),
            ],
          ).height(20),
          verticalMargin8,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (widget.model.mapLocation != null)
                Row(
                  children: [
                    verticalDivider,
                    horizontalMargin4,
                    Text(
                      '${widget.model.mapLocation?.capitalizeEachFirst()}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:
                          AppTextStyle.bodySMRegular.copyWith(color: blackText),
                    ).width(60.w),
                  ],
                ),
              if (widget.model.price != null)
                Text(
                  '\$${widget.model.price}',
                  maxLines: 1,
                  style: AppTextStyle.bodyLgBold.copyWith(color: colorPrimary),
                ),
            ],
          ).height(20),
          verticalMargin12,
          if (widget.role == 'USER' && !(widget.model.booked!)) ...[
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                    color: lightPrimary,
                    border: Border.all(color: colorPrimary, width: 1),
                    borderRadius: BorderRadius.circular(6)),
                child: Text(
                  'Book Now',
                  style:
                      AppTextStyle.tinySMRegular.copyWith(color: colorPrimary),
                ),
              ),
            ),
            verticalMargin4,
          ]
        ],
      );
}
