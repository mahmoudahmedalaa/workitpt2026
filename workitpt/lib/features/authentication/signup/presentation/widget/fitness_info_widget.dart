import 'package:flutter/material.dart';
import 'package:place_picker/entities/location_result.dart';

import '../../../../../config/typography.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/spacing.dart';
import '../../../../../core/utils/spacing_utils.dart';
import '../../../../../core/utils/validator.dart';
import '../../../../../core/widgets/app_text_field.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../profile/data/models/profile_model.dart';
import 'location_dropdown_widget.dart';
import 'multi_select_dropdown.dart';

// ignore: must_be_immutable
class FitnessInfoWidget extends StatefulWidget {
  final GlobalKey formkey;
  final List<String> loseWeightController;
  final TextEditingController fitnessGoalController;
  final TextEditingController workoutLocationController;
  final TextEditingController onlineController;
  Gym homeLocation;
  Gym gymLocation;
  Gym outdoorLocation;
  final void Function(LocationResult) onHomeSelect;
  final void Function(LocationResult) onGymSelect;
  final void Function(LocationResult) onOutdoorSelect;
  final TextEditingController medicalConditionController;
  final TextEditingController aboutController;
  final void Function(List<String>) onConfirm;
  final dynamic Function(String)? onRemove;

  FitnessInfoWidget(
      {super.key,
      required this.formkey,
      required this.aboutController,
      required this.medicalConditionController,
      required this.gymLocation,
      required this.homeLocation,
      required this.outdoorLocation,
      required this.workoutLocationController,
      required this.loseWeightController,
      required this.onHomeSelect,
      required this.onGymSelect,
      required this.onOutdoorSelect,
      required this.onlineController,
      required this.onConfirm,
      this.onRemove,
      required this.fitnessGoalController});

  @override
  State<FitnessInfoWidget> createState() => _FitnessInfoWidgetState();
}

class _FitnessInfoWidgetState extends State<FitnessInfoWidget> {
  @override
  Widget build(BuildContext context) => Form(
        key: widget.formkey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Fitness Goal & Preferences',
                style: AppTextStyle.titleMDSemiBold,
              ),
              verticalSpacing(space: 8),
              Text('This help us create your personalized plan',
                  style: AppTextStyle.bodySMRegular.copyWith(color: darkText)),
              verticalMargin40,
              AppTextField(
                controller: widget.fitnessGoalController,
                labelText: 'Fitness Goal',
                hintText: 'Eg.Lose Weight',
                validator: (value) => validateNotEmpty(value, 'Fitness Goal'),
                prefixIcon: Assets.icons.fitnessGoal.path,
                textColor: colorPrimary,
                textInputType: TextInputType.text,
                counterText: '256 characters',
                maxLength: 256,
              ),
              MultiSelectDropDown(
                title: 'Fitness Interest',
                items: const [
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
                ],
                selectedItems: widget.loseWeightController,
                onConfirm: widget.onConfirm,
                onRemove: widget.onRemove,
              ),
              LocationMultiDropdown(
                homeLocation: widget.homeLocation,
                gymLocation: widget.gymLocation,
                outdoorLocation: widget.outdoorLocation,
                onGymSelect: widget.onGymSelect,
                onHomeSelect: widget.onHomeSelect,
                onOutdoorSelect: widget.onOutdoorSelect,
                onlineController: widget.onlineController,
              ),
              AppTextField(
                controller: widget.medicalConditionController,
                labelText: 'Medical Conditions',
                hintText: 'Any Medical Conditions',
                prefixIcon: Assets.icons.paragraph.path,
                validator: (value) =>
                    validateNotEmpty(value, 'Medical Conditions'),
                textColor: colorPrimary,
                textInputType: TextInputType.text,
                counterText: '256 characters',
                maxLength: 256,
              ),
              AppTextField(
                controller: widget.aboutController,
                labelText: 'About You',
                validator: (value) => validateNotEmpty(value, 'About'),
                hintText: 'Tell us a bit about yourself.',
                prefixIcon: Assets.icons.paragraph.path,
                textColor: colorPrimary,
                textInputType: TextInputType.text,
                counterText: '256 characters',
                maxLength: 256,
              ),
              verticalMargin24,
            ],
          ),
        ),
      );
}
