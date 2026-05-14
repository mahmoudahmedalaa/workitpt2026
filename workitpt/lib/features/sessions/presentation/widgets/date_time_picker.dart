import 'package:intl/intl.dart';

import '../../../../config/typography.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/spacing.dart';
import '../../../../core/export.dart';
import '../../data/models/date_model.dart';

class DateTimePicker extends StatefulWidget {
  final DateTime singleDate;
  final TimeOfDay firstTime;
  final TimeOfDay lastTime;
  const DateTimePicker(
      {super.key,
      required this.singleDate,
      required this.firstTime,
      required this.lastTime});

  @override
  State<DateTimePicker> createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker> {
  DateTime? singleDate;
  TimeOfDay? firstTime;
  TimeOfDay? lastTime;

  void setValues() {
    firstTime = widget.firstTime;
    lastTime = widget.lastTime;
    singleDate = widget.singleDate;
  }

  String dateValidationText = '';
  String timeValidationText = '';

  final now = DateTime.now();

  bool checkDateValidation() {
    final isDateValid = singleDate!.isAfter(now);
    final isValidTime = firstTime!.hour.compareTo(lastTime!.hour) <= 0;
    if (!isDateValid) {
      setState(() {
        dateValidationText = 'Date must not be in the past.';
      });
    }
    if (!isValidTime) {
      setState(() {
        timeValidationText = 'Invalid time range';
      });
    }
    return isDateValid && isValidTime;
  }

  @override
  void initState() {
    setValues();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Schedule a Session',
              style: AppTextStyle.bodySMSemiBold,
            ),
            verticalMargin20,
            Row(
              children: [
                Text(
                  'Choose Date',
                  style: AppTextStyle.bodySMMedium,
                ),
                horizontalMargin8,
                InkWell(
                  onTap: () async {
                    final tempSingleDate = await _pickDateDialog(singleDate!);
                    if (tempSingleDate != null) {
                      setState(() {
                        singleDate = tempSingleDate;
                      });
                    }
                  },
                  child: Container(
                    padding: allPadding8,
                    decoration: BoxDecoration(
                        color: buttonBG,
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      DateFormat.yMMMd().format(singleDate!),
                      style: AppTextStyle.bodySMMedium,
                    ),
                  ),
                )
              ],
            ),
            Visibility(
              visible: dateValidationText != '',
              child: Text(
                dateValidationText,
                style: AppTextStyle.tinySMSemiBold.copyWith(color: Colors.red),
              ).padding(top: 4),
            ),
            verticalMargin20,
            Row(
              children: [
                Text(
                  'Time',
                  style: AppTextStyle.bodySMMedium,
                ),
                horizontalMargin8,
                InkWell(
                  onTap: () async {
                    final tempFirstTime = await _pickTimeDialog(firstTime!);
                    if (tempFirstTime != null) {
                      setState(() {
                        firstTime = tempFirstTime;
                      });
                    }
                  },
                  child: Container(
                    padding: allPadding8,
                    decoration: BoxDecoration(
                        color: buttonBG,
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      firstTime!.format(context),
                      style: AppTextStyle.bodySMMedium,
                    ),
                  ),
                ),
                horizontalMargin8,
                Text(
                  'to',
                  style: AppTextStyle.bodySMMedium,
                ),
                horizontalMargin8,
                InkWell(
                  onTap: () async {
                    final tempLastTime = await _pickTimeDialog(lastTime!);
                    if (tempLastTime != null) {
                      setState(() {
                        lastTime = tempLastTime;
                      });
                    }
                  },
                  child: Container(
                    padding: allPadding8,
                    decoration: BoxDecoration(
                        color: buttonBG,
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      lastTime!.format(context),
                      style: AppTextStyle.bodySMMedium,
                    ),
                  ),
                ),
              ],
            ),
            Visibility(
              visible: timeValidationText != '',
              child: Text(
                timeValidationText,
                style: AppTextStyle.tinySMSemiBold.copyWith(color: Colors.red),
              ).padding(top: 4),
            ),
            verticalMargin24,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: allPadding8,
                    child: Text(
                      'Cancel',
                      style:
                          AppTextStyle.bodySMMedium.copyWith(color: darkText),
                    ),
                  ),
                ),
                horizontalMargin8,
                InkWell(
                  onTap: () {
                    if (checkDateValidation()) {
                      Navigator.of(context).pop(DateModel(
                          firstDate: singleDate,
                          firstTime: firstTime,
                          lastTime: lastTime));
                    }
                  },
                  child: Container(
                    padding: allPadding8,
                    child: Text(
                      'Done',
                      style: AppTextStyle.bodySMMedium
                          .copyWith(color: colorPrimary),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );

  Future<DateTime?> _pickDateDialog(DateTime initialDate) async {
    final result = await showDatePicker(
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
              foregroundColor: Colors.white,
              shape: const StadiumBorder(),
              padding: horizontalPadding32,
              backgroundColor: colorPrimary,
            ),
          ),
        ),
        child: child!,
      ),
      cancelText: 'Cancel',
      helpText: 'Select Date',
      initialDate: initialDate,
      firstDate: DateTime(1950),
      lastDate: DateTime(2100),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return null;
      }
      return pickedDate;
    });
    return result;
  }

  Future<TimeOfDay?> _pickTimeDialog(TimeOfDay initialTime) async {
    final result = await showTimePicker(
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
              foregroundColor: Colors.white,
              shape: const StadiumBorder(),
              padding: horizontalPadding32,
              backgroundColor: colorPrimary,
            ),
          ),
        ),
        child: MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: child!,
        ),
      ),
      cancelText: 'Cancel',
      helpText: 'Select Time',
      initialTime: initialTime,
    ).then((pickedTime) {
      if (pickedTime == null) {
        return null;
      }
      return pickedTime;
    });
    return result;
  }
}
