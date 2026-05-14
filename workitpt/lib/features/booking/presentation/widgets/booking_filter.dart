import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/spacing.dart';
import '../../../../core/widgets/app_button.dart';

class BookingFilter extends StatefulWidget {
  const BookingFilter({super.key});

  @override
  State<BookingFilter> createState() => _BookingFilterState();
}

class _BookingFilterState extends State<BookingFilter> {
  bool showCategoryFilter = true;
  bool showBrandFilter = true;
  List<String> items = [
    'All Bookings',
    'Todays',
    'This Week',
    'This month',
  ];

  @override
  Widget build(BuildContext context) => Container(
        constraints:
            BoxConstraints(maxHeight: MediaQuery.of(context).size.height * .9),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Column(
          children: [
            verticalMargin24,
            Container(
              decoration: BoxDecoration(
                color: colorPrimary,
                borderRadius: BorderRadius.circular(20),
              ),
              width: 100,
              height: 4,
            ),
            // verticalMargin24,
            ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) => Text(items[index]),
              itemCount: items.length,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: AppButton(
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    buttonText: 'Cancel',
                    textColor: blackText,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Flexible(
                  child: AppButton(
                    buttonText: 'Filter',
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    suffixWidget: const SizedBox(),
                  ),
                ),
              ],
            )
          ],
        ),
      );
}
