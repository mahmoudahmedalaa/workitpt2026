// country_picker.dart

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:workitpt/core/constants/app_colors.dart';

appCountryPicker(
    {required BuildContext context,
    required VoidCallback onCountryChanged,
    TextEditingController? countryController,
    required TextEditingController countryCodeController}) {
  showCountryPicker(
    context: context,
    favorite: <String>['NP', 'HK'],
    showPhoneCode: true,
    onSelect: (Country country) {
      onCountryChanged.call();
      countryController?.text = country.name;
      countryCodeController.text = country.phoneCode;
    },
    // Optional. Sets the theme for the country list picker.
    countryListTheme: CountryListThemeData(
      textStyle: const TextStyle(
        fontFamily: 'Source Sans Pro',
      ),
      bottomSheetHeight: MediaQuery.of(context).size.height / 1.5,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(25),
        topRight: Radius.circular(25),
      ),
      // Optional. Styles the search field.
      inputDecoration: const InputDecoration(
        contentPadding: EdgeInsets.all(20),
        hintText: 'Start typing to search',
        constraints: BoxConstraints(maxHeight: 60),
        prefixIcon: Icon(
          Icons.search,
          color: colorAccent,
        ),
        filled: true,
        border: InputBorder.none,
        disabledBorder: InputBorder.none,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(18))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(18))),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(18))),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(18))),
      ),
      // Optional. Styles the text in the search field
      searchTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 16,
      ),
    ),
  );
}
