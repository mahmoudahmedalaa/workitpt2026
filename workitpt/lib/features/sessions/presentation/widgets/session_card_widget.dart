import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:sizer/sizer.dart';
import 'package:workitpt/core/utils/date_util.dart';

import '../../../../config/typography.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/spacing.dart';
import '../../../../core/export.dart';
import '../../../../core/routes/app_router.dart';
import '../../../../core/utils/concat_image_url.dart';
import '../../data/models/session_response_model.dart';
import 'session_slider_item.dart';
import 'trainer_info_widget.dart';

class SessionCardWidget extends StatefulWidget {
  final SessionResponseModel model;
  final String? isPaid;
  final bool isLarge;
  final VoidCallback? isPressed;

  const SessionCardWidget({
    super.key,
    required this.model,
    this.isPaid,
    this.isPressed,
    this.isLarge = false,
  });

  @override
  State<SessionCardWidget> createState() => _SessionCardWidgetState();
}

class _SessionCardWidgetState extends State<SessionCardWidget> {
  int dotIndex = 0;

  @override
  Widget build(BuildContext context) => AnimatedContainer(
        curve: Curves.easeIn,
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.only(bottom: 12),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: IgnorePointer(
          ignoring: true,
          child: AspectRatio(
            aspectRatio: widget.isLarge ? 327 / 170 : 327 / 135,
            child: Stack(
              children: [
                CarouselSlider.builder(
                  options: CarouselOptions(
                    autoPlayCurve: Curves.easeInOut,
                    autoPlay: widget.model.images != null &&
                        widget.model.images!.length > 1,
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 400),
                    autoPlayInterval: const Duration(milliseconds: 5000),
                    initialPage: 0,
                    enlargeCenterPage: false,
                    // enableInfiniteScroll: true,
                    pauseAutoPlayOnTouch: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        dotIndex = index;
                      });
                    },
                    aspectRatio: widget.isLarge ? 327 / 170 : 327 / 135,
                    viewportFraction: 1,
                  ),
                  itemCount: widget.model.images?.length ?? 0,
                  // itemCount: 0,
                  itemBuilder: (context, index, realIndex) =>
                      widget.model.images == null ||
                              widget.model.images!.isEmpty
                          ? Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                gradient: authGradient,
                                image: DecorationImage(
                                  image: AssetImage(Assets.images.loginBg.path),
                                  fit: BoxFit.cover,
                                  colorFilter: ColorFilter.mode(
                                      Colors.black.withOpacity(0.2),
                                      BlendMode.darken),
                                ),
                              ),
                            )
                          : SessionSliderItem(
                              imageLink:
                                  concatImageUrl(widget.model.images![index]),
                            ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (widget.isPaid != null)
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(26),
                              color: widget.isPaid!.contains('Paid')
                                  ? colorPrimary
                                  : lightPrimary,
                            ),
                            child: Text(
                              widget.isPaid!.contains('Paid')
                                  ? 'Paid'
                                  : 'Booked',
                              style: AppTextStyle.bodyMDRegular.copyWith(
                                  color: widget.isPaid!.contains('Paid')
                                      ? Colors.white
                                      : blackText),
                            ),
                          )
                        else
                          SizedBox(),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(26),
                            color: lightPrimary,
                          ),
                          child: Text(
                            widget.model.sessionType ?? '1-on-1',
                            style: AppTextStyle.bodyMDRegular,
                          ),
                        ),
                      ],
                    ).alignment(Alignment.topCenter).expanded(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.model.session ?? '',
                          style: AppTextStyle.subHeadLgSemiBold
                              .copyWith(color: Colors.white),
                          overflow: TextOverflow.ellipsis,
                        ).flexible(),
                        TrainerInfoWidget(
                          name: widget.model.trainer?.firstName ?? '',
                          avatar: widget.model.trainer?.avatar ?? '',
                        ).width(40.w),
                      ],
                    ),
                    if (widget.isLarge) verticalMargin4,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: [
                            const VerticalDivider(
                              thickness: 3,
                              width: 6,
                              indent: 3,
                              endIndent: 3,
                              color: Colors.white,
                            ),
                            horizontalMargin4,
                            Text(
                              '${(widget.model.date ?? widget.model.dateFrom)!.getFormattedDateOnly()} (${widget.model.timeFrom} - ${widget.model.timeTo})',
                              style: AppTextStyle.bodySMRegular
                                  .copyWith(color: Colors.white),
                            ),
                          ],
                        ).flexible(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const VerticalDivider(
                              thickness: 3,
                              width: 6,
                              indent: 3,
                              endIndent: 3,
                              color: Colors.white,
                            ),
                            horizontalMargin4,
                            Text(
                              widget.model.location ?? '',
                              maxLines: 1,
                              style: AppTextStyle.bodySMRegular
                                  .copyWith(color: Colors.white),
                            ),
                          ],
                        ).width(30.w),
                      ],
                    ).height(20),
                    if (widget.isLarge) verticalMargin4,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const VerticalDivider(
                          thickness: 3,
                          width: 6,
                          indent: 3,
                          endIndent: 3,
                          color: Colors.white,
                        ),
                        horizontalMargin4,
                        Text(
                          widget.model.selectType!.contains('one_time')
                              ? 'One Time'
                              : 'Recurring',
                          style: AppTextStyle.bodySMRegular
                              .copyWith(color: Colors.white),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ).height(20),
                    if (widget.isLarge) verticalMargin4,
                  ],
                ).padding(left: 12, right: 12, top: 8, bottom: 16),
                if (widget.model.images != null &&
                    widget.model.images!.length > 1)
                  DotsIndicator(
                    dotsCount: widget.model.images!.isEmpty
                        ? 1
                        : widget.model.images!.length,
                    position: dotIndex,
                    decorator: const DotsDecorator(
                      color: Colors.white,
                      activeColor: colorPrimary,
                      spacing: EdgeInsets.symmetric(
                        horizontal: 2,
                      ),
                      size: Size(6, 6),
                      activeSize: Size(6, 6),
                    ),
                  ).positioned(
                      bottom: widget.isLarge ? 12 : 8, right: 0, left: 0)
                else
                  const SizedBox(),
              ],
            ),
          ),
        ),
      ).gestures(
          onTap: widget.isPressed ??
              () {
                context.router.push(UserSessionDetailRoute(
                    model: widget.model, isPaid: widget.isPaid));
              });
}
