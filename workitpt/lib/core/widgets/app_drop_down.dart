import '../constants/app_colors.dart';
import '../export.dart';

class AppDropDown extends StatefulWidget {
  final List<String> items;
  final void Function(String?)? onChanged;
  final FormFieldValidator<String>? validator;
  final double borderRadius;
  final TextEditingController controller;
  final Color borderColor;
  final Color iconColor;
  final Color? fillColor;
  final Color mainColor;
  final bool showBorder;
  final bool isExpanded;
  final String hintText;
  final String? labelText;
  final TextStyle? hintStyle;
  final TextStyle? selectedTextStyle;
  final double? iconSize;
  final double height;
  final EdgeInsets contentPadding;
  final String? value;
  final bool isDisabled;
  final Color selectedTextColor;
  final String? prefixIcon;
  final Widget? prefixWidget;
  final Color? labelColor;
  final double? menuMaxHeight;

  const AppDropDown({
    super.key,
    required this.items,
    this.onChanged,
    required this.controller,
    this.borderRadius = 0,
    this.borderColor = shadowColor,
    this.iconColor = shadowColor,
    this.showBorder = true,
    this.isExpanded = false,
    this.hintText = '',
    this.hintStyle,
    this.fillColor,
    this.iconSize,
    this.height = 70,
    this.contentPadding = const EdgeInsets.all(12),
    this.mainColor = Colors.black,
    this.validator,
    this.value,
    this.isDisabled = false,
    this.selectedTextColor = Colors.black,
    this.selectedTextStyle,
    this.prefixIcon,
    this.prefixWidget,
    this.labelText,
    this.labelColor,
    this.menuMaxHeight,
  });

  @override
  State<AppDropDown> createState() => _AppDropDownState();
}

class _AppDropDownState extends State<AppDropDown> {
  String? errorMsg;
  @override
  Widget build(BuildContext context) {
    final errorBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.red),
      borderRadius: BorderRadius.circular(widget.borderRadius),
    );

    final focusBorder = UnderlineInputBorder(
        borderSide: const BorderSide(color: darkText),
        borderRadius: BorderRadius.circular(widget.borderRadius));

    final enabledBorder = UnderlineInputBorder(
        borderSide: const BorderSide(color: darkText),
        borderRadius: BorderRadius.circular(widget.borderRadius));

    final disabledBorder = UnderlineInputBorder(
        borderSide: BorderSide(color: widget.borderColor),
        borderRadius: BorderRadius.circular(widget.borderRadius));
    return DropdownButtonFormField(
      onChanged: widget.isDisabled
          ? null
          : widget.onChanged ??
              (value) {
                setState(() {
                  widget.controller.text = value.toString();
                });
              },
      items: widget.items
          .map((value) => DropdownMenuItem<String>(
                value: value,
                child: Text(value, style: const TextStyle(color: Colors.black)),
              ))
          .toList(),
      iconEnabledColor: widget.iconColor,
      iconSize: widget.iconSize ?? 24,
      icon: const Icon(
        Icons.keyboard_arrow_down_rounded,
        color: blackText,
      ),
      menuMaxHeight: widget.menuMaxHeight,
      isExpanded: widget.isExpanded,
      selectedItemBuilder: (context) => widget.items
          .map<Widget>((item) => DropdownMenuItem(
              child: Text(
                item,
                style: widget.selectedTextStyle ??
                    TextStyle(color: widget.selectedTextColor),
              ),
              value: ''))
          .toList(),
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon != null
            ? Image.asset(
                widget.prefixIcon!,
                color: blackText,
                height: 20,
                width: 20,
              ).padding(all: 12)
            : widget.prefixWidget,
        errorBorder: widget.showBorder ? errorBorder : InputBorder.none,
        focusedErrorBorder: widget.showBorder ? errorBorder : InputBorder.none,
        enabledBorder: widget.showBorder ? enabledBorder : InputBorder.none,
        focusedBorder: widget.showBorder ? focusBorder : InputBorder.none,
        disabledBorder: widget.showBorder ? disabledBorder : InputBorder.none,
        fillColor: widget.fillColor,
        filled: widget.fillColor != null,
        contentPadding: widget.contentPadding,
        isDense: true,
        hintText: widget.hintText,
        hintStyle:
            widget.hintStyle ?? const TextStyle(fontSize: 14, color: darkText),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: widget.labelText,
        labelStyle: TextStyle(
          color: widget.labelColor,
          fontSize: 14,
        ),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      // value: widget.controller.text.isNotEmpty ? widget.controller.text : '',
      value: widget.controller.text.isNotEmpty ? widget.controller.text : null,
      validator: widget.validator,
    ).padding(bottom: 20);
  }
}
