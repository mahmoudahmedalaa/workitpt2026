import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:sizer/sizer.dart';

import '../../../../config/typography.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/spacing.dart';
import '../../../../core/export.dart';
import '../../../../core/routes/app_router.dart';
import '../../../../core/widgets/app_button.dart';
import '../../data/models/session_response_model.dart';

class UserSessionTile extends StatelessWidget {
  const UserSessionTile({
    super.key,
    required this.model,
  });

  final SessionResponseModel model;

  @override
  Widget build(BuildContext context) => Stack(
        children: <Widget>[
          Container(
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              shadows: const [
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
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const UserSessionSliderWidget(),
                Row(
                  children: [
                    UserSessionTitleWidget(
                      title: model.sessionTitle ?? '',
                      type: model.sessionType ?? '',
                    ).expanded(),
                    const TrainerDescriptionWidget()
                  ],
                ).padding(vertical: 12),
                Row(
                  children: [
                    UserSessionTimeWidget(
                      timeFrom: model.timeFrom ?? '',
                      timeTo: model.timeTo ?? '',
                    ),
                    UserSessionInfoWidget(
                      title: model.location ?? '',
                    )
                  ],
                ),
                verticalMargin12,
                UserSessionPriceWidget(
                  price: model.price.toString(),
                ),
                verticalMargin12,
                UserSessionOccuranceWidget(
                  occurance: model.occurrence ?? '',
                ),
                verticalMargin40,
              ],
            ).padding(all: 8),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: AppButton(
              buttonText: 'Book Session',
              suffixWidget: const SizedBox(),
              onPressed: () =>
                  context.router.push(UserSessionDetailRoute(model: model)),
            ).translate(offset: const Offset(0, 30)),
          ),
        ],
      ).padding(bottom: 30, top: 12);
}

class UserSessionPriceWidget extends StatelessWidget {
  final String price;
  const UserSessionPriceWidget({super.key, required this.price});

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const UserSessionDateWidget(),
          Text(
            '\$ $price',
            style: AppTextStyle.bodyLgBold.copyWith(
              color: const Color(0xFFF97316),
            ),
          )
        ],
      );
}

class UserSessionSliderWidget extends StatefulWidget {
  const UserSessionSliderWidget({super.key});

  @override
  State<UserSessionSliderWidget> createState() =>
      _UserSessionSliderWidgetState();
}

class _UserSessionSliderWidgetState extends State<UserSessionSliderWidget> {
  int dotIndex = 0;

  @override
  Widget build(BuildContext context) => Stack(
        children: <Widget>[
          CarouselSlider.builder(
            options: CarouselOptions(
              autoPlayCurve: Curves.easeInOut,
              autoPlay: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 400),
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
              aspectRatio: (100.w - 40) / 150,
              viewportFraction: 1,
            ),
            itemCount: 3,
            itemBuilder: (context, index, realIndex) => Image.asset(
              Assets.images.loginPic.path,
              fit: BoxFit.cover,
              width: 100.w,
            ).clipRRect(all: 8).alignment(Alignment.center),
          ),
          Positioned(
            bottom: 4,
            width: 90.w,
            child: DotsIndicator(
              dotsCount: 3,
              position: dotIndex,
              decorator: const DotsDecorator(
                color: Colors.white,
                activeColor: colorPrimary,
              ),
            ),
          )
        ],
      ).height(150).width(100.w);
}

class UserSessionDateWidget extends StatelessWidget {
  const UserSessionDateWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Row(
        children: [
          const VerticalDivider(
            thickness: 4,
            width: 5,
            color: blackText,
          ),
          horizontalMargin4,
          Text(
            '22 Sept',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            softWrap: true,
            style: AppTextStyle.bodySMRegular.copyWith(
              color: blackText,
              letterSpacing: 0.24,
            ),
          ),
        ],
      ).height(20);
}

class UserSessionOccuranceWidget extends StatelessWidget {
  final String occurance;

  const UserSessionOccuranceWidget({
    super.key,
    required this.occurance,
  });

  @override
  Widget build(BuildContext context) => Row(
        children: [
          const VerticalDivider(
            thickness: 4,
            width: 5,
            color: blackText,
          ),
          horizontalMargin4,
          Text(
            occurance,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            softWrap: true,
            style: AppTextStyle.bodySMRegular.copyWith(
              color: blackText,
              letterSpacing: 0.24,
            ),
          )
        ],
      ).height(20);
}

class UserSessionInfoWidget extends StatelessWidget {
  final String title;

  const UserSessionInfoWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) => Row(
        children: [
          const VerticalDivider(
            thickness: 3,
            width: 8,
            indent: 3,
            endIndent: 3,
            color: blackText,
          ),
          horizontalMargin4,
          Text(
            title,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            softWrap: true,
            style: AppTextStyle.bodySMRegular.copyWith(
              color: blackText,
            ),
          ),
        ],
      ).height(20);
}

class UserSessionTimeWidget extends StatelessWidget {
  final String timeFrom;
  final String timeTo;
  const UserSessionTimeWidget({
    super.key,
    required this.timeFrom,
    required this.timeTo,
  });

  @override
  Widget build(BuildContext context) => Row(
        children: [
          const VerticalDivider(
            thickness: 4,
            width: 5,
            color: blackText,
          ),
          horizontalMargin4,
          Text(
            '$timeFrom - $timeTo AM',
            style: AppTextStyle.bodySMRegular,
          ),
        ],
      ).height(20);
}

class UserSessionTitleWidget extends StatelessWidget {
  final String title;
  final String type;
  const UserSessionTitleWidget({
    super.key,
    required this.title,
    required this.type,
  });

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: AppTextStyle.bodyLgSemiBold.copyWith(
              color: blackText,
            ),
          ),
          Text(
            type,
            style: AppTextStyle.bodyMDRegular.copyWith(
              color: darkText,
              letterSpacing: 0.28,
            ),
          ),
        ],
      );
}

class TrainerDescriptionWidget extends StatelessWidget {
  const TrainerDescriptionWidget({super.key});

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
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
                child: Image.asset(Assets.images.onboard1.path),
              ),
              horizontalMargin4,
              Text(
                'John Smith',
                maxLines: 2,
                style: AppTextStyle.bodyLgSemiBold.copyWith(
                  color: blackText,
                ),
              ),
            ],
          ),
        ],
      );
}
