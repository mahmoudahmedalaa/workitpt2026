import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../config/typography.dart';
import '../../../../core/constants/app_colors.dart';
import 'gestures/tap.dart';

class DateWidget extends StatelessWidget {
  final DateTime date;
  final DateSelectionCallback? onDateSelected;
  final String? locale;
  final bool isSelected;
  final String? todayText;
  final String? tomorrowText;

  const DateWidget(
      {super.key,
      required this.date,
      this.onDateSelected,
      required this.isSelected,
      this.locale,
      this.todayText,
      this.tomorrowText});

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size.shortestSide;
    // final double fontsize;
    // if (size > 375)
    //   fontsize = 18;
    // else
    //   fontsize = 13;
    final String day;
    // if (calculateDifference(date) == 0)
    //   day = todayText ?? "Today";
    // else if (calculateDifference(date) == 1)
    //   day = tomorrowText ?? "Tomorrow";
    // else
    day = DateFormat('EEE', locale).format(date);

    return InkWell(
      child: Container(
        width: 74,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          border: !isSelected ? Border.all(width: 1, color: shadowColor) : null,
          color: isSelected ? colorPrimary : Theme.of(context).cardColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(day,
                  style: AppTextStyle.bodyMDSemiBold
                      .copyWith(color: isSelected ? Colors.white : blackText)),
              const SizedBox(
                height: 4,
              ),
              Text(
                  "${DateFormat("MMM", locale).format(date)} "
                  '${date.day}', // Month
                  style: AppTextStyle.bodyMDRegular
                      .copyWith(color: isSelected ? Colors.white : blackText)),
            ],
          ),
        ),
      ),
      onTap: () {
        // Check if onDateSelected is not null
        if (onDateSelected != null) {
          onDateSelected!(date);
        }
      },
    );
  }
}

int calculateDifference(DateTime date) {
  var now = DateTime.now();
  return DateTime(date.year, date.month, date.day)
      .difference(DateTime(now.year, now.month, now.day))
      .inDays;
}
