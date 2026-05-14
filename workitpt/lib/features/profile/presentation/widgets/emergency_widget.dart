import 'package:country_picker/country_picker.dart';
import 'package:workitpt/features/authentication/signup/presentation/widget/country_picker.dart';

import '../../../../../config/typography.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/app_drop_down.dart';
import '../../../../../core/widgets/app_text_field.dart';
import '../../../../core/constants/spacing.dart';
import '../../../../core/export.dart';
import '../../../../core/extension/cap_extension.dart';

class EmergencyWidget extends StatefulWidget {
  final GlobalKey formKey;
  final TextEditingController nameController;
  final TextEditingController countryCodeController;
  final TextEditingController countryController;
  final TextEditingController relationController;
  final TextEditingController phoneController;
  const EmergencyWidget({
    super.key,
    required this.formKey,
    required this.nameController,
    required this.countryCodeController,
    required this.relationController,
    required this.phoneController,
    required this.countryController,
  });

  @override
  State<EmergencyWidget> createState() => _EmergencyWidgetState();
}

class _EmergencyWidgetState extends State<EmergencyWidget> {
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
      key: widget.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextField(
            controller: widget.nameController,
            labelText: 'Contact Name',
            hintText: 'Enter your contact name',
            prefixIcon: Assets.icons.profile.path,
            textColor: colorPrimary,
            textInputType: TextInputType.text,
          ),
          AppTextField(
            controller: widget.phoneController,
            labelText: 'Contact Number',
            hintText: 'Enter Phone',
            prefixWidget: InkWell(
              onTap: showCountryPicker,
              child: Container(
                width: 45,
                child: Text(
                  country?.flagEmoji ?? "",
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
            validator: (value) =>
                value == null ? 'Please select your gender' : null,
            controller: widget.relationController,
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
            hintText: 'Please select your relation',
            hintStyle: AppTextStyle.bodySMRegular.copyWith(color: darkText),
            value: widget.relationController.text.isNotEmpty
                ? widget.relationController.text.capitalize()
                : null,
          ),
          verticalMargin24,
        ],
      ),
    ).padding(horizontal: 24);
  }
}
