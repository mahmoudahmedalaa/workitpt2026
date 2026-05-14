import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:workitpt/features/sessions/presentation/bloc/session_bloc.dart';

import '../../../../../config/typography.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/spacing.dart';
import '../../../../../core/export.dart';
import '../../../../../core/injection/injection.dart';
import '../../../../../core/routes/app_router.dart';
import '../../../../../core/utils/concat_image_url.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/base_view.dart';
import '../../../../../core/widgets/expandable_text.dart';
import '../../../data/models/session_response_model.dart';
import '../../widgets/session_info_widget.dart';

@RoutePage()
class UserSessionDetailView extends StatefulWidget {
  final SessionResponseModel model;
  final String? isPaid;

  const UserSessionDetailView({super.key, required this.model, this.isPaid});

  @override
  State<UserSessionDetailView> createState() => _UserSessionDetailViewState();
}

class _UserSessionDetailViewState extends State<UserSessionDetailView> {
  int dotIndex = 0;
  SessionResponseModel model = SessionResponseModel();
  SessionBloc sessionBloc;

  _UserSessionDetailViewState() : sessionBloc = getIt<SessionBloc>();

  @override
  void initState() {
    sessionBloc.add(SessionEvent.viewSession(widget.model.id!));
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => sessionBloc,
        child: BaseView(
          padding: EdgeInsets.zero,
          titleText: 'Sessions Details',
          appBarColor: Colors.white,
          elevation: 0,
          body: BlocConsumer<SessionBloc, SessionState>(
            listener: (context, state) {
              state.whenOrNull(
                onLoading: () {
                  EasyLoading.show(dismissOnTap: true);
                },
                onGetSessionDetailsSuccess: (sessionModel) {
                  EasyLoading.dismiss();
                  setState(() {
                    model = sessionModel;
                  });
                },
                onFailure: (message) {
                  EasyLoading.showError(message!);
                },
              );
            },
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () => SizedBox(),
                onGetSessionDetailsSuccess: (model) {
                  return Column(
                    children: <Widget>[
                      SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            Stack(
                              children: <Widget>[
                                CarouselSlider.builder(
                                  options: CarouselOptions(
                                    autoPlayCurve: Curves.easeInOut,
                                    autoPlay: widget.model.images != null &&
                                        widget.model.images!.length > 1,
                                    autoPlayAnimationDuration:
                                        const Duration(milliseconds: 400),
                                    autoPlayInterval:
                                        const Duration(milliseconds: 5000),
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
                                  itemCount: widget.model.images?.length ?? 0,
                                  itemBuilder: (context, index, realIndex) =>
                                      widget.model.images == null ||
                                              widget.model.images!.isEmpty
                                          ? Container(
                                              decoration: BoxDecoration(
                                                gradient: sessionGradient,
                                                image: DecorationImage(
                                                  image: AssetImage(Assets
                                                      .images.loginBg.path),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            )
                                          : CachedNetworkImage(
                                              imageUrl: concatImageUrl(
                                                  widget.model.images![index]),
                                              fit: BoxFit.cover,
                                              width: 100.w,
                                            ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      if (widget.isPaid != null)
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 4),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(26),
                                            color:
                                                widget.isPaid!.contains('Paid')
                                                    ? colorPrimary
                                                    : lightPrimary,
                                          ),
                                          child: Text(
                                            widget.isPaid!.contains('Paid')
                                                ? 'Paid'
                                                : 'Booked',
                                            style: AppTextStyle.bodyMDRegular
                                                .copyWith(
                                                    color: widget.isPaid!
                                                            .contains('Paid')
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
                                          borderRadius:
                                              BorderRadius.circular(26),
                                          color: lightPrimary,
                                        ),
                                        child: Text(
                                          widget.model.sessionType ?? '1-on-1',
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
                                  child: widget.model.images != null &&
                                          widget.model.images!.length > 1
                                      ? DotsIndicator(
                                          dotsCount:
                                              widget.model.images!.isEmpty
                                                  ? 1
                                                  : widget.model.images!.length,
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
                            SessionInfoWidget(model: model)
                                .padding(horizontal: 16, vertical: 12),
                            const Divider(
                              color: colorLightGrey,
                              height: 5,
                            ),
                            verticalMargin12,
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Session Description:',
                                  style: AppTextStyle.bodyMDRegular
                                      .copyWith(color: darkText),
                                ),
                                verticalMargin4,
                                if (model.description == null ||
                                    model.description!.isEmpty)
                                  Text(
                                    'No data provided.',
                                    style: AppTextStyle.tinySMBold
                                        .copyWith(color: colorLightGrey),
                                  )
                                else
                                  ExpandableText(
                                    text: model.description ?? '',
                                    trimLines: 6,
                                  ),
                                verticalMargin16,
                                Text(
                                  'What to Expect (Optional):',
                                  style: AppTextStyle.bodyMDRegular
                                      .copyWith(color: darkText),
                                ),
                                verticalMargin4,
                                if (model.whatToExpect == null ||
                                    model.whatToExpect!.isEmpty)
                                  Text(
                                    'No data provided.',
                                    style: AppTextStyle.tinySMBold
                                        .copyWith(color: colorLightGrey),
                                  )
                                else
                                  ExpandableText(
                                    text: model.whatToExpect ?? '',
                                    trimLines: 6,
                                  ),
                                verticalMargin16,
                                Text(
                                  'Benefits (Optional):',
                                  style: AppTextStyle.bodyMDRegular
                                      .copyWith(color: darkText),
                                ),
                                verticalMargin4,
                                if (model.benefits == null ||
                                    model.benefits!.isEmpty)
                                  Text(
                                    'No data provided.',
                                    style: AppTextStyle.tinySMBold
                                        .copyWith(color: colorLightGrey),
                                  )
                                else
                                  ExpandableText(
                                    text: model.benefits ?? '',
                                    trimLines: 6,
                                  ),
                                verticalMargin16,
                                Text(
                                  'What to Bring (Optional):',
                                  style: AppTextStyle.bodyMDRegular
                                      .copyWith(color: darkText),
                                ),
                                verticalMargin4,
                                if (model.whatToBring == null ||
                                    model.whatToBring!.isEmpty)
                                  Text(
                                    'No data provided.',
                                    style: AppTextStyle.tinySMBold
                                        .copyWith(color: colorLightGrey),
                                  )
                                else
                                  ExpandableText(
                                    text: model.whatToBring ?? '',
                                    trimLines: 6,
                                  ),
                                verticalMargin48,
                                verticalMargin48,
                              ],
                            ).width(100.w).padding(horizontal: 16),
                          ],
                        ),
                      ).expanded(),
                      if (widget.isPaid != null && widget.isPaid! == ('Paid') ||
                          model.isPaid == 'Paid')
                        AppButton(
                          buttonText: 'Chat with Trainer',
                          suffixWidget: const SizedBox(),
                          onPressed: () {
                            context.router.push(
                              InChatRoute(
                                sessionId: widget.model.id!,
                                sessionTitle: model.trainer?.firstName ?? '',
                                avatar: model.trainer?.avatar ?? '',
                              ),
                            );
                          },
                        )
                      else
                        AppButton(
                          buttonText: 'Proceed to Booking',
                          suffixWidget: const SizedBox(),
                          onPressed: () {
                            bool isBooked = false;
                            if (model.selectType == 'recurring') {
                              isBooked = model.prefrenceDataTime!
                                  .where((element) => !(element.isBooking)!)
                                  .toList()
                                  .isEmpty;
                            } else {
                              if (model.sessionType == '1-on-1') {
                                if (model.booked!) {
                                  isBooked = true;
                                } else {
                                  isBooked = false;
                                }
                              }
                            }
                            if (isBooked) {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Image.asset(
                                    Assets.images.warning.path,
                                    height: 52,
                                    width: 52,
                                  ),
                                  content: Text(
                                    "This session has already been purchased.",
                                    style: AppTextStyle.bodySMRegular,
                                    textAlign: TextAlign.center,
                                  ),
                                  actions: [
                                    TextButton(
                                      child: Text(
                                        'OK',
                                        style: AppTextStyle.bodyLgSemiBold
                                            .copyWith(color: colorPrimary),
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    )
                                  ],
                                ),
                              );
                              return;
                            }
                            context.router.replace(
                              SessionBookingRoute(
                                model: model,
                                isPaid: widget.isPaid,
                              ),
                            );
                          },
                        ),
                      SizedBox(
                        height: MediaQuery.of(context).padding.bottom,
                      )
                    ],
                  );
                },
              );
            },
          ),
        ),
      );
}
