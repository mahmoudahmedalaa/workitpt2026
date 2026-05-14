import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../../config/typography.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/spacing.dart';
import '../../../../../core/export.dart';
import '../../../../../core/injection/injection.dart';
import '../../../../../core/utils/concat_image_url.dart';
import '../../../../../core/utils/validator.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_text_field.dart';
import '../../../../../core/widgets/base_view.dart';
import '../../../data/models/session_model.dart';
import '../../../data/models/session_response_model.dart';
import '../../bloc/session_bloc.dart';
import '../../widgets/delete_dialog_widget.dart';
import '../../widgets/user_session_tile.dart';

@RoutePage()
class TrainerSessionEditView extends StatefulWidget {
  final SessionResponseModel model;

  const TrainerSessionEditView({super.key, required this.model});

  @override
  State<TrainerSessionEditView> createState() => _TrainerSessionEditViewState();
}

class _TrainerSessionEditViewState extends State<TrainerSessionEditView> {
  int dotIndex = 0;
  bool canEdit = false;

  SessionBloc sessionBloc = getIt<SessionBloc>();

  final descriptionController = TextEditingController();
  final expectController = TextEditingController();
  final benefitController = TextEditingController();
  final bringController = TextEditingController();
  //
  // void setControllers() {
  //   setState(() {
  //     descriptionController.text = widget.model.description ?? '';
  //     expectController.text = widget.model.expect ?? '';
  //     bringController.text = widget.model.bring ?? '';
  //     benefitController.text = widget.model.benefits ?? '';
  //   });
  // }

  @override
  void initState() {
    // setControllers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => sessionBloc,
        child: BlocListener<SessionBloc, SessionState>(
          listener: (context, state) {
            state.whenOrNull(
              onLoading: EasyLoading.show,
              onFailure: (error) {
                EasyLoading.showError(error ?? '');
              },
              onUpdateSessionSuccess: (session) {
                EasyLoading.showSuccess('Session updated successfully.');
                context.router.pop();
              },
              onDeleteSessionSuccess: (session) {
                EasyLoading.showSuccess('Session deleted successfully.');
                context.router.pop();
              },
            );
          },
          child: BaseView(
            padding: EdgeInsets.zero,
            titleText: 'Sessions Detail',
            appBarColor: Colors.white,
            elevation: 0,
            actions: [
              ImageIcon(
                AssetImage(
                  Assets.images.delete.path,
                ),
                size: 22,
                color: const Color(0xffc6011c),
              ).padding(all: 12).gestures(
                onTap: () {
                  showDialog<void>(
                    context: context,
                    builder: (context) => DeleteDialogWidget(
                      isBooked: widget.model.booked!,
                      onPressed: () {
                        sessionBloc.add(
                          SessionEvent.deleteSession(widget.model.id!),
                        );
                      },
                    ),
                  );
                },
              ),
              // ImageIcon(
              //   AssetImage(Assets.images.edit.path),
              //   color: canEdit ? colorPrimary : null,
              //   size: 22,
              // ).padding(all: 12).gestures(
              //   onTap: () {
              //     setState(() {
              //       canEdit = !canEdit;
              //     });
              //   },
              // )
            ],
            body: Column(
              children: <Widget>[
                SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          CarouselSlider.builder(
                            options: CarouselOptions(
                              autoPlayCurve: Curves.easeInOut,
                              autoPlay: true,
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
                                            image: AssetImage(
                                                Assets.images.loginBg.path),
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
                          Positioned(
                            bottom: 12,
                            right: 0,
                            left: 0,
                            child: widget.model.images != null &&
                                    widget.model.images!.length > 1
                                ? DotsIndicator(
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
                                      size: Size(8, 8),
                                      activeSize: Size(8, 8),
                                    ),
                                  )
                                : const SizedBox(),
                          )
                        ],
                      ).width(100.w),
                      Column(
                        children: <Widget>[
                          Row(
                            children: [
                              UserSessionTitleWidget(
                                title: widget.model.sessionTitle ?? '',
                                type: widget.model.sessionType ?? '',
                              ).expanded(),
                              const TrainerDescriptionWidget()
                            ],
                          ).padding(vertical: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              UserSessionInfoWidget(
                                title:
                                    '${widget.model.timeFrom}-${widget.model.timeTo}',
                              ),
                              UserSessionInfoWidget(
                                title: widget.model.difficultyLevel ?? '',
                              ),
                              UserSessionInfoWidget(
                                title: widget.model.location ?? '',
                              )
                            ],
                          ),
                          verticalMargin12,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              UserSessionInfoWidget(
                                title: widget.model.selectType ?? '',
                              ),
                              Text(
                                '\$${widget.model.price}',
                                style: AppTextStyle.bodyLgBold
                                    .copyWith(color: colorPrimary),
                              )
                            ],
                          ),
                        ],
                      ).padding(all: 16),
                      const Divider(
                        color: colorLightGrey,
                        height: 5,
                      ),
                      SessionDescriptionWidget(
                        benefitController: benefitController,
                        descriptionController: descriptionController,
                        expectController: expectController,
                        bringController: bringController,
                        canEdit: canEdit,
                      ).padding(horizontal: 16)
                    ],
                  ),
                ).expanded(),
                Row(
                  children: [
                    AppButton(
                      buttonText: 'Cancel',
                      suffixWidget: const SizedBox(),
                      onPressed: () {},
                      backgroundColor: colorLightGrey,
                    ).flexible(),
                    AppButton(
                      buttonText: 'Update',
                      suffixWidget: const SizedBox(),
                      onPressed: () {
                        final model = SessionModel(
                          description: descriptionController.text,
                          benefits: benefitController.text,
                          expect: expectController.text,
                          bring: bringController.text,
                        );

                        sessionBloc.add(SessionEvent.updateSession(
                            model, widget.model.referenceId!));
                      },
                    ).flexible(),
                  ],
                ).padding(
                  bottom: MediaQuery.of(context).padding.bottom + 12,
                  top: 10,
                  right: 16,
                  left: 16,
                ),
              ],
            ),
          ),
        ),
      );
}

class SessionDescriptionWidget extends StatelessWidget {
  final TextEditingController descriptionController;
  final TextEditingController expectController;
  final TextEditingController benefitController;
  final TextEditingController bringController;
  final bool canEdit;

  const SessionDescriptionWidget(
      {super.key,
      required this.descriptionController,
      required this.expectController,
      required this.benefitController,
      required this.bringController,
      required this.canEdit});

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextField(
            controller: descriptionController,
            labelText: 'Session Description:',
            textStyle: AppTextStyle.bodyMDRegular,
            labelStyle: AppTextStyle.bodyLgSemiBold,
            maxLine: 6,
            readOnly: !canEdit,
            validator: (value) =>
                validateNotEmpty(value, 'Session Description'),
          ),
          AppTextField(
            controller: expectController,
            labelText: 'What to Expect(Optional)',
            textStyle: AppTextStyle.bodyMDRegular,
            labelStyle: AppTextStyle.bodyLgSemiBold,
            maxLine: 6,
            readOnly: !canEdit,
          ),
          AppTextField(
            controller: benefitController,
            labelText: 'Benefits(Optional)',
            textStyle: AppTextStyle.bodyMDRegular,
            labelStyle: AppTextStyle.bodyLgSemiBold,
            maxLine: 6,
            readOnly: !canEdit,
          ),
          AppTextField(
            labelText: 'What to bring(Optional)',
            controller: bringController,
            textStyle: AppTextStyle.bodyMDRegular,
            labelStyle: AppTextStyle.bodyLgSemiBold,
            maxLine: 6,
            readOnly: !canEdit,
          ),
        ],
      );
}
