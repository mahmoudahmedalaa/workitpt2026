import 'package:country_picker/country_picker.dart';
import 'package:workitpt/features/authentication/signup/presentation/widget/country_picker.dart';

import '../../../../../config/typography.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/spacing.dart';
import '../../../../../core/export.dart';
import '../../../../../core/utils/spacing_utils.dart';
import '../../../../../core/utils/validator.dart';
import '../../../../../core/widgets/app_drop_down.dart';
import '../../../../../core/widgets/app_text_field.dart';

class TrainerEmergencyInfoWidget extends StatefulWidget {
  final GlobalKey<FormState> formkey;
  final TextEditingController phoneController;
  final TextEditingController nameController;
  final TextEditingController countryCodeController;
  final TextEditingController relationController;
  final TextEditingController countryController;
  const TrainerEmergencyInfoWidget(
      {super.key,
      required this.formkey,
      required this.relationController,
      required this.countryCodeController,
      required this.phoneController,
      required this.nameController,
      required this.countryController});

  @override
  State<TrainerEmergencyInfoWidget> createState() =>
      _TrainerEmergencyInfoWidgetState();
}

class _TrainerEmergencyInfoWidgetState
    extends State<TrainerEmergencyInfoWidget> {
  void showCountryPicker() {
    appCountryPicker(
      context: context,
      onCountryChanged: () {
        setState(() {});
      },
      countryCodeController: widget.countryCodeController,
      countryController: widget.countryController,
    );
  }

  @override
  Widget build(BuildContext context) {
    Country? country = Country.tryParse(widget.countryController.text);

    return Form(
      key: widget.formkey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Emergency Information',
              style: AppTextStyle.titleMDSemiBold,
            ),
            verticalSpacing(space: 8),
            Text('Tell us about emergency contact ',
                style: AppTextStyle.bodySMRegular.copyWith(color: darkText)),
            verticalMargin40,
            AppTextField(
              controller: widget.nameController,
              labelText: 'Contact Name',
              hintText: 'Enter your contact name',
              validator: (value) => validateNotEmpty(value, 'Contact Name'),
              prefixIcon: Assets.icons.profile.path,
              textColor: colorPrimary,
              textInputType: TextInputType.name,
            ),
            AppTextField(
              controller: widget.phoneController,
              labelText: 'Contact Number',
              validator: (value) => validateNotEmpty(value, 'Contact Number'),
              hintText: 'Enter Phone',
              prefixWidget: InkWell(
                onTap: showCountryPicker,
                child: Container(
                  width: 45,
                  child: Text(
                    country?.flagEmoji ?? '',
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ).center(),
                ),
              ),
              textColor: colorPrimary,
              prefixText: '${widget.countryCodeController.text} ',
              textInputType: TextInputType.phone,
            ),
            AppDropDown(
              controller: widget.relationController,
              validator: (value) =>
                  value == null ? 'Please select your relation' : null,
              items: const [
                'Father',
                'Mother',
                'Brother',
                'Sister',
                'Friends',
                'Daughter',
                'Grandson',
                'Granddaughter',
                'Partner',
                'Colleague'
              ],
              prefixIcon: Assets.icons.profile.path,
              hintText: 'Please Select your relation',
              hintStyle: AppTextStyle.bodySMRegular.copyWith(color: darkText),
            ),
            verticalMargin24,
            verticalMargin24
          ],
        ),
      ),
    );
  }
}
