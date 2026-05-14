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
import '../../../signup/presentation/widget/custom_date_picker.dart';

// ignore: must_be_immutable
class TrainerAdditionalInfoWidget extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController dobController;
  TextEditingController genderController = TextEditingController();
  final TextEditingController countryCodeController;
  final TextEditingController countryController;
  final TextEditingController phoneController;
  final TextEditingController cityController;

  TrainerAdditionalInfoWidget({
    super.key,
    required this.formKey,
    required this.dobController,
    required this.genderController,
    required this.countryCodeController,
    required this.countryController,
    required this.phoneController,
    required this.cityController,
  });

  @override
  State<TrainerAdditionalInfoWidget> createState() =>
      _TrainerAdditionalInfoWidgetState();
}

class _TrainerAdditionalInfoWidgetState
    extends State<TrainerAdditionalInfoWidget> {
  void showCountryPicker() {
    appCountryPicker(
        context: context,
        onCountryChanged: () {
          setState(() {});
        },
        countryController: widget.countryController,
        countryCodeController: widget.countryCodeController);
  }

  @override
  Widget build(BuildContext context) {
    Country? country = Country.tryParse(widget.countryController.text);

    return Form(
      key: widget.formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Additional Information',
              style: AppTextStyle.titleMDSemiBold,
            ),
            verticalSpacing(space: 8),
            Text('Tell us a bit about yourself.',
                style: AppTextStyle.bodySMRegular.copyWith(color: darkText)),
            verticalMargin40,
            CustomDatePicker(
              title: 'Date of Birth',
              controller: widget.dobController,
            ),
            AppDropDown(
              prefixIcon: Assets.icons.profile.path,
              mainColor: blackText,
              selectedTextColor: blackText,
              validator: (value) =>
                  value == null ? 'Please select your Gender' : null,
              items: const ['Male', 'Female', 'Others'],
              controller: widget.genderController,
              hintText: 'Pick your gender',
            ),
            AppTextField(
              readOnly: true,
              controller: widget.countryController,
              labelText: 'Country',
              validator: (value) => validateNotEmpty(value, 'Country'),
              hintText: 'Click on the flag to select the country.',
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
              textInputType: TextInputType.text,
              onTap: showCountryPicker,
            ),
            AppTextField(
              controller: widget.cityController,
              labelText: 'State/City',
              textInputAction: TextInputAction.next,
              hintText: 'Select State/City',
              validator: (value) => validateNotEmpty(value, 'State/City'),
              prefixIcon: Assets.icons.location.path,
              textColor: colorPrimary,
              textInputType: TextInputType.text,
            ),
            AppTextField(
              controller: widget.phoneController,
              labelText: 'Contact Number (Optional)',
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
              textInputType: TextInputType.phone,
              prefixText: '${widget.countryCodeController.text} ',
            ),
          ],
        ),
      ),
    );
  }
}
