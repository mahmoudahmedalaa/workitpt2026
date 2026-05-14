import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sizer/sizer.dart';

import '../../../../config/typography.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/spacing.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../data/models/session_filter_model.dart';
import 'filter_tile.dart';
import 'filter_tile2.dart';

class FilterIconButton extends StatefulWidget {
  final String? icon;
  final VoidCallback? onPressed;

  const FilterIconButton({super.key, this.icon, this.onPressed});

  @override
  State<FilterIconButton> createState() => _FilterIconButtonState();
}

class _FilterIconButtonState extends State<FilterIconButton> {
  @override
  Widget build(BuildContext context) => InkWell(
        onTap: widget.onPressed ??
            () {
              showModalBottomSheet<void>(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (context) => FilterForm(
                  isUser: true,
                ),
              );
            },
        child: Container(
          height: 42,
          width: 42,
          padding: allPadding12,
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: lightPrimary),
          child: widget.icon != null
              ? Image.asset(
                  widget.icon!,
                  color: colorPrimary,
                )
              : const Icon(
                  Icons.add,
                  color: colorPrimary,
                ),
        ),
      );
}

class FilterForm extends StatefulWidget {
  final SessionFilterModel? model;
  final bool isUser;
  const FilterForm({
    super.key,
    this.model,
    required this.isUser,
  });

  @override
  State<FilterForm> createState() => _FilterFormState();
}

class _FilterFormState extends State<FilterForm> {
  bool showCategoryFilter = true;
  bool showBrandFilter = true;

  List<String> items = [
    'Workout Type',
    'Workout Location',
    'Session Type',
    'Booking Status',
    'Difficulty Level',
    'Price'
  ];

  final workoutType = const [
    'Weightlifting',
    'Cardiovascular Conditioning',
    'Strength and Conditioning',
    'Postnatal Fitness',
    'Pre-natal Fitness',
    'Senior Fitness',
    'Rehabilitation and Injury Prevention',
    'Flexibility and Stretching',
    'Mindfulness and Meditation',
    'Yoga',
    'Pilates',
    'CrossFit',
    'Functional Training',
    'High-Intensity Interval Training (HIIT)',
    'Kickboxing',
    'Boxing',
    'Jiu jitsu',
    'Judo',
    'Running and Endurance Training',
    'Cycling (Indoor or Outdoor)',
    'Dance Fitness (e.g., Zumba, Hip Hop, Ballet)',
    'Swimming',
    'Soccer',
    'Basketball',
    'Volleyball',
    'Tennis',
    'Bodyweight Training',
    'Nutritionist',
  ];
  final workoutLocation = const [
    'Home',
    'Gym',
    'Outdoor',
    'Online',
  ];

  final sessionType = const [
    '1-on-1',
    'Group',
  ];
  final bookingStatus = const [
    'Booked',
    'Not Booked',
  ];
  final difficultyLevel = const [
    'Beginner',
    'Intermediate',
    'Advanced',
  ];

  final _minPriceController = TextEditingController();
  final _maxPriceController = TextEditingController();

  List<String> selectedWorkoutType = [];
  List<String> selectedWorkoutLocation = [];
  // TextEditingController selectedSelectType = TextEditingController();
  // TextEditingController selectedWorkoutLocation = TextEditingController();
  TextEditingController selectedSession = TextEditingController();
  TextEditingController selectedBooking = TextEditingController();
  TextEditingController selectedDifficulty = TextEditingController();

  void setInitalValues() {
    if (widget.model != null) {
      if (widget.model!.session != null && widget.model!.session!.isNotEmpty) {
        selectedWorkoutType = widget.model!.session!;
      }
      if (widget.model!.workoutLocation != null &&
          widget.model!.workoutLocation!.isNotEmpty) {
        selectedWorkoutLocation = widget.model!.workoutLocation!;
      }
      if (widget.model!.sessionType != null &&
          widget.model!.sessionType!.isNotEmpty) {
        selectedSession.text = widget.model!.sessionType!;
      }
      if (widget.model!.booked != null && widget.model!.booked != '') {
        selectedBooking.text = widget.model!.booked!;
      }
      if (widget.model!.difficult != null &&
          widget.model!.difficult!.isNotEmpty) {
        selectedDifficulty.text = widget.model!.difficult!;
      }
      if (widget.model!.minPrice != null && widget.model!.maxPrice != null) {
        _minPriceController.text = widget.model!.minPrice!.toString();
        _maxPriceController.text = widget.model!.maxPrice!.toString();
      }
    }
  }

  @override
  void initState() {
    setInitalValues();
    super.initState();
  }

  late List<Widget> views = [
    FilterTileWidget(items: workoutType, selectedItems: selectedWorkoutType),
    FilterTileWidget(
        items: workoutLocation, selectedItems: selectedWorkoutLocation),
    FilterTile2Widget(items: sessionType, selectedChip: selectedSession),
    widget.isUser
        ? SizedBox()
        : FilterTile2Widget(
            items: bookingStatus, selectedChip: selectedBooking),
    FilterTile2Widget(items: difficultyLevel, selectedChip: selectedDifficulty),
    Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            Text(
              'Minimum',
              style: AppTextStyle.bodySMRegular,
            ),
            verticalMargin8,
            SizedBox(
              width: 20.w,
              height: 8.h,
              child: AppTextField(
                controller: _minPriceController,
                textInputType: TextInputType.number,
                textInputAction: TextInputAction.done,
                digitsOnly: true,
                decoration: decoration,
              ),
            ),
          ],
        ),
        const Icon(
          Icons.remove,
          size: 24,
        ),
        Column(
          children: [
            Text(
              'Maximum',
              style: AppTextStyle.bodySMRegular,
            ),
            verticalMargin8,
            SizedBox(
              width: 20.w,
              height: 8.h,
              child: AppTextField(
                controller: _maxPriceController,
                textInputAction: TextInputAction.done,
                digitsOnly: true,
                decoration: decoration,
                textInputType: TextInputType.number,
              ),
            ),
          ],
        )
      ],
    ),
  ];
  final decoration = const InputDecoration(
    fillColor: Colors.transparent,
    border: OutlineInputBorder(),
    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: darkText)),
    filled: true,
    focusedBorder:
        OutlineInputBorder(borderSide: BorderSide(color: colorPrimary)),
  );
  late List<bool> selectedFilter = widget.model != null
      ? [
          widget.model!.session != null && widget.model!.session!.isNotEmpty,
          widget.model!.workoutLocation != null &&
              widget.model!.workoutLocation!.isNotEmpty,
          widget.model!.sessionType != null &&
              widget.model!.sessionType!.isNotEmpty,
          widget.model!.booked != null &&
              widget.model!.booked != '' &&
              (!widget.isUser),
          widget.model!.difficult != null &&
              widget.model!.difficult!.isNotEmpty,
          widget.model!.minPrice != null && widget.model!.maxPrice != null
        ]
      : [false, false, false, false, false, false];

  @override
  Widget build(BuildContext context) => Container(
        constraints:
            BoxConstraints(maxHeight: MediaQuery.of(context).size.height * .9),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Column(
          children: [
            verticalMargin24,
            Text(
              'Search Filter',
              style: AppTextStyle.subHeadLgSemiBold,
            ),
            Container(
              decoration: BoxDecoration(
                color: colorPrimary,
                borderRadius: BorderRadius.circular(20),
              ),
              width: 200,
              height: 4,
            ),
            // verticalMargin24,
            Flexible(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) => widget.isUser && index == 3
                    ? SizedBox()
                    : Theme(
                        data: Theme.of(context)
                            .copyWith(dividerColor: Colors.transparent),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: ExpansionTile(
                            tilePadding: EdgeInsets.zero,
                            leading: CupertinoCheckbox(
                              activeColor: colorPrimary,
                              onChanged: (value) {
                                setState(() {
                                  selectedFilter[index] = value!;
                                });
                              },
                              value: selectedFilter[index],
                            ),
                            backgroundColor: filterExpansionBG,
                            title: Text(
                              items[index],
                              style: AppTextStyle.bodySMSemiBold,
                            ),
                            children: <Widget>[
                              views[index],
                            ],
                          ),
                        ),
                      ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: AppButton(
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    buttonText: 'Cancel',
                    textColor: blackText,
                    suffixWidget: const SizedBox(),
                    onPressed: () {
                      Navigator.pop(context, SessionFilterModel());
                    },
                  ),
                ),
                Flexible(
                  child: AppButton(
                    buttonText: 'Filter',
                    onPressed: () {
                      final sessionfilterModel = SessionFilterModel(
                          session:
                              selectedFilter.first ? selectedWorkoutType : [],
                          booked: selectedFilter[3] ? selectedBooking.text : '',
                          difficult:
                              selectedFilter[4] ? selectedDifficulty.text : '',
                          // selectType:
                          //     selectedFilter[1] ? selectedWorkoutLocation.text : '',
                          workoutLocation:
                              selectedFilter[1] ? selectedWorkoutLocation : [],
                          sessionType: selectedFilter[2]
                              ? selectedSession.text.toLowerCase()
                              : '',
                          minPrice: double.tryParse(_minPriceController.text),
                          maxPrice: double.tryParse(_maxPriceController.text));
                      if (selectedFilter.contains(true)) {
                        Navigator.pop(context, sessionfilterModel);
                      } else {
                        EasyLoading.showInfo('Please select filters');
                      }
                    },
                    suffixWidget: const SizedBox(),
                  ),
                ),
              ],
            )
          ],
        ),
      );
}
