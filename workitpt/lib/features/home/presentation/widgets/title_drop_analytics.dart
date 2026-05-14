import 'package:flutter/material.dart';

import '../../../../config/typography.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/spacing.dart';

class TitleDropDownAnalyticsWidget extends StatefulWidget {
  final String title;
  final TextEditingController selectedActivity;
  const TitleDropDownAnalyticsWidget(
      {super.key, required this.title, required this.selectedActivity});

  @override
  State<TitleDropDownAnalyticsWidget> createState() =>
      _TitleDropDownAnalyticsWidgetState();
}

class _TitleDropDownAnalyticsWidgetState
    extends State<TitleDropDownAnalyticsWidget> {
  final occurenceItems = [
    'Weekly',
    'Monthly',
  ];
  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.title,
            style: AppTextStyle.headlineSMSemiBold,
          ),
          Container(
            height: 40,
            padding: allPadding8,
            decoration: BoxDecoration(
                color: filterExpansionBG,
                borderRadius: BorderRadius.circular(5)),
            child: DropdownButton(
              elevation: 0,
              underline: const SizedBox(),
              value: widget.selectedActivity.text,
              style: AppTextStyle.bodySMMedium.copyWith(color: darkText),
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: darkText,
              ),
              items: occurenceItems
                  .map((items) => DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      ))
                  .toList(),
              onChanged: (newValue) {
                setState(() {
                  widget.selectedActivity.text = newValue!;
                });
              },
            ),
          ),
        ],
      );
}
