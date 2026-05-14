import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../../config/typography.dart';
import 'date_picker_widget.dart';

class TimeSlotSelectionWidget extends StatefulWidget {
  final List<DateTime> selectedDates;
  final List<DateTime> availableDates;

  TimeSlotSelectionWidget(
      {super.key, required this.selectedDates, required this.availableDates});

  @override
  State<TimeSlotSelectionWidget> createState() =>
      _TimeSlotSelectionWidgetState();
}

class _TimeSlotSelectionWidgetState extends State<TimeSlotSelectionWidget> {
  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Preferable Date',
            style: AppTextStyle.bodyLgSemiBold,
          ).padding(top: 12, bottom: 12),
          DatePicker(
            widget.availableDates,
            daysCount: 20,
            selectedDates: widget.selectedDates,
            onDateChange: (date) {
              setState(() {
                if (widget.selectedDates.contains(date)) {
                  widget.selectedDates.remove(date);
                } else {
                  widget.selectedDates.add(date);
                }
              });
            },
          ).padding(bottom: 24)
        ],
      );
}
