import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sizer/sizer.dart';
import 'package:workitpt/core/utils/date_util.dart';
import 'package:workitpt/features/booking/data/model/booking_model.dart';

import '../../../../config/typography.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/spacing.dart';
import '../../../../core/export.dart';
import '../../../../core/routes/app_router.dart';
import '../../../../core/utils/concat_image_url.dart';
import '../../../sessions/presentation/widgets/session_slider_item.dart';
import '../../../sessions/presentation/widgets/trainer_info_widget.dart';

class BookingCardWidget extends StatefulWidget {
  final BookingModel model;
  const BookingCardWidget({super.key, required this.model});

  @override
  State<BookingCardWidget> createState() => _BookingCardWidgetState();
}

class _BookingCardWidgetState extends State<BookingCardWidget> {
  int dotIndex = 0;

  @override
  Widget build(BuildContext context) {
    final m = widget.model;
    return AnimatedContainer(
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
          aspectRatio: 327 / 170,
          child: Stack(
            children: [
              CarouselSlider.builder(
                options: CarouselOptions(
                  autoPlayCurve: Curves.easeInOut,
                  autoPlay: m.session!.images != null &&
                      m.session!.images!.length > 1,
                  autoPlayAnimationDuration: const Duration(milliseconds: 400),
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
                  aspectRatio: 327 / 170,
                  viewportFraction: 1,
                ),
                itemCount: m.session!.images?.length ?? 0,
                // itemCount: 0,
                itemBuilder: (context, index, realIndex) =>
                    m.session!.images == null || m.session!.images!.isEmpty
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
                                concatImageUrl(m.session!.images![index]),
                          ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (widget.model.isPaid != null)
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(26),
                            color: widget.model.isPaid!.contains('Paid')
                                ? colorPrimary
                                : lightPrimary,
                          ),
                          child: Text(
                            widget.model.isPaid!.contains('Paid')
                                ? 'Paid'
                                : 'Booked',
                            style: AppTextStyle.bodyMDRegular.copyWith(
                                color: widget.model.isPaid!.contains('Paid')
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
                          m.session!.sessionType ?? '1-on-1',
                          style: AppTextStyle.bodyMDRegular,
                        ),
                      ),
                    ],
                  ).alignment(Alignment.topRight).expanded(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        m.session!.session ?? '',
                        style: AppTextStyle.subHeadLgSemiBold
                            .copyWith(color: Colors.white),
                        overflow: TextOverflow.ellipsis,
                      ).flexible(),
                      TrainerInfoWidget(
                        name: m.session!.trainer?.firstName ?? '',
                        avatar: m.session!.trainer?.avatar ?? '',
                      ).width(45.w),
                    ],
                  ),
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
                  ).alignment(Alignment.centerRight),
                  // verticalMargin12,
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
                            '${m.dateFrom!.getFormattedDateOnly()} (${widget.model.timeFrom} - ${widget.model.timeTo})',
                            style: AppTextStyle.bodySMRegular
                                .copyWith(color: Colors.white),
                          ),
                        ],
                      ).flexible(),
                    ],
                  ).height(20),
                  // verticalMargin8,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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
                            m.session!.selectType!.contains('one_time')
                                ? 'One Time'
                                : 'Recurring',
                            style: AppTextStyle.bodySMRegular
                                .copyWith(color: Colors.white),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ).height(20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const VerticalDivider(
                            thickness: 3,
                            width: 6,
                            indent: 3,
                            endIndent: 3,
                            color: colorPrimary,
                          ),
                          horizontalMargin4,
                          Text(
                            '\$${m.session!.price}',
                            style: AppTextStyle.bodyMDSemiBold
                                .copyWith(color: colorPrimary),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ).height(20),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
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
                        m.session!.location == 'Online'
                            ? m.session!.location!
                            : m.session!.mapLocation!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyle.bodySMRegular
                            .copyWith(color: Colors.white),
                      ).width(70.w),
                    ],
                  ).height(20),
                  // verticalMargin8,
                ],
              ).padding(left: 12, right: 12, top: 8, bottom: 16),
              if (m.session!.images != null && (m.session!.images!.length > 1))
                DotsIndicator(
                  dotsCount: m.session!.images!.isEmpty
                      ? 1
                      : m.session!.images!.length,
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
                ).positioned(bottom: 8, right: 0, left: 0)
              else
                const SizedBox(),
            ],
          ),
        ),
      ),
    ).gestures(onTap: () {
      final m = widget.model;
      context.router.push(
          UserSessionDetailRoute(model: m.session!, isPaid: m.isPaid ?? ''));
    });
  }
}
