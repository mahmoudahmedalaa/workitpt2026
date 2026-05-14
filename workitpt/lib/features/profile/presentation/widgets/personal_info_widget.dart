import 'package:country_picker/country_picker.dart';
import 'package:workitpt/features/authentication/signup/presentation/widget/country_picker.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/spacing.dart';
import '../../../../../core/export.dart';
import '../../../../../core/widgets/app_drop_down.dart';
import '../../../../../core/widgets/app_text_field.dart';
import '../../../authentication/signup/presentation/widget/custom_date_picker.dart';

class PersonalInfoWidget extends StatefulWidget {
  final GlobalKey formKey;
  final TextEditingController phoneController;
  final TextEditingController stateController;
  final TextEditingController countryController;
  final TextEditingController countryCodeController;
  final TextEditingController weightController;
  final TextEditingController heightController;
  final TextEditingController occupationController;
  final TextEditingController dobController;
  final TextEditingController genderController;
  const PersonalInfoWidget(
      {super.key,
      required this.formKey,
      required this.phoneController,
      required this.stateController,
      required this.countryController,
      required this.countryCodeController,
      required this.weightController,
      required this.heightController,
      required this.occupationController,
      required this.dobController,
      required this.genderController});

  @override
  State<PersonalInfoWidget> createState() => _PersonalInfoWidgetState();
}

class _PersonalInfoWidgetState extends State<PersonalInfoWidget> {
  String weightUnit = 'kg';
  String heightUnit = 'ft';

  void showCountryPicker() {
    appCountryPicker(
      context: context,
      onCountryChanged: () {
        setState(() {});
      },
      countryController: widget.countryController,
      countryCodeController: widget.countryCodeController,
    );
  }

  @override
  Widget build(BuildContext context) {
    Country? country = Country.tryParse(widget.countryController.text);
    return Form(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomDatePicker(
            title: 'Date of Birth',
            controller: widget.dobController,
          ),
          AppDropDown(
            validator: (value) =>
                value == null ? 'Please select your gender' : null,
            controller: widget.genderController,
            prefixIcon: Assets.icons.profile.path,
            mainColor: blackText,
            selectedTextColor: blackText,
            items: const ['Male', 'Female', 'Others'],
            hintText: 'Pick your gender',
            labelText: 'Gender',
            value: widget.genderController.text.isNotEmpty
                ? widget.genderController.text
                : null,
          ),
          AppTextField(
            readOnly: true,
            controller: widget.countryController,
            labelText: 'Country',
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
            controller: widget.stateController,
            labelText: 'State/City',
            hintText: 'Select State/City',
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
            textInputAction: TextInputAction.done,
            // validator: (value) => validateMobile(value!),
          ),
          AppTextField(
            controller: widget.weightController,
            labelText: 'Weight (Optional)',
            hintText: 'Enter Weight',
            prefixIcon: Assets.icons.weight.path,
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
            textColor: colorPrimary,
            textInputType: TextInputType.numberWithOptions(decimal: true),
          ),
          AppTextField(
            controller: widget.heightController,
            labelText: 'Height (Optional)',
            hintText: 'Enter Height',
            prefixIcon: Assets.icons.height.path,
            // suffixText: 'cm',
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
            textColor: colorPrimary,
            textInputType: TextInputType.numberWithOptions(decimal: true),
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
    ).padding(horizontal: 24);
  }
}
