import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:place_picker/entities/location_result.dart';
import 'package:place_picker/widgets/place_picker.dart';

import '../../../../../config/typography.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/keys/app_keys.dart';
import '../../../../../core/constants/spacing.dart';
import '../../../../../core/utils/spacing_utils.dart';
import '../../../../../core/widgets/app_drop_down.dart';
import '../../../../../core/widgets/app_text_field.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../profile/data/models/profile_model.dart';
import '../../../signup/presentation/widget/location_dropdown_widget.dart';
import '../../../signup/presentation/widget/multi_select_dropdown.dart';

// ignore: must_be_immutable
class TrainerFitnessInfoWidget extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final List<String> specializationController;
  Gym homeLocation;
  Gym gymLocation;
  Gym outdoorLocation;
  final void Function(LocationResult) onHomeSelect;
  final void Function(LocationResult) onGymSelect;
  final void Function(LocationResult) onOutdoorSelect;
  final TextEditingController medicalConditionController;
  final TextEditingController aboutController;
  final TextEditingController experienceController;
  final TextEditingController onlineController;
  final void Function(List<String>) onConfirm;
  final dynamic Function(String)? onRemove;

  TrainerFitnessInfoWidget({
    super.key,
    required this.formKey,
    required this.specializationController,
    required this.medicalConditionController,
    required this.aboutController,
    required this.experienceController,
    required this.onConfirm,
    this.onRemove,
    required this.onHomeSelect,
    required this.onGymSelect,
    required this.onOutdoorSelect,
    required this.gymLocation,
    required this.homeLocation,
    required this.outdoorLocation,
    required this.onlineController,
  });

  @override
  State<TrainerFitnessInfoWidget> createState() =>
      _TrainerFitnessInfoWidgetState();
}

class _TrainerFitnessInfoWidgetState extends State<TrainerFitnessInfoWidget> {
  LatLng? selectedLatLng = const LatLng(27.67386, 85.348685);

  Future<String> getLocation() async {
    final result = await Navigator.of(context).push(MaterialPageRoute<dynamic>(
        builder: (context) => PlacePicker(
              AppKeys.apiKey,
              displayLocation: selectedLatLng,
            )));
    return '${result!.formattedAddress}';
  }

  @override
  Widget build(BuildContext context) => Form(
        key: widget.formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Preferences',
                style: AppTextStyle.titleMDSemiBold,
              ),
              verticalSpacing(space: 8),
              Text('This help us create your personalized plan',
                  style: AppTextStyle.bodySMRegular.copyWith(color: darkText)),
              verticalMargin40,
              MultiSelectDropDown(
                title: 'Specialization',
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
                selectedItems: widget.specializationController,
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
                hintText: 'Any medical conditions',
                prefixIcon: Assets.icons.paragraph.path,
                textColor: colorPrimary,
                textInputType: TextInputType.text,
              ),
              AppTextField(
                controller: widget.aboutController,
                hintText: 'Tell us a bit about yourself.',
                labelText: 'About you',
                prefixIcon: Assets.icons.paragraph.path,
                textColor: colorPrimary,
                textInputType: TextInputType.text,
              ),
              AppDropDown(
                items: const [
                  '1 to 3 Years',
                  '3 to 6 Years',
                  '6 to 9 Years',
                  'Morethan 9 Years'
                ],
                validator: (value) =>
                    value == null ? 'Please select your experience' : null,
                controller: widget.experienceController,
                hintText: 'Personal Training Experience',
                prefixIcon: Assets.icons.verify.path,
              ),
              verticalMargin24,
            ],
          ),
        ),
      );
}
