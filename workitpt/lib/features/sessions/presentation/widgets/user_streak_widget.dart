import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:workitpt/features/home/data/model/streak_model.dart';

import '../../../../config/typography.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/spacing.dart';
import '../../../../core/export.dart';
import '../../../../core/injection/injection.dart';
import '../../../home/presentation/bloc/home_bloc.dart';

class UserStreakWidget extends StatefulWidget {
  const UserStreakWidget({super.key});

  @override
  State<UserStreakWidget> createState() => _UserStreakWidgetState();
}

class _UserStreakWidgetState extends State<UserStreakWidget> {
  int dotIndex = 0;
  HomeBloc homeBloc;

  _UserStreakWidgetState() : homeBloc = getIt<HomeBloc>();

  @override
  void initState() {
    homeBloc.add(HomeEvent.getUserStreak());
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => homeBloc,
        child: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            state.whenOrNull(
              onLoading: () => CupertinoActivityIndicator(),
            );
          },
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () => SizedBox(),
              onGetUserStreakSuccess: (model) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  width: 100.w,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                  decoration: const BoxDecoration(
                    color: lightPrimary,
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Weekly Streak',
                        style: AppTextStyle.headlineSMSemiBold,
                      ),
                      Text(
                        '${model.streak} Days',
                        style: AppTextStyle.bodySMSemiBold
                            .copyWith(color: darkText),
                      ),
                      verticalMargin12,
                      daySelection(model.streakDatesForThisWeek),
                    ],
                  ),
                );
              },
            );
          },
        ),
      );

  Widget daySelection(List<StreakDatesForThisWeek>? streak) {
    List<String> selectedDays = streak!.map((e) => e.day!).toList();
    return Wrap(
      children: [
        SizedBox(
          height: 50,
          child: ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final chips = dayList[index];
              return daySelectionDesign(
                title: chips.substring(0, 3),
                selected: selectedDays.contains(chips),
              );
            },
            scrollDirection: Axis.horizontal,
            itemCount: dayList.length,
          ),
        ),
      ],
    );
  }

  List<String> dayList = [
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday'
  ];

  Widget daySelectionDesign({
    required String title,
    required bool selected,
  }) =>
      !selected
          ? Container(
              margin: const EdgeInsets.only(right: 8, bottom: 12),
              child: DottedBorder(
                dashPattern: [6, 4],
                // radius: const Radius.circular(100),
                borderType: BorderType.Circle,
                padding: allPadding12,
                color: colorPrimary,
                child: Text(
                  title,
                  style: AppTextStyle.tinySMSemiBold.copyWith(color: darkText),
                ),
              ),
            )
          : Container(
              margin: const EdgeInsets.only(right: 8, bottom: 12),
              decoration: BoxDecoration(
                color: colorPrimary,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.done,
                size: 24,
                color: Colors.white,
              ).padding(all: 6),
            );
}
