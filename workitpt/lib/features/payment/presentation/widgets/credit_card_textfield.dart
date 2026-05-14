import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:workitpt/core/constants/spacing.dart';

import '../../../../core/constants/app_colors.dart';
import 'card_utils.dart';

class CreditCardTextField extends StatelessWidget {
  final TextEditingController controller;
  const CreditCardTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: CardUtils.validateCardNum,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        CardNumberFormatter(),
      ],
      controller: controller,
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.number,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        isDense: true,
        border: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: darkText,
          ),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: darkText,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: darkText,
          ),
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: darkText,
          ),
        ),
        focusedErrorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        hintText: 'XXXX XXXX XXXX XXXX',
        hintStyle: const TextStyle(fontSize: 14, color: darkText),
        labelText: 'Card Number',
        contentPadding: allPadding12,
        labelStyle: const TextStyle(fontSize: 14, color: darkText),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      maxLength: 19,
    );
  }
}

class ExpiryDateTextField extends StatelessWidget {
  final TextEditingController controller;
  ExpiryDateTextField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(4),
        CardMonthInputFormatter()
      ],
      controller: controller,
      decoration: InputDecoration(
        isDense: true,
        border: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: darkText,
          ),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: darkText,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: darkText,
          ),
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: darkText,
          ),
        ),
        focusedErrorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        hintText: 'MM/YY',
        hintStyle: const TextStyle(fontSize: 14, color: darkText),
        labelText: 'Expiry Date',
        contentPadding: allPadding12,
        labelStyle: const TextStyle(fontSize: 14, color: darkText),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      validator: CardUtils.validateDate,
      keyboardType: TextInputType.number,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    ).padding(bottom: 20);
  }
}

class CVCTextField extends StatelessWidget {
  final TextEditingController controller;
  const CVCTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        new LengthLimitingTextInputFormatter(3),
      ],
      controller: controller,
      decoration: new InputDecoration(
        isDense: true,
        border: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: darkText,
          ),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: darkText,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: darkText,
          ),
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: darkText,
          ),
        ),
        focusedErrorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        hintText: '123',
        hintStyle: const TextStyle(fontSize: 14, color: darkText),
        labelText: 'CVV',
        contentPadding: allPadding12,
        labelStyle: const TextStyle(fontSize: 14, color: darkText),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      validator: CardUtils.validateCVV,
      keyboardType: TextInputType.number,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    ).padding(bottom: 20);
  }
}

class CardMonthInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue previousValue,
    TextEditingValue nextValue,
  ) {
    var inputText = nextValue.text;

    if (nextValue.selection.baseOffset == 0) {
      return nextValue;
    }

    var bufferString = StringBuffer();
    for (int i = 0; i < inputText.length; i++) {
      bufferString.write(inputText[i]);
      var nonZeroIndexValue = i + 1;

      if (nonZeroIndexValue % 2 == 0 && nonZeroIndexValue != inputText.length) {
        bufferString.write('/');
      }
    }

    var string = bufferString.toString();
    return nextValue.copyWith(
      text: string,
      selection: TextSelection.collapsed(
        offset: string.length,
      ),
    );
  }
}

class CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue previousValue,
    TextEditingValue nextValue,
  ) {
    var inputText = nextValue.text;

    if (nextValue.selection.baseOffset == 0) {
      return nextValue;
    }

    var bufferString = StringBuffer();
    for (int i = 0; i < inputText.length; i++) {
      bufferString.write(inputText[i]);
      var nonZeroIndexValue = i + 1;
      if (nonZeroIndexValue % 4 == 0 && nonZeroIndexValue != inputText.length) {
        bufferString.write(' ');
      }
    }

    var string = bufferString.toString();
    return nextValue.copyWith(
      text: string,
      selection: TextSelection.collapsed(
        offset: string.length,
      ),
    );
  }
}
