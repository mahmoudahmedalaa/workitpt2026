import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sizer/sizer.dart';
import 'package:workitpt/config/typography.dart';
import 'package:workitpt/core/constants/spacing.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/export.dart';
import '../../../../../core/injection/injection.dart';
import '../../../../../core/utils/concat_image_url.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/base_view.dart';
import '../../../data/models/rating_model.dart';
import '../../../data/models/session_response_model.dart';
import '../../bloc/session_bloc.dart';
import '../../widgets/session_info_widget.dart';

@RoutePage()
class RatingView extends StatefulWidget {
  final SessionResponseModel session;

  const RatingView({super.key, required this.session});

  @override
  State<RatingView> createState() => _RatingViewState();
}

class _RatingViewState extends State<RatingView> {
  SessionBloc sessionBloc;
  int dotIndex = 0;

  _RatingViewState() : sessionBloc = getIt<SessionBloc>();
  double rating = 4.5;

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => sessionBloc,
        child: BlocListener<SessionBloc, SessionState>(
          listener: (context, state) {
            state.whenOrNull(
              onLoading: EasyLoading.show,
              onFailure: (error) {
                EasyLoading.showInfo(error!);
              },
              onRatingSuccess: (message) {
                EasyLoading.showSuccess(message);
                context.router.popUntilRoot();
              },
            );
          },
          child: BaseView(
            padding: EdgeInsets.zero,
            titleText: 'Ratings',
            appBarColor: Colors.white,
            elevation: 0,
            bottomNavigationBar: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AppButton(
                  buttonText: 'Done',
                  suffixWidget: const SizedBox(),
                  onPressed: () {
                    sessionBloc.add(SessionEvent.putRating(
                        RatingModel(rating: rating), widget.session.ratingID!));
                  },
                ),
              ],
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    CarouselSlider.builder(
                      options: CarouselOptions(
                        autoPlayCurve: Curves.easeInOut,
                        autoPlay: widget.session.images != null &&
                            widget.session.images!.length > 1,
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
                        aspectRatio: 100.w / 25.h,
                        viewportFraction: 1,
                      ),
                      itemCount: widget.session.images?.length ?? 0,
                      itemBuilder: (context, index, realIndex) => widget
                                      .session.images ==
                                  null ||
                              widget.session.images!.isEmpty
                          ? Container(
                              decoration: BoxDecoration(
                                gradient: sessionGradient,
                                image: DecorationImage(
                                  image: AssetImage(Assets.images.loginBg.path),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                          : CachedNetworkImage(
                              imageUrl:
                                  concatImageUrl(widget.session.images![index]),
                              fit: BoxFit.cover,
                              width: 100.w,
                            ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(26),
                              color: lightPrimary,
                            ),
                            child: Text(
                              widget.session.sessionType ?? '1-on-1',
                              style: AppTextStyle.bodyMDRegular,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 12,
                      right: 0,
                      left: 0,
                      child: widget.session.images != null &&
                              widget.session.images!.length > 1
                          ? DotsIndicator(
                              dotsCount: widget.session.images!.isEmpty
                                  ? 1
                                  : widget.session.images!.length,
                              position: dotIndex,
                              decorator: const DotsDecorator(
                                color: Colors.white,
                                activeColor: colorPrimary,
                                spacing: EdgeInsets.symmetric(
                                  horizontal: 2,
                                ),
                                size: Size(8, 8),
                                activeSize: Size(8, 8),
                              ),
                            )
                          : const SizedBox(),
                    )
                  ],
                ).width(100.w),
                SessionInfoWidget(model: widget.session)
                    .padding(horizontal: 16, vertical: 12),
                verticalMargin48,
                Column(
                  children: [
                    Text(
                      'Congratulations workout complete.',
                      style: AppTextStyle.headlineSMSemiBold,
                    ),
                    verticalMargin16,
                    Text(
                      'Rate your experience',
                      style:
                          AppTextStyle.bodyMDMedium.copyWith(color: darkText),
                    ),
                    verticalMargin16,
                    RatingBar.builder(
                      itemBuilder: (context, index) => Image.asset(
                        Assets.images.star.path,
                        color: Color(0xffFFBA49),
                      ),
                      itemSize: 40,
                      allowHalfRating: true,
                      initialRating: 4.5,
                      itemPadding: horizontalPadding8,
                      maxRating: 5,
                      unratedColor: shadowColor,
                      onRatingUpdate: (val) {
                        rating = val;
                      },
                    ),
                  ],
                ).expanded()
              ],
            ).width(100.w),
          ),
        ),
      );
}
