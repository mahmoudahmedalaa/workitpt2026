import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:workitpt/core/routes/app_router.dart';
import 'package:workitpt/features/sessions/presentation/widgets/session_info_widget.dart';

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
import '../../../../../core/widgets/expandable_text.dart';
import '../../../data/models/session_model.dart';
import '../../../data/models/session_response_model.dart';
import '../../bloc/session_bloc.dart';
import '../../widgets/delete_dialog_widget.dart';

@RoutePage()
class TrainerSessionDetailView extends StatefulWidget {
  final SessionResponseModel model;
  final SessionBloc sessionBloc;
  final bool isPrevious;

  const TrainerSessionDetailView(
      {super.key,
      required this.model,
      required this.sessionBloc,
      this.isPrevious = false});

  @override
  State<TrainerSessionDetailView> createState() =>
      _TrainerSessionDetailViewState();
}

class _TrainerSessionDetailViewState extends State<TrainerSessionDetailView> {
  int dotIndex = 0;
  SessionResponseModel? model;
  SessionBloc sessionBloc;

  _TrainerSessionDetailViewState() : sessionBloc = getIt<SessionBloc>();

  @override
  void initState() {
    sessionBloc.add(SessionEvent.viewSession(widget.model.id!));
    setControllers();
    super.initState();
  }

  bool canEdit = false;

  final descriptionController = TextEditingController();
  final expectController = TextEditingController();
  final benefitController = TextEditingController();
  final bringController = TextEditingController();

  void setControllers() {
    setState(() {
      descriptionController.text = model?.description ?? '';
      expectController.text = model?.whatToExpect ?? '';
      bringController.text = model?.whatToBring ?? '';
      benefitController.text = model?.benefits ?? '';
    });
  }

  @override
  Widget build(BuildContext context) => BlocProvider(
      create: (context) => sessionBloc,
      child: BaseView(
        padding: EdgeInsets.zero,
        titleText: 'Sessions Detail',
        appBarColor: Colors.white,
        elevation: 0,
        actions: widget.isPrevious
            ? []
            : [
                ImageIcon(
                  AssetImage(
                    Assets.images.delete.path,
                  ),
                  size: 22,
                  color: const Color(0xffc6011c),
                ).padding(vertical: 12).gestures(
                  onTap: () {
                    showDialog<void>(
                      context: context,
                      builder: (context) => DeleteDialogWidget(
                        isBooked: widget.model.booked!,
                        onPressed: () {
                          widget.sessionBloc.add(
                            SessionEvent.deleteSession(widget.model.id!),
                          );
                        },
                      ),
                    );
                  },
                ),
                ImageIcon(
                  AssetImage(Assets.images.edit.path),
                  color: canEdit ? colorPrimary : null,
                  size: 22,
                ).padding(all: 12).gestures(
                  onTap: () {
                    setState(() {
                      canEdit = !canEdit;
                    });
                  },
                )
              ],
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
                setControllers();
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
                                  autoPlay: model.images != null &&
                                      model.images!.length > 1,
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
                                itemCount: model.images?.length ?? 0,
                                itemBuilder: (context, index, realIndex) =>
                                    model.images == null ||
                                            model.images!.isEmpty
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
                                                model.images![index]),
                                            fit: BoxFit.cover,
                                            width: 100.w,
                                          ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  if (widget.model.booked != null &&
                                      widget.model.booked!)
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 4),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(26),
                                        color: widget.model.booked!
                                            ? colorPrimary
                                            : lightPrimary,
                                      ),
                                      child: Text(
                                        widget.model.booked! ? 'Paid' : '',
                                        style:
                                            AppTextStyle.bodyMDRegular.copyWith(
                                          color: widget.model.booked!
                                              ? Colors.white
                                              : blackText,
                                        ),
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
                              ).padding(all: 8).alignment(Alignment.topCenter),
                              Positioned(
                                bottom: 12,
                                right: 0,
                                left: 0,
                                child: model.images != null &&
                                        model.images!.length > 1
                                    ? DotsIndicator(
                                        dotsCount: model.images!.isEmpty
                                            ? 1
                                            : model.images!.length,
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
                          SessionDescriptionWidget(
                            benefitController: benefitController,
                            descriptionController: descriptionController,
                            expectController: expectController,
                            bringController: bringController,
                            canEdit: canEdit,
                          ).padding(all: 16)
                        ],
                      ),
                    ).expanded(),
                    Visibility(
                      visible: canEdit,
                      child: Row(
                        children: [
                          AppButton(
                            buttonText: 'Cancel',
                            suffixWidget: const SizedBox(),
                            onPressed: () => setState(() {
                              canEdit = false;
                            }),
                            backgroundColor: colorLightGrey,
                          ).flexible(),
                          AppButton(
                            buttonText: 'Update',
                            suffixWidget: const SizedBox(),
                            onPressed: () {
                              final newModel = SessionModel(
                                description: descriptionController.text,
                                benefits: benefitController.text,
                                expect: expectController.text,
                                bring: bringController.text,
                              );

                              widget.sessionBloc.add(SessionEvent.updateSession(
                                  newModel, widget.model.referenceId!));
                            },
                          ).flexible(),
                        ],
                      ).padding(
                        bottom: MediaQuery.of(context).padding.bottom + 12,
                        top: 10,
                        right: 16,
                        left: 16,
                      ),
                    ),
                    Visibility(
                      visible: model.booked ?? false,
                      child: Padding(
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).padding.bottom + 12,
                          top: 10,
                          right: 16,
                          left: 16,
                        ),
                        child: AppButton(
                          buttonText: 'Chat Session',
                          suffixWidget: const SizedBox(),
                          onPressed: () {
                            context.router.push(
                              InChatRoute(
                                sessionId: widget.model.id ?? '',
                                sessionTitle: model.sessionTitle,
                                avatar: model.trainer?.avatar ?? '',
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                );
              },
            );
          },
        ),
      ));
}

class SessionDescriptionWidget extends StatelessWidget {
  final TextEditingController descriptionController;
  final TextEditingController expectController;
  final TextEditingController benefitController;
  final TextEditingController bringController;
  final bool canEdit;

  const SessionDescriptionWidget({
    super.key,
    required this.descriptionController,
    required this.expectController,
    required this.benefitController,
    required this.bringController,
    required this.canEdit,
  });

  @override
  Widget build(BuildContext context) => !canEdit
      ? Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Session Description:',
              style: AppTextStyle.bodyMDRegular.copyWith(color: darkText),
            ),
            verticalMargin4,
            if (descriptionController.text.isEmpty)
              Text(
                'No data provided.',
                style: AppTextStyle.tinySMBold.copyWith(color: colorLightGrey),
              )
            else
              ExpandableText(
                text: descriptionController.text,
                trimLines: 6,
              ),
            verticalMargin16,
            Text(
              'What to Expect (Optional):',
              style: AppTextStyle.bodyMDRegular.copyWith(color: darkText),
            ),
            verticalMargin4,
            if (expectController.text.isEmpty)
              Text(
                'No data provided.',
                style: AppTextStyle.tinySMBold.copyWith(color: colorLightGrey),
              )
            else
              ExpandableText(
                text: expectController.text,
                trimLines: 6,
              ),
            verticalMargin16,
            Text(
              'Benefits (Optional):',
              style: AppTextStyle.bodyMDRegular.copyWith(color: darkText),
            ),
            verticalMargin4,
            if (benefitController.text.isEmpty)
              Text(
                'No data provided.',
                style: AppTextStyle.tinySMBold.copyWith(color: colorLightGrey),
              )
            else
              ExpandableText(
                text: benefitController.text,
                trimLines: 6,
              ),
            verticalMargin16,
            Text(
              'What to Bring (Optional):',
              style: AppTextStyle.bodyMDRegular.copyWith(color: darkText),
            ),
            verticalMargin4,
            if (bringController.text.isEmpty)
              Text(
                'No data provided.',
                style: AppTextStyle.tinySMBold.copyWith(color: colorLightGrey),
              )
            else
              ExpandableText(
                text: bringController.text,
                trimLines: 6,
              ),
          ],
        ).width(100.w)
      : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Session Description:',
              style: AppTextStyle.bodyMDRegular.copyWith(color: darkText),
            ),
            AppTextField(
              controller: descriptionController,
              textStyle: AppTextStyle.bodyMDRegular,
              labelStyle: AppTextStyle.bodyLgSemiBold,
              maxLine: 6,
              minLine: 1,
              textInputType: TextInputType.multiline,
              maxLength: 256,
              readOnly: !canEdit,
              validator: (value) =>
                  validateNotEmpty(value, 'Session Description'),
            ),
            Text(
              'What to Expect (Optional):',
              style: AppTextStyle.bodyMDRegular.copyWith(color: darkText),
            ),
            AppTextField(
              controller: expectController,
              textStyle: AppTextStyle.bodyMDRegular,
              labelStyle: AppTextStyle.bodyLgSemiBold,
              maxLine: 6,
              minLine: 1,
              textInputType: TextInputType.multiline,
              readOnly: !canEdit,
              maxLength: 256,
            ),
            Text(
              'Benefits (Optional):',
              style: AppTextStyle.bodyMDRegular.copyWith(color: darkText),
            ),
            AppTextField(
              controller: benefitController,
              textStyle: AppTextStyle.bodyMDRegular,
              labelStyle: AppTextStyle.bodyLgSemiBold,
              maxLine: 6,
              minLine: 1,
              textInputType: TextInputType.multiline,
              readOnly: !canEdit,
              maxLength: 256,
            ),
            Text(
              'What to Bring (Optional):',
              style: AppTextStyle.bodyMDRegular.copyWith(color: darkText),
            ),
            AppTextField(
              controller: bringController,
              textStyle: AppTextStyle.bodyMDRegular,
              labelStyle: AppTextStyle.bodyLgSemiBold,
              maxLine: 6,
              minLine: 1,
              textInputType: TextInputType.multiline,
              readOnly: !canEdit,
              maxLength: 256,
            ),
          ],
        );
}
