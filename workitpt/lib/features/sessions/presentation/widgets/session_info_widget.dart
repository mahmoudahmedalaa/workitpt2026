import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:workitpt/features/sessions/data/models/session_response_model.dart';

import '../../../../config/typography.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/spacing.dart';
import '../../../../core/export.dart';
import '../../../../core/utils/date_util.dart';
import '../../../../core/utils/text_formatter.dart';
import 'trainer_info_widget.dart';

class SessionInfoWidget extends StatefulWidget {
  final SessionResponseModel model;
  const SessionInfoWidget({super.key, required this.model});

  @override
  State<SessionInfoWidget> createState() => _SessionInfoWidgetState();
}

class _SessionInfoWidgetState extends State<SessionInfoWidget> {
  @override
  Widget build(BuildContext context) => Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  widget.model.sessionTitle?.capitalizeEachFirst() ?? '',
                  maxLines: 2,
                  style:
                      AppTextStyle.subHeadLgSemiBold.copyWith(color: blackText),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Expanded(
                flex: 1,
                child: TrainerInfoWidget(
                  name: widget.model.trainer?.firstName ?? '',
                  avatar: widget.model.trainer?.avatar ?? '',
                  titleColor: Colors.black,
                ),
              ),
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
                onRatingUpdate: (val) {},
                ignoreGestures: true,
              ).flexible(flex: 1),
            ],
          ),
          verticalMargin8,
          if (widget.model.date != null)
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
                widget.model.difficultyLevel?.capitalizeEachFirst() ?? '',
                style: AppTextStyle.bodySMRegular.copyWith(color: blackText),
              ),
            ],
          ).height(20),
          verticalMargin8,
          if (widget.model.location != null || widget.model.price != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (widget.model.location != null)
                  Row(
                    children: [
                      verticalDivider,
                      horizontalMargin4,
                      Text(
                        '${widget.model.location?.capitalizeEachFirst()}',
                        style: AppTextStyle.bodySMRegular
                            .copyWith(color: blackText),
                      ),
                    ],
                  ),
                if (widget.model.price != null)
                  Row(
                    children: [
                      VerticalDivider(
                        thickness: 3,
                        width: 6,
                        indent: 3,
                        endIndent: 3,
                        color: colorPrimary,
                      ),
                      horizontalMargin4,
                      Text(
                        '\$${widget.model.price}',
                        maxLines: 2,
                        style: AppTextStyle.bodyLgBold
                            .copyWith(color: colorPrimary),
                      ),
                    ],
                  ),
              ],
            ).height(20),
          verticalMargin4,
        ],
      );
}
