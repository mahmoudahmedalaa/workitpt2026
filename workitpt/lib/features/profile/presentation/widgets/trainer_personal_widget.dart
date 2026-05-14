import 'package:country_picker/country_picker.dart';
import 'package:workitpt/features/authentication/signup/presentation/widget/country_picker.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/export.dart';
import '../../../../core/widgets/app_drop_down.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../authentication/signup/presentation/widget/custom_date_picker.dart';

class TrainerPersonalWidget extends StatefulWidget {
  final GlobalKey formKey;
  final TextEditingController phoneController;
  final TextEditingController stateController;
  final TextEditingController countryController;
  final TextEditingController countryCodeController;
  final TextEditingController dobController;
  final TextEditingController genderController;
  const TrainerPersonalWidget(
      {super.key,
      required this.formKey,
      required this.phoneController,
      required this.stateController,
      required this.countryController,
      required this.countryCodeController,
      required this.dobController,
      required this.genderController});

  @override
  State<TrainerPersonalWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<TrainerPersonalWidget> {
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
            CustomDatePicker(
              title: 'Date of Birth',
              controller: widget.dobController,
            ),
            AppDropDown(
              // isDisabled: true,
              prefixIcon: Assets.icons.profile.path,
              mainColor: blackText,
              selectedTextColor: blackText,
              items: const ['Male', 'Female', 'Others'],
              validator: (value) =>
                  value == null ? 'Please select your gender' : null,
              controller: widget.genderController,
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
              textInputType: TextInputType.number,
            ),
          ],
        ).padding(horizontal: 24),
      ),
    );
  }
}
