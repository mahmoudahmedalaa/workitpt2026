import 'package:intl/intl.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/spacing.dart';
import '../../../../../core/export.dart';
import '../../../../../core/utils/date_util.dart';
import '../../../../../core/widgets/app_text_field.dart'; //this is an external package for formatting date and time

class CustomDatePicker extends StatefulWidget {
  final String title;
  final TextEditingController controller;
  const CustomDatePicker(
      {super.key, required this.title, required this.controller});

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  TextEditingController dobController = TextEditingController();
  DateTime? pickedDateTime;

  //Method for showing the date picker
  void _pickDateDialog() {
    showDatePicker(
      context: context,
      confirmText: 'Save',
      builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(
            primary: colorPrimary, // <-- SEE HERE
            onPrimary: Colors.white, // <-- SEE HERE
            onSurface: blackText, // <-- SEE
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              primary: Colors.white, // button text color
              shape: const StadiumBorder(),
              padding: horizontalPadding32,
              backgroundColor: colorPrimary,
            ),
          ),
        ),
        child: child!,
      ),
      cancelText: 'Cancel',
      helpText: widget.title,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2100),
    ).then((pickedDate) {
      //then usually do the future job
      if (pickedDate == null) {
        //if user tap cancel then this function will stop
        return;
      }

      setState(() {
        widget.controller.text = pickedDate.toString();
        dobController.text = DateFormat.yMMMd().format(pickedDate);
        pickedDateTime = pickedDate;
      });
    });
  }

  DateTime getDate() => DateTime.parse(widget.controller.text);

  @override
  void initState() {
    if (widget.controller.text.isNotEmpty) {
      dobController.text =
          DateFormat.yMMMd().format(DateTime.parse(widget.controller.text));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: _pickDateDialog,
        child: IgnorePointer(
          child: AppTextField(
            controller: dobController,
            prefixIcon: Assets.icons.calendar.path,
            readOnly: true,
            hintText: 'DD/MM/YY',
            validator: (value) {
              if (value != null && value.isEmpty) {
                return 'DateTime must not be empty';
              } else if (!(pickedDateTime ?? getDate()).isAtLeastYearsOld(13)) {
                return 'Age restricted';
              } else {
                return null;
              }
            },
            labelText: widget.title,
          ),
        ),
      );
}
