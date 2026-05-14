import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sizer/sizer.dart';
import 'package:workitpt/features/trainer/data/models/trainer_model.dart';

import '../../../../config/typography.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/spacing.dart';
import '../../../../core/export.dart';
import '../../../../core/routes/app_router.dart';
import '../../../../core/utils/concat_image_url.dart';
import 'specialization_chip.dart';

class RecommendedTrainerCard extends StatefulWidget {
  final TrainerModel trainer;
  const RecommendedTrainerCard({super.key, required this.trainer});

  @override
  State<RecommendedTrainerCard> createState() => _RecommendedTrainerCardState();
}

class _RecommendedTrainerCardState extends State<RecommendedTrainerCard> {
  int dotIndex = 0;

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Color(0x0C000000),
              blurRadius: 46,
              // ignore: use_named_constants
              offset: Offset(0, 0),
              spreadRadius: 0,
            )
          ],
        ),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                CarouselSlider.builder(
                  options: CarouselOptions(
                    autoPlayCurve: Curves.easeInOut,
                    autoPlay: widget.trainer.images != null &&
                        widget.trainer.images!.length > 1,
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 400),
                    autoPlayInterval: const Duration(milliseconds: 5000),
                    initialPage: 0,
                    enlargeCenterPage: false,
                    enableInfiniteScroll: true,
                    pauseAutoPlayOnTouch: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        dotIndex = index;
                      });
                    },
                    aspectRatio: 10 / 4,
                    viewportFraction: 1,
                  ),
                  itemCount: widget.trainer.images?.length ?? 0,
                  itemBuilder: (context, index, realIndex) =>
                      widget.trainer.images == null ||
                              widget.trainer.images!.isEmpty
                          ? Container(
                              decoration: BoxDecoration(
                                gradient: sessionGradient,
                                image: DecorationImage(
                                  image: AssetImage(Assets.images.loginBg.path),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            )
                          : CachedNetworkImage(
                              imageUrl:
                                  concatImageUrl(widget.trainer.images![index]),
                              fit: BoxFit.cover,
                              width: 100.w,
                            ).clipRRect(all: 8),
                ),
                Positioned(
                  bottom: 12,
                  right: 0,
                  left: 0,
                  child: widget.trainer.images != null &&
                          widget.trainer.images!.length > 1
                      ? DotsIndicator(
                          dotsCount: widget.trainer.images!.isEmpty
                              ? 1
                              : widget.trainer.images!.length,
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
                        )
                      : const SizedBox(),
                )
              ],
            ).width(100.w),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${widget.trainer.trainerName}',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: AppTextStyle.bodyLgSemiBold.copyWith(
                        color: const Color(0xFF1A1A1A),
                      ),
                    ).expanded(),
                    RatingBar.builder(
                      itemBuilder: (context, index) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemSize: 16,
                      allowHalfRating: true,
                      initialRating: widget.trainer.averageRating ?? 0,
                      maxRating: 5,
                      unratedColor: shadowColor,
                      onRatingUpdate: (val) {},
                      ignoreGestures: true,
                    )
                  ],
                ),
                verticalMargin16,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Specialization',
                          style: TextStyle(
                            color: darkText,
                            fontSize: 12,
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.24,
                          ),
                        ),
                        verticalMargin8,
                        Wrap(
                          children: [
                            ...List.generate(
                              widget.trainer.specialization!.length > 2
                                  ? 2
                                  : widget.trainer.specialization?.length ?? 0,
                              (index) => SpecializationChip(
                                chipTitle:
                                    widget.trainer.specialization![index],
                              ),
                            )
                          ],
                        ),
                      ],
                    ).expanded(),
                    Row(
                      children: [
                        Text(
                          'Sessions',
                          style: AppTextStyle.bodySMRegular.copyWith(
                            color: darkText,
                          ),
                        ),
                        horizontalMargin8,
                        Text(
                          '15',
                          style: AppTextStyle.bodyLgSemiBold.copyWith(
                            color: const Color(0xFF444444),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ).padding(all: 16),
          ],
        ),
      ).gestures(
        onTap: () =>
            context.router.push(TrainerDetailRoute(model: widget.trainer)),
      );
}
