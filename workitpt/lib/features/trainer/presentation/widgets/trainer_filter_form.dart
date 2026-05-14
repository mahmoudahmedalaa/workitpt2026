import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

import '../../../../config/typography.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/spacing.dart';
import '../../../../core/export.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../sessions/presentation/widgets/filter_tile.dart';
import '../../../sessions/presentation/widgets/filter_tile2.dart';
import '../../data/models/trainer_filter_model.dart';

class TrainerFilterForm extends StatefulWidget {
  final TrainerFilterModel? model;
  const TrainerFilterForm({super.key, this.model});

  @override
  State<TrainerFilterForm> createState() => _TrainerFilterFormState();
}

class _TrainerFilterFormState extends State<TrainerFilterForm> {
  List<String> items = [
    'Specialization',
    'Ratings',
    'Workout Location',
    'Price'
  ];

  List<String> workoutLocation = ['Home', 'Gym', 'Outdoor', 'Online'];

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

  final _minPriceController = TextEditingController();
  final _maxPriceController = TextEditingController();

  List<String> selectedWorkoutType = [];
  List<String> selectedWorkoutLocation = [];
  TextEditingController selectedRating = TextEditingController();

  void setInitalValues() {
    if (widget.model != null) {
      if (widget.model!.specialization != null &&
          widget.model!.specialization!.isNotEmpty) {
        selectedWorkoutType = widget.model!.specialization!;
      }
      if (widget.model!.workoutLocation != null &&
          widget.model!.workoutLocation!.isNotEmpty) {
        selectedWorkoutLocation = widget.model!.workoutLocation!;
      }
      if (widget.model!.rating != null) {
        selectedRating.text = widget.model!.rating!.toString();
      }
      if (widget.model!.priceMin != null && widget.model!.priceMax != null) {
        _minPriceController.text = widget.model!.priceMin!.toString();
        _maxPriceController.text = widget.model!.priceMax!.toString();
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
    FilterTile2Widget(
        items: const ['1', '2', '3', '4', '5'], selectedChip: selectedRating),
    FilterTileWidget(
        items: workoutLocation, selectedItems: selectedWorkoutLocation),
    Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
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
    ).width(100.w),
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
          widget.model!.specialization != null &&
              widget.model!.specialization!.isNotEmpty,
          widget.model!.rating != null,
          widget.model!.workoutLocation != null &&
              widget.model!.workoutLocation!.isNotEmpty,
          widget.model!.priceMin != null && widget.model!.priceMax != null
        ]
      : [false, false, false, false];

  @override
  Widget build(BuildContext context) => Container(
        constraints:
            BoxConstraints(maxHeight: MediaQuery.of(context).size.height * .9),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
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
                itemBuilder: (context, index) => Theme(
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
                      Navigator.pop(context);
                    },
                  ),
                ),
                Flexible(
                  child: AppButton(
                    buttonText: 'Filter',
                    onPressed: () {
                      final trainerFilterModel = TrainerFilterModel(
                          specialization:
                              selectedFilter.first ? selectedWorkoutType : [],
                          rating: selectedFilter[1]
                              ? int.tryParse(selectedRating.text)
                              : null,
                          workoutLocation:
                              selectedFilter[2] ? selectedWorkoutLocation : [],
                          priceMin: double.tryParse(_minPriceController.text),
                          priceMax: double.tryParse(_maxPriceController.text));
                      if (selectedFilter.contains(true)) {
                        Navigator.pop(context, trainerFilterModel);
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
