import 'package:intl/intl.dart';

import '../../../../config/typography.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/spacing.dart';
import '../../../../core/export.dart';
import '../../data/models/date_model.dart';

class RecurringDateTimePicker extends StatefulWidget {
  final DateTime startdate;
  final DateTime enddate;
  final TimeOfDay firstTime;
  final TimeOfDay lastTime;
  final String occuranceValue;
  final List<String> selectedDays;
  const RecurringDateTimePicker(
      {super.key,
      required this.startdate,
      required this.enddate,
      required this.firstTime,
      required this.lastTime,
      required this.occuranceValue,
      required this.selectedDays});

  @override
  State<RecurringDateTimePicker> createState() =>
      _RecurringDateTimePickerState();
}

class _RecurringDateTimePickerState extends State<RecurringDateTimePicker> {
  DateTime? startDate;
  DateTime? endDate;
  TimeOfDay? firstTime;
  TimeOfDay? lastTime;
  String? occuranceValue;

  // List of items in our dropdown menu
  final occurenceItems = [
    'Daily',
    'Weekly',
  ];

  void setValues() {
    startDate = widget.startdate;
    endDate = widget.enddate;
    firstTime = widget.firstTime;
    lastTime = widget.lastTime;
    occuranceValue = widget.occuranceValue;
    selectedDays = widget.selectedDays;
  }

  String dateValidationText = '';
  String timeValidationText = '';

  bool checkDateValidation() {
    final isStartDateValid = startDate!.isAfter(DateTime.now());
    final isEndDateValid = endDate!.isAfter(startDate!);
    final isDateRangeValid = endDate!.difference(startDate!).inDays <= 30;
    setDateValidationMessage(
      isStartDateValid: isStartDateValid,
      isEndDateValid: isEndDateValid,
      isDateRangeValid: isDateRangeValid,
    );
    return isStartDateValid && isEndDateValid && isDateRangeValid;
  }

  void setDateValidationMessage(
      {required bool isStartDateValid,
      required bool isEndDateValid,
      required bool isDateRangeValid}) {
    if (!isStartDateValid) {
      setState(() {
        dateValidationText = 'Start date must not be in the past.';
      });
    } else {
      if (!isEndDateValid) {
        setState(() {
          dateValidationText = 'Invalid date range';
        });
      } else {
        if (!isDateRangeValid) {
          setState(() {
            dateValidationText = 'Date range cannot exceed 30 days.';
          });
        }
      }
    }
  }

  bool checkTimeValidation() {
    final isTimeValid = firstTime!.hour.compareTo(lastTime!.hour) <= 0;
    if (!isTimeValid) {
      setState(() {
        timeValidationText = 'Invalid time range';
      });
    }
    print(isTimeValid);
    return isTimeValid;
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
                  'Occurrence Every',
                  style: AppTextStyle.bodySMMedium,
                ),
                horizontalMargin8,
                Container(
                  height: 40,
                  padding: allPadding8,
                  decoration: BoxDecoration(
                      color: buttonBG, borderRadius: BorderRadius.circular(5)),
                  child: DropdownButton(
                    elevation: 0,
                    underline: const SizedBox(),
                    value: occuranceValue,
                    style: AppTextStyle.bodySMMedium,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: occurenceItems
                        .map((items) => DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            ))
                        .toList(),
                    onChanged: (newValue) {
                      setState(() {
                        occuranceValue = newValue;
                      });
                    },
                  ),
                ),
              ],
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
                    final tempStartDate = await _pickDateDialog(startDate!);
                    if (tempStartDate != null) {
                      setState(() {
                        startDate = tempStartDate;
                      });
                    }
                  },
                  child: Container(
                    padding: allPadding8,
                    decoration: BoxDecoration(
                        color: buttonBG,
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      DateFormat.yMMMd().format(startDate!),
                      style: AppTextStyle.bodySMMedium,
                    ),
                  ),
                ),
                horizontalMargin8,
                Text(
                  'until',
                  style: AppTextStyle.bodySMMedium,
                ),
                horizontalMargin8,
                InkWell(
                  onTap: () async {
                    final tempEndDate = await _pickDateDialog(endDate!);
                    if (tempEndDate != null) {
                      setState(() {
                        endDate = tempEndDate;
                      });
                    }
                  },
                  child: Container(
                    padding: allPadding8,
                    decoration: BoxDecoration(
                        color: buttonBG,
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      DateFormat.yMMMd().format(endDate!),
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
            Text(
              'Repeats on',
              style: AppTextStyle.bodySMMedium,
            ),
            verticalMargin12,
            daySelection(),
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
                    if (checkDateValidation() && checkTimeValidation()) {
                      Navigator.of(context).pop(
                        DateModel(
                          firstDate: startDate,
                          lastDate: endDate,
                          firstTime: firstTime,
                          lastTime: lastTime,
                          occuranceValue: occuranceValue,
                          selectedDays: selectedDays,
                        ),
                      );
                    } else {
                      print('Invalid DateTime');
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

  List<String> dayList = [
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday'
  ];
  List<String> selectedDays = [];

  Widget daySelection() => Wrap(
        children: List<Widget>.generate(
          dayList.length,
          (index) {
            final chips = dayList[index];
            return daySelectionDesign(
              title: chips.substring(0, 1),
              selected: selectedDays.contains(chips),
              onSelected: (selected) {
                if (selected) {
                  selectedDays.add(chips);
                } else {
                  selectedDays.remove(chips);
                }
                setState(() {});
              },
            );
          },
        ).toList(),
      );

  Widget daySelectionDesign(
          {required String title,
          required bool selected,
          void Function(bool)? onSelected}) =>
      InkWell(
        onTap: () {
          onSelected?.call(!selected);
        },
        child: Container(
          height: 32,
          width: 32,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          margin: const EdgeInsets.only(right: 8),
          decoration: BoxDecoration(
            color: selected ? colorPrimary : buttonBG,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Text(
            title,
            style: AppTextStyle.bodySMSemiBold
                .copyWith(color: selected ? Colors.white : null),
          ),
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

  Future<dynamic> timeValidateDialog() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            contentPadding: allPadding16,
            content: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Image.asset(
                  Assets.icons.calendar.path,
                  color: colorPrimary,
                  height: 52,
                  width: 52,
                ),
                verticalMargin16,
                Text(
                  'Oops! This date or time is already booked for another session. Please select a different date or time to avoid conflicts.',
                  style: AppTextStyle.bodySMSemiBold,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ));

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
