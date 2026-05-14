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
import 'custom_date_picker.dart';

class AdditionalInfoWidget extends StatefulWidget {
  final GlobalKey formkey;
  final TextEditingController phoneController;
  final TextEditingController countryController;
  final TextEditingController genderController;
  final TextEditingController dateController;
  final TextEditingController countryCodeController;
  final TextEditingController weightController;
  final TextEditingController heightController;
  final TextEditingController cityController;
  final TextEditingController occupationController;

  const AdditionalInfoWidget(
      {super.key,
      required this.occupationController,
      required this.phoneController,
      required this.genderController,
      required this.cityController,
      required this.countryCodeController,
      required this.dateController,
      required this.countryController,
      required this.formkey,
      required this.heightController,
      required this.weightController});

  @override
  State<AdditionalInfoWidget> createState() => _AdditionalInfoWidgetState();
}

class _AdditionalInfoWidgetState extends State<AdditionalInfoWidget> {
  String weightUnit = 'kg';
  String heightUnit = 'ft';
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
      key: widget.formkey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Additional Information',
                  style: AppTextStyle.titleMDSemiBold,
                ),
                InkWell(
                  onTap: () => context.router.pop(),
                  child: Text(
                    'Skip',
                    style: AppTextStyle.bodyMDRegular
                        .copyWith(color: colorPrimary),
                  ),
                ),
              ],
            ),
            verticalSpacing(space: 8),
            Text('Tell us a bit about yourself.',
                style: AppTextStyle.bodySMRegular.copyWith(color: darkText)),
            verticalMargin40,
            CustomDatePicker(
              controller: widget.dateController,
              title: 'Date of Birth',
            ),
            AppDropDown(
              controller: widget.genderController,
              prefixIcon: Assets.icons.profile.path,
              mainColor: blackText,
              selectedTextColor: blackText,
              validator: (value) =>
                  value == null ? 'Please select your Gender' : null,
              items: const ['Male', 'Female', 'Others'],
              hintText: 'Pick your gender',
              labelText: 'Gender',
            ),
            AppTextField(
              readOnly: true,
              controller: widget.countryController,
              labelText: 'Country',
              validator: (value) => validateNotEmpty(value, 'Country'),
              hintText: 'Tap to select the Country',
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
              prefixText: '${widget.countryCodeController.text} ',
              textColor: colorPrimary,
              textInputType: TextInputType.phone,
              // validator: (value) => validateMobile(value!),
            ),
            AppTextField(
              controller: widget.weightController,
              labelText: 'Weight (Optional)',
              hintText: 'Enter Weight',
              prefixIcon: Assets.icons.weight.path,
              textColor: colorPrimary,
              textInputType: TextInputType.numberWithOptions(decimal: true),
              suffixWidget: DropdownButton<String>(
                value: weightUnit,
                style: TextStyle(fontSize: 14, color: darkText),
                icon: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: darkText,
                ),
                underline: SizedBox(),
                onChanged: (val) {
                  setState(() {
                    weightUnit = val!;
                  });
                },
                items: ['kg', 'lbs']
                    .map((e) => DropdownMenuItem<String>(
                          child: Text(e),
                          value: e,
                        ))
                    .toList(),
              ),
            ),
            AppTextField(
              controller: widget.heightController,
              labelText: 'Height (Optional)',
              hintText: 'Enter Height',
              prefixIcon: Assets.icons.height.path,
              // suffixText: heightUnit,
              textColor: colorPrimary,
              textInputType: TextInputType.numberWithOptions(decimal: true),
              suffixWidget: DropdownButton<String>(
                value: heightUnit,
                style: TextStyle(fontSize: 14, color: darkText),
                icon: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: darkText,
                ),
                underline: SizedBox(),
                onChanged: (val) {
                  setState(() {
                    heightUnit = val!;
                  });
                },
                items: ['ft', 'cm']
                    .map((e) => DropdownMenuItem<String>(
                          child: Text(e),
                          value: e,
                        ))
                    .toList(),
              ),
            ),
            AppTextField(
              controller: widget.occupationController,
              labelText: 'Occupation(Optional)',
              hintText: 'Enter Occupation',
              prefixIcon: Assets.icons.occupation.path,
              textColor: colorPrimary,
              textInputType: TextInputType.text,
            ),
            verticalMargin24,
          ],
        ),
      ),
    );
  }
}
