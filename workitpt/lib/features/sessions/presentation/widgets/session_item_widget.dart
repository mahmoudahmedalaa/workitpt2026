import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';

import '../../../../config/typography.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/spacing.dart';
import '../../../../core/export.dart';
import '../../../../core/utils/concat_image_url.dart';
import '../../data/models/session_response_model.dart';
import 'session_item_info.dart';
import 'session_slider_item.dart';

class SessionItemWidget extends StatefulWidget {
  final SessionResponseModel model;
  final VoidCallback onPressed;
  final String role;
  const SessionItemWidget({
    super.key,
    required this.model,
    required this.onPressed,
    required this.role,
  });

  @override
  State<SessionItemWidget> createState() => _SessionItemWidgetState();
}

class _SessionItemWidgetState extends State<SessionItemWidget> {
  int dotIndex = 0;

  String? isPaid;

  @override
  void initState() {
    isPaid = widget.model.booked! ? 'Paid' : null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => AnimatedContainer(
        curve: Curves.easeIn,
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.only(bottom: 20),
        padding: allPadding12,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 5,
                offset: const Offset(0, 4),
                spreadRadius: 3)
          ],
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: Column(
          children: [
            Stack(
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
                    enableInfiniteScroll: true,
                    pauseAutoPlayOnTouch: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        dotIndex = index;
                      });
                    },
                    aspectRatio: 320 / 128,
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
                                gradient: sessionGradient,
                                image: DecorationImage(
                                  image: AssetImage(Assets.images.loginBg.path),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                          : SessionSliderItem(
                              imageLink: concatImageUrl(
                                widget.model.images![index],
                              ),
                            ),
                ),
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
                  ).positioned(bottom: 12, right: 0, left: 0)
                else
                  const SizedBox(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (isPaid != null)
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(26),
                          color: isPaid!.contains('Paid')
                              ? colorPrimary
                              : lightPrimary,
                        ),
                        child: Text(
                          isPaid!.contains('Paid') ? 'Paid' : 'Booked',
                          style: AppTextStyle.bodyMDRegular.copyWith(
                              color: isPaid!.contains('Paid')
                                  ? Colors.white
                                  : blackText),
                        ),
                      )
                    else
                      SizedBox(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
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
                ).padding(all: 8).alignment(Alignment.topCenter),
              ],
            ),
            verticalMargin12,
            SessionItemInfoWidget(
              role: widget.role,
              model: widget.model,
            )
          ],
        ),
      ).gestures(onTap: widget.onPressed);
}
