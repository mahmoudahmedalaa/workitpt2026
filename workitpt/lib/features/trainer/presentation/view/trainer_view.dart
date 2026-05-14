import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:side_sheet/side_sheet.dart';
import 'package:sizer/sizer.dart';
import 'package:workitpt/features/trainer/data/models/trainer_filter_model.dart';
import 'package:workitpt/features/trainer/presentation/widgets/trainer_card_shimmer.dart';

import '../../../../config/typography.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/spacing.dart';
import '../../../../core/export.dart';
import '../../../../core/injection/injection.dart';
import '../../../../core/routes/app_router.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/widgets/base_view.dart';
import '../../../sessions/presentation/widgets/filter_icon_button.dart';
import '../../data/models/trainer_model.dart';
import '../bloc/trainer_bloc.dart';
import '../widgets/recommended_trainer_card.dart';
import '../widgets/trainer_card.dart';
import '../widgets/trainer_filter_form.dart';

@RoutePage()
class TrainerView extends StatefulWidget {
  const TrainerView({super.key});

  @override
  State<TrainerView> createState() => _TrainerViewState();
}

class _TrainerViewState extends State<TrainerView> {
  final searchController = TextEditingController();

  final TrainerBloc trainerBloc = getIt<TrainerBloc>();

  List<TrainerModel> trainers = [];
  List<TrainerModel> recommendedTrainers = [];
  TrainerFilterModel filterModel = TrainerFilterModel();
  List<String> filterList = [];

  @override
  void initState() {
    trainerBloc.add(TrainerEvent.getTrainerList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => trainerBloc,
        child: BlocListener<TrainerBloc, TrainerState>(
          listener: (context, state) {
            state.whenOrNull(
              onFailure: (message) => EasyLoading.showError(message!),
              onGetTrainerListSuccess: (model) {
                EasyLoading.dismiss();
                setState(() {
                  trainers = model.list!;
                  recommendedTrainers = model.recommendedTrainer!;
                });
              },
            );
          },
          child: BaseView(
            titleText: 'Trainers',
            padding: EdgeInsets.zero,
            automaticallyImplyiLeading: false,
            elevation: 0,
            appBarColor: Colors.white,
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  verticalMargin16,
                  Text(
                    'Recommended Trainers',
                    style: AppTextStyle.bodyLgSemiBold,
                  ).padding(horizontal: 16),
                  verticalMargin16,
                  BlocBuilder<TrainerBloc, TrainerState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () => SizedBox(),
                        onLoading: () {
                          return SizedBox();
                        },
                        onGetTrainerListSuccess: (model) {
                          return model.recommendedTrainer!.isNotEmpty
                              ? RecommededTrainerSection(
                                  trainers: recommendedTrainers,
                                )
                              // : Center(
                              //     child: Text(
                              //       'No Trainers found!',
                              //       style: AppTextStyle.bodyLgRegular
                              //           .copyWith(color: colorLightGrey),
                              //     ),
                              //   );
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                        margin: allPadding24,
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 16, horizontal: 24),
                                        decoration: BoxDecoration(
                                            color: buttonBG,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Text(
                                          'Complete your profile to \nget trainer recommendations.',
                                          textAlign: TextAlign.center,
                                          style: AppTextStyle.bodySMRegular
                                              .copyWith(color: darkText),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 16),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            color: colorPrimary,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Text(
                                        'Complete profile >',
                                        style: AppTextStyle.bodySMRegular
                                            .copyWith(color: colorPrimary),
                                      ),
                                    ).gestures(
                                      onTap: () {
                                        context.router.push(
                                          const SignupAdditionalRoute(),
                                        );
                                      },
                                    ),
                                    verticalMargin16
                                  ],
                                );
                        },
                      );
                    },
                  ),
                  verticalMargin12,
                  Text(
                    'Trainers',
                    style: AppTextStyle.bodyLgSemiBold,
                  ).padding(horizontal: 18, vertical: 8),
                  verticalMargin8,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      AppTextField(
                        bottomMargin: 0,
                        isDense: true,
                        controller: searchController,
                        onChanged: (value) {
                          setState(() {});
                        },
                        onSend: (value) {
                          setState(() {
                            filterModel = TrainerFilterModel(search: value);
                          });
                          trainerBloc.add(
                              TrainerEvent.getTrainerList(filter: filterModel));
                        },
                        textInputAction: TextInputAction.search,
                        decoration: InputDecoration(
                          fillColor: Colors.transparent,
                          border: const OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: darkText,
                            ),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          suffixIcon: IconButton(
                            onPressed: searchController.text.isNotEmpty
                                ? () {
                                    setState(() {
                                      searchController.text = '';
                                    });
                                    trainerBloc
                                        .add(TrainerEvent.getTrainerList());
                                  }
                                : null,
                            icon: searchController.text.isNotEmpty
                                ? const Icon(Icons.clear, color: Colors.black)
                                : const Icon(
                                    Icons.search,
                                    color: Colors.black,
                                  ),
                          ),
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: darkText,
                              ),
                              borderRadius: BorderRadius.circular(25)),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          hintText: 'Search Trainers',
                          hintStyle:
                              const TextStyle(fontSize: 14, color: darkText),
                        ),
                      ).padding(horizontal: 8).expanded(),
                      FilterIconButton(
                        icon: Assets.images.filter.path,
                        onPressed: () async {
                          final filterItems = await SideSheet.right(
                            barrierDismissible: true,
                            body: TrainerFilterForm(
                              model: filterModel,
                            ),
                            width: 90.w,
                            context: context,
                          );
                          if (filterItems != null && filterItems != '') {
                            filterModel = filterItems as TrainerFilterModel;
                            if (filterItems.specialization != null ||
                                filterItems.rating != null ||
                                filterItems.workoutLocation != null ||
                                filterItems.priceMin != null ||
                                filterItems.priceMax != null) {
                              filterList = [];
                              if (filterItems.specialization!.isNotEmpty) {
                                filterList.addAll(filterItems.specialization!);
                              }
                              if (filterItems.workoutLocation!.isNotEmpty) {
                                filterList.addAll(filterItems.workoutLocation!);
                              }
                              if (filterItems.rating != null) {
                                filterList.add('Rating:${filterItems.rating}');
                              }
                              if (filterItems.priceMin != null) {
                                filterList
                                    .add('Min Price:${filterItems.priceMin}');
                              }
                              if (filterItems.priceMax != null) {
                                filterList
                                    .add('Max Price:${filterItems.priceMax}');
                              }
                              trainerBloc.add(TrainerEvent.getTrainerList(
                                  filter: filterModel));
                              setState(() {});
                            }
                          }
                        },
                      ),
                    ],
                  ).padding(horizontal: 16, bottom: 16),
                  if (filterList.isNotEmpty)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Filter By',
                          style: AppTextStyle.tinySMRegular,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              filterList = [];
                              filterModel = TrainerFilterModel();
                              trainerBloc
                                  .add(const TrainerEvent.getTrainerList());
                            });
                          },
                          child: Text(
                            'Clear Filter',
                            style: AppTextStyle.tinySMMedium
                                .copyWith(color: colorPrimary),
                          ),
                        ),
                      ],
                    ).padding(horizontal: 16),
                  if (filterList.isNotEmpty)
                    Wrap(
                      children: List<Widget>.generate(
                        filterList.length,
                        (index) {
                          final chips = filterList[index];
                          return Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 1.5.w, horizontal: 2.w),
                            margin: const EdgeInsets.only(right: 6, top: 8),
                            decoration: BoxDecoration(
                              color: lightPrimary,
                              borderRadius: BorderRadius.circular(8.w),
                            ),
                            child: Text(
                              chips,
                              style: AppTextStyle.tinySMRegular
                                  .copyWith(color: colorPrimary),
                            ),
                          );
                        },
                      ).toList(),
                    ).padding(bottom: 16, horizontal: 16),
                  BlocBuilder<TrainerBloc, TrainerState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () => SizedBox(),
                        onLoading: () {
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: 3,
                            itemBuilder: (context, index) =>
                                TrainerCardShimmer(),
                          );
                        },
                        onGetTrainerListSuccess: (model) {
                          return model.list!.isEmpty
                              ? Center(
                                  child: Text(
                                  'No Trainers found!',
                                  style: AppTextStyle.bodyLgRegular
                                      .copyWith(color: colorLightGrey),
                                ))
                              : ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: trainers.length,
                                  itemBuilder: (context, index) => TrainerCard(
                                    model: trainers[index],
                                  ).gestures(
                                    onTap: () => context.router.push(
                                      TrainerDetailRoute(
                                          model: trainers[index]),
                                    ),
                                  ),
                                );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}

class RecommededTrainerSection extends StatefulWidget {
  final List<TrainerModel> trainers;
  const RecommededTrainerSection({super.key, required this.trainers});

  @override
  State<RecommededTrainerSection> createState() =>
      _RecommededTrainerSectionState();
}

class _RecommededTrainerSectionState extends State<RecommededTrainerSection> {
  int dotIndex = 0;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider.builder(
            options: CarouselOptions(
              autoPlayCurve: Curves.easeInOut,
              autoPlay: widget.trainers.length > 1,
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
              aspectRatio: 327 / 245,
              viewportFraction: 1,
            ),
            itemCount: widget.trainers.length,
            itemBuilder: (context, index, realIndex) => RecommendedTrainerCard(
              trainer: widget.trainers[index],
            ),
          ),
          verticalMargin8,
          widget.trainers.length > 1
              ? DotsIndicator(
                  dotsCount: widget.trainers.length,
                  position: dotIndex,
                  decorator: DotsDecorator(
                    color: colorPrimary.withOpacity(0.2),
                    activeColor: colorPrimary,
                    spacing: const EdgeInsets.symmetric(
                      horizontal: 2,
                    ),
                    size: const Size(6, 6),
                    activeSize: const Size(6, 6),
                  ),
                ).center()
              : SizedBox(),
        ],
      ).padding(horizontal: 16, bottom: 16);
}
