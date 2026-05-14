import 'package:place_picker/entities/location_result.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/spacing.dart';
import '../../../../../core/widgets/app_text_field.dart';
import '../../../../core/export.dart';
import '../../../authentication/signup/presentation/widget/location_dropdown_widget.dart';
import '../../../authentication/signup/presentation/widget/multi_select_dropdown.dart';
import '../../data/models/profile_model.dart';

// ignore: must_be_immutable
class FitnessGoalWidget extends StatefulWidget {
  final GlobalKey formKey;
  final List<String> fitnessInterestController;
  final TextEditingController fitnessGoalController;
  final TextEditingController workoutLocationController;
  Gym homeLocation;
  Gym gymLocation;
  Gym outdoorLocation;
  final void Function(LocationResult) onHomeSelect;
  final void Function(LocationResult) onGymSelect;
  final void Function(LocationResult) onOutdoorSelect;
  final TextEditingController medicalConditionController;
  final TextEditingController aboutController;
  final TextEditingController onlineController;
  final void Function(List<String>) onConfirm;
  final dynamic Function(String)? onRemove;
  FitnessGoalWidget({
    super.key,
    required this.formKey,
    required this.fitnessGoalController,
    required this.workoutLocationController,
    required this.gymLocation,
    required this.homeLocation,
    required this.outdoorLocation,
    required this.medicalConditionController,
    required this.aboutController,
    required this.onHomeSelect,
    required this.onGymSelect,
    required this.onOutdoorSelect,
    required this.onlineController,
    required this.onConfirm,
    this.onRemove,
    required this.fitnessInterestController,
  });

  @override
  State<FitnessGoalWidget> createState() => _FitnessGoalWidgetState();
}

class _FitnessGoalWidgetState extends State<FitnessGoalWidget> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) => Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppTextField(
              controller: widget.fitnessGoalController,
              labelText: 'Fitness Goal',
              hintText: 'Tell us a bit about your fitness goals',
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
              selectedItems: widget.fitnessInterestController,
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
              textColor: colorPrimary,
              textInputType: TextInputType.text,
              counterText: '256 characters',
              maxLength: 256,
            ),
            AppTextField(
              controller: widget.aboutController,
              labelText: 'About You',
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
      ).padding(horizontal: 24);
}
