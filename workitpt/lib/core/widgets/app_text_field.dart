import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../config/typography.dart';
import '../constants/app_colors.dart';

enum BorderStyle { underline, circular }

class AppTextField extends StatefulWidget {
  final FormFieldValidator<String>? validator;
  final TextInputType textInputType;
  final EdgeInsets contentPadding;
  final String? hintText;
  final String? labelText;
  final TextStyle? labelStyle;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final String? prefixIcon;
  final InputDecoration? decoration;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final bool obscureText;
  final bool isDense;
  final int maxLength;
  final int maxLine;
  final Key? key1;
  final bool digitsOnly;
  final Color? labelColor;
  final String prefixText;
  final String suffixText;
  final InputBorder? inputBorder;
  final bool readOnly;
  final TextInputAction textInputAction;
  final bool enableFocusBorder;
  final ValueChanged<String>? onChanged;
  final TextCapitalization textCapitalization;
  final TextEditingController controller;
  final Color? textColor;
  final BoxConstraints? prefixIconConstraints;
  final VoidCallback? onTap;
  final String? initialValue;
  final Function? onSend;
  final String counterText;
  final double bottomMargin;
  final FocusNode? focusNode;
  final int? minLine;

  const AppTextField({
    super.key,
    this.validator,
    this.bottomMargin = 20,
    this.prefixIcon,
    this.labelStyle,
    this.inputBorder,
    this.textStyle,
    this.hintStyle = const TextStyle(fontSize: 14, color: darkText),
    this.prefixIconConstraints,
    this.obscureText = false,
    this.textCapitalization = TextCapitalization.none,
    this.digitsOnly = false,
    required this.controller,
    this.textInputType = TextInputType.text,
    this.contentPadding = const EdgeInsets.all(12),
    this.prefixWidget,
    this.suffixWidget,
    this.decoration,
    this.hintText = '',
    this.textInputAction = TextInputAction.next,
    this.maxLength = 50,
    this.enableFocusBorder = true,
    this.onChanged,
    this.textColor,
    this.suffixText = '',
    this.prefixText = '',
    this.labelColor,
    this.labelText,
    this.readOnly = false,
    this.maxLine = 1,
    this.key1,
    this.onTap,
    this.initialValue,
    this.isDense = true,
    this.onSend,
    this.counterText = '',
    this.focusNode,
    this.minLine,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late bool isPasswordInVisible;

  @override
  void initState() {
    isPasswordInVisible = widget.obscureText;
    super.initState();
  }

  String? errorMessage = '';

  @override
  Widget build(BuildContext context) => TextFormField(
        key: widget.key1,
        readOnly: widget.readOnly,
        cursorColor: widget.textColor,
        style: widget.textStyle,
        validator: widget.validator == null
            ? null
            : (val) {
                widget.validator?.call(val);
                errorMessage = widget.validator?.call(val);
                return errorMessage;
              },
        obscureText: isPasswordInVisible,
        textCapitalization: widget.textCapitalization,
        textInputAction: widget.textInputAction,
        controller: widget.controller,
        onChanged: widget.onChanged,
        onTapOutside: (val) {
          FocusScope.of(context).unfocus();
        },
        initialValue: widget.initialValue,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        maxLines: widget.maxLine,
        minLines: widget.minLine,
        onTap: widget.onTap,
        onFieldSubmitted: (value) => widget.onSend?.call(value),
        inputFormatters: widget.digitsOnly
            ? <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(widget.maxLength),
              ]
            : <TextInputFormatter>[
                LengthLimitingTextInputFormatter(widget.maxLength),
              ],
        keyboardType: widget.textInputType,
        focusNode: widget.focusNode,
        decoration: widget.decoration ??
            InputDecoration(
              isDense: widget.isDense,
              fillColor: Colors.transparent,
              border: widget.inputBorder ?? const UnderlineInputBorder(),
              enabledBorder: widget.inputBorder ??
                  const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: darkText,
                    ),
                  ),
              counterText: widget.counterText,
              counterStyle: AppTextStyle.bodySMRegular
                  .copyWith(color: darkText, fontSize: 10),
              focusedErrorBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
              suffixText: widget.suffixText,
              suffixIcon: widget.suffixWidget ??
                  (widget.obscureText
                      ? (isPasswordInVisible
                          ? IconButton(
                              onPressed: () {
                                setState(() {
                                  isPasswordInVisible = false;
                                });
                              },
                              icon: const Icon(
                                Icons.visibility_off_outlined,
                                // color: Colors.black,
                              ),
                            )
                          : IconButton(
                              onPressed: () {
                                setState(() {
                                  isPasswordInVisible = true;
                                });
                              },
                              icon: const Icon(Icons.visibility_outlined),
                            ))
                      : const SizedBox()),
              prefixIcon: widget.prefixIcon != null
                  ? Image.asset(
                      widget.prefixIcon!,
                      color: blackText,
                      height: 20,
                      width: 20,
                    ).padding(all: 12)
                  : widget.prefixWidget,
              filled: true,
              prefixText: widget.prefixText,
              prefixStyle: widget.textStyle ??
                  AppTextStyle.bodyMDSemiBold.copyWith(color: Colors.black),
              // fillColor: const Color(0xffF6F6F6),
              focusedBorder: widget.inputBorder ??
                  const UnderlineInputBorder(
                    borderSide: BorderSide(color: darkText),
                  ),
              errorBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              errorStyle: const TextStyle(fontSize: 12),
              labelStyle: widget.labelStyle ??
                  TextStyle(
                    color: widget.labelColor,
                    fontSize: 14,
                  ),
              contentPadding: widget.contentPadding,
              labelText: widget.labelText,
              hintText: widget.hintText,
              hintStyle: widget.hintStyle,
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
      ).padding(bottom: widget.bottomMargin);
}
