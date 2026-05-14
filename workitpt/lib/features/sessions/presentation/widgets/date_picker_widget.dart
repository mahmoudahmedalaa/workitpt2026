import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'date_widget.dart';
import 'gestures/tap.dart';

class DatePicker extends StatefulWidget {
  final List<DateTime> availableDates;
  final DatePickerController? controller;
  final DateTime? initialSelectedDate;
  final List<DateTime>? unselectedDates;
  final List<DateTime>? selectedDates;
  final DateChangeListener? onDateChange;
  final int daysCount;
  final String locale;
  final String? todayText;
  final String? tomorrowText;
  const DatePicker(
    this.availableDates, {
    super.key,
    this.controller,
    this.initialSelectedDate,
    this.selectedDates,
    this.unselectedDates,
    this.daysCount = 500,
    this.onDateChange,
    this.todayText,
    this.tomorrowText,
    this.locale = 'en_US',
  }) : assert(
            selectedDates == null || unselectedDates == null,
            "Can't "
            'provide both activated and deactivated dates List at the same time.');

  @override
  State<StatefulWidget> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime? _currentDate;

  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    // Init the calendar locale
    initializeDateFormatting(widget.locale, null);
    // Set initial Values
    _currentDate = widget.initialSelectedDate;

    if (widget.controller != null) {
      widget.controller!.setDatePickerState(this);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Container(
        height: 74,
        child: ListView.builder(
          itemCount: widget.availableDates.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          controller: _controller,
          itemBuilder: (context, index) {
            DateTime date;
            final date0 = widget.availableDates[index];
            date = DateTime(date0.year, date0.month, date0.day);
            final isSelected = widget.selectedDates!.contains(date);
            return DateWidget(
              date: date,
              isSelected: isSelected,
              onDateSelected: (selectedDate) {
                widget.onDateChange!(selectedDate);
                setState(() {});
              },
              todayText: widget.todayText,
              tomorrowText: widget.tomorrowText,
            );
          },
        ),
      );

  /// Helper function to compare two dates
  /// Returns True if both dates are the same
  bool _compareDate(DateTime date1, DateTime date2) =>
      date1.day == date2.day &&
      date1.month == date2.month &&
      date1.year == date2.year;
}

class DatePickerController {
  _DatePickerState? _datePickerState;

  void setDatePickerState(_DatePickerState state) {
    _datePickerState = state;
  }

  void jumpToSelection() {
    assert(_datePickerState != null,
        'DatePickerController is not attached to any DatePicker View.');

    // jump to the current Date
    _datePickerState!._controller
        .jumpTo(_calculateDateOffset(_datePickerState!._currentDate!));
  }

  /// This function will animate the Timeline to the currently selected Date
  void animateToSelection(
      {Duration duration = const Duration(milliseconds: 500),
      Curve curve = Curves.linear}) {
    assert(_datePickerState != null,
        'DatePickerController is not attached to any DatePicker View.');

    // animate to the current date
    _datePickerState!._controller.animateTo(
        _calculateDateOffset(_datePickerState!._currentDate!),
        duration: duration,
        curve: curve);
  }

  /// This function will animate to any date that is passed as an argument
  /// In case a date is out of range nothing will happen
  void animateToDate(DateTime date,
      {Duration duration = const Duration(milliseconds: 500),
      Curve curve = Curves.linear}) {
    assert(_datePickerState != null,
        'DatePickerController is not attached to any DatePicker View.');

    _datePickerState!._controller.animateTo(_calculateDateOffset(date),
        duration: duration, curve: curve);
  }

  /// This function will animate to any date that is passed as an argument
  /// this will also set that date as the current selected date
  void setDateAndAnimate(DateTime date,
      {Duration duration = const Duration(milliseconds: 500),
      Curve curve = Curves.linear}) {
    assert(_datePickerState != null,
        'DatePickerController is not attached to any DatePicker View.');

    _datePickerState!._controller.animateTo(_calculateDateOffset(date),
        duration: duration, curve: curve);

    if (date.compareTo(_datePickerState!.widget.availableDates.first) >= 0 &&
        date.compareTo(_datePickerState!.widget.availableDates.first
                .add(Duration(days: _datePickerState!.widget.daysCount))) <=
            0) {
      // date is in the range
      _datePickerState!._currentDate = date;
    }
  }

  /// Calculate the number of pixels that needs to be scrolled to go to the
  /// date provided in the argument
  double _calculateDateOffset(DateTime date) {
    final startDate = DateTime(
        _datePickerState!.widget.availableDates.first.year,
        _datePickerState!.widget.availableDates.first.month,
        _datePickerState!.widget.availableDates.first.day);

    final offset = date.difference(startDate).inDays;
    return (offset * 6) + (offset * 6);
  }
}
