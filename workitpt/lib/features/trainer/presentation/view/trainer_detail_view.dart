import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sizer/sizer.dart';
import 'package:workitpt/core/injection/injection.dart';
import 'package:workitpt/features/sessions/presentation/bloc/session_bloc.dart';
import 'package:workitpt/features/trainer/presentation/bloc/trainer_bloc.dart';

import '../../../../config/typography.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/spacing.dart';
import '../../../../core/export.dart';
import '../../../../core/routes/app_router.dart';
import '../../../../core/utils/concat_image_url.dart';
import '../../../../core/widgets/base_view.dart';
import '../../../sessions/presentation/widgets/session_card_widget.dart';
import '../../data/models/trainer_model.dart';
import '../widgets/specialization_chip.dart';

@RoutePage()
class TrainerDetailView extends StatefulWidget {
  final TrainerModel model;
  const TrainerDetailView({
    super.key,
    required this.model,
  });

  @override
  State<TrainerDetailView> createState() => _TrainerDetailViewState();
}

class _TrainerDetailViewState extends State<TrainerDetailView>
    with TickerProviderStateMixin {
  late TabController tabController;

  TrainerBloc trainerBloc = getIt<TrainerBloc>();

  @override
  void initState() {
    tabController = TabController(initialIndex: 0, length: 2, vsync: this);
    trainerBloc.add(TrainerEvent.getTrainerDetail(widget.model.id!));
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => trainerBloc,
        child: BaseView(
          titleText: 'Trainer Details',
          padding: EdgeInsets.zero,
          elevation: 0,
          appBarColor: Colors.white,
          body: BlocBuilder<TrainerBloc, TrainerState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () => SizedBox(),
                onFailure: (msg) {
                  EasyLoading.showError(msg!);
                  return SizedBox();
                },
                onLoading: () {
                  EasyLoading.show();
                  return SizedBox();
                },
                onGetTrainerDetailSuccess: (model) {
                  EasyLoading.dismiss();
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.all(16),
                              child: CachedNetworkImage(
                                imageUrl:
                                    concatImageUrl(widget.model.avatar ?? ''),
                                fit: BoxFit.cover,
                                height: 160,
                              ).clipRRect(all: 8),
                            ).expanded(flex: 50),
                            horizontalMargin16,
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  '${model.info!.trainerName}',
                                  style:
                                      AppTextStyle.headlineSMSemiBold.copyWith(
                                    color: colorPrimary,
                                  ),
                                ).padding(top: 16),
                                RatingBar.builder(
                                  itemBuilder: (context, index) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  itemSize: 16,
                                  allowHalfRating: true,
                                  initialRating:
                                      widget.model.averageRating ?? 0,
                                  maxRating: 5,
                                  unratedColor: shadowColor,
                                  onRatingUpdate: (val) {},
                                  ignoreGestures: true,
                                ),
                                verticalMargin8,
                                Text(
                                  '${model.info!.intro}',
                                  style: AppTextStyle.tinySMRegular.copyWith(
                                    color: darkText,
                                    letterSpacing: 0.20,
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                verticalMargin16,
                                Text(
                                  'Years of Experience:\n ${model.info?.experience ?? ''}',
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: AppTextStyle.bodySMMedium
                                      .copyWith(color: Colors.white),
                                )
                                    .padding(horizontal: 24, vertical: 4)
                                    .decorated(
                                      borderRadius: BorderRadius.circular(24),
                                      color: colorPrimary,
                                    )
                                    .padding(all: 10),
                              ],
                            ).expanded(flex: 55),
                          ],
                        ),
                        verticalMargin16,
                        Text(
                          'Specialization',
                          style: AppTextStyle.bodyMDSemiBold.copyWith(
                            letterSpacing: 0.28,
                          ),
                        ).padding(horizontal: 16),
                        verticalMargin8,
                        Wrap(
                          children: [
                            ...List.generate(
                              model.info?.specialization?.length ?? 0,
                              (index) => SpecializationChip(
                                chipTitle: model.info!.specialization![index],
                              ),
                            )
                          ],
                        ).padding(horizontal: 16),
                        verticalMargin16,
                        Text(
                          'Certifications',
                          style: AppTextStyle.bodyMDSemiBold.copyWith(
                            letterSpacing: 0.28,
                          ),
                        ).padding(horizontal: 16),
                        model.info?.certification == null ||
                                model.info!.certification!.isEmpty
                            ? Container(
                                height: 100,
                                alignment: Alignment.center,
                                child: Text(
                                  'No certifications added yet.',
                                  style: AppTextStyle.baseTextStyle
                                      .copyWith(color: colorLightGrey),
                                ),
                              )
                            : GridView.builder(
                                shrinkWrap: true,
                                padding: const EdgeInsets.all(16),
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 16,
                                  mainAxisSpacing: 16,
                                ),
                                itemCount: model.info!.certification!.length > 6
                                    ? 6
                                    : model.info?.certification?.length ?? 0,
                                itemBuilder: (context, index) => model
                                        .info!.certification![index]
                                        .contains('pdf')
                                    ? AbsorbPointer(
                                        absorbing: true,
                                        child: PDF().fromUrl(concatImageUrl(
                                            model.info!.certification![index])),
                                      )
                                    : CachedNetworkImage(
                                        imageUrl:
                                            model.info!.certification![index] ==
                                                    ''
                                                ? concatImageUrl('')
                                                : concatImageUrl(model.info!
                                                    .certification![index]),
                                        fit: BoxFit.cover,
                                      ),
                              ).width(100.w),
                        verticalMargin16,
                        Text(
                          'Images',
                          style: AppTextStyle.bodyMDSemiBold.copyWith(
                            letterSpacing: 0.28,
                          ),
                        ).padding(horizontal: 16),
                        model.info?.images == null ||
                                model.info!.images!.isEmpty
                            ? Container(
                                height: 100,
                                alignment: Alignment.center,
                                child: Text(
                                  'No images added yet.',
                                  style: AppTextStyle.baseTextStyle
                                      .copyWith(color: colorLightGrey),
                                ),
                              )
                            : GridView.builder(
                                shrinkWrap: true,
                                padding: const EdgeInsets.all(16),
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 16,
                                  mainAxisSpacing: 16,
                                ),
                                itemCount: model.info!.images!.length > 6
                                    ? 6
                                    : model.info?.images?.length ?? 0,
                                itemBuilder: (context, index) =>
                                    CachedNetworkImage(
                                  imageUrl: model.info!.images![index] == ''
                                      ? concatImageUrl('')
                                      : model.info!.images![index],
                                  fit: BoxFit.cover,
                                ),
                              ).width(100.w),
                        TabBar(
                          controller: tabController,
                          labelStyle: AppTextStyle.bodySMSemiBold
                              .copyWith(color: colorPrimary),
                          labelColor: colorPrimary,
                          labelPadding: const EdgeInsets.all(16),
                          unselectedLabelColor: darkText,
                          unselectedLabelStyle: AppTextStyle.bodySMSemiBold,
                          indicatorPadding:
                              const EdgeInsets.symmetric(horizontal: 8),
                          indicatorColor: colorPrimary,
                          tabs: const [
                            Text('Upcoming Sessions'),
                            Text('Completed Sessions'),
                          ],
                        ),
                        TabBarView(
                          controller: tabController,
                          children: [
                            model.upcoming == null || model.upcoming!.isEmpty
                                ? Center(
                                    child: Text(
                                      'No Sessions found!',
                                      style: AppTextStyle.bodyLgRegular
                                          .copyWith(color: colorLightGrey),
                                    ),
                                  )
                                : ListView.builder(
                                    padding: const EdgeInsets.all(16),
                                    itemCount: model.upcoming?.length,
                                    itemBuilder: (context, index) {
                                      return SessionCardWidget(
                                        model: model.upcoming![index].session!,
                                        isPaid:
                                            model.upcoming![index].isPaid ?? '',
                                        isPressed: () {
                                          if (model.upcoming![index].isPaid ==
                                              'Paid') {
                                            context.router.push(
                                              UserSessionDetailRoute(
                                                model: model
                                                    .upcoming![index].session!,
                                                isPaid: model.upcoming![index]
                                                        .isPaid ??
                                                    '',
                                              ),
                                            );
                                          } else {
                                            context.router.push(
                                              PaymentCardRoute(
                                                bookingId: [
                                                  model.upcoming![index].id!
                                                ],
                                              ),
                                            );
                                          }
                                        },
                                      );
                                    },
                                  ),
                            model.booked == null || model.booked!.isEmpty
                                ? Center(
                                    child: Text(
                                      'No Sessions found!',
                                      style: AppTextStyle.bodyLgRegular
                                          .copyWith(color: colorLightGrey),
                                    ),
                                  )
                                : ListView.builder(
                                    itemCount: model.booked?.length,
                                    padding: const EdgeInsets.all(16),
                                    itemBuilder: (context, index) {
                                      return SessionCardWidget(
                                        model: model.booked![index].session!,
                                        isPaid:
                                            model.booked![index].isPaid ?? '',
                                        isPressed: () {
                                          context.router.push(
                                            TrainerSessionDetailRoute(
                                              model:
                                                  model.booked![index].session!,
                                              sessionBloc: getIt<SessionBloc>(),
                                              isPrevious: true,
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                          ],
                        ).height(500),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
      );
}
