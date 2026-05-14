import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../config/typography.dart';
import '../../../../core/constants/app_colors.dart';

// ignore: must_be_immutable
class FilterTileWidget extends StatefulWidget {
  final List<String> items;
  List<String> selectedItems;
  FilterTileWidget(
      {super.key, required this.items, required this.selectedItems});

  @override
  State<FilterTileWidget> createState() => _FilterTileWidgetState();
}

class _FilterTileWidgetState extends State<FilterTileWidget> {
  @override
  Widget build(BuildContext context) => Wrap(
        children: List<Widget>.generate(
          widget.items.length,
          (index) {
            final chips = widget.items[index];
            return FilterChoiceChip(
              title: chips,
              selected: widget.selectedItems.contains(chips),
              onSelected: (selected) {
                if (selected) {
                  widget.selectedItems.add(chips);
                } else {
                  widget.selectedItems.remove(chips);
                }
                setState(() {});
              },
            );
          },
        ).toList(),
      );
}

class FilterChoiceChip extends StatelessWidget {
  final String title;
  final bool selected;
  final void Function(bool)? onSelected;

  const FilterChoiceChip(
      {super.key,
      required this.selected,
      this.onSelected,
      required this.title});

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () {
          onSelected?.call(!selected);
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 1.5.w, horizontal: 2.w),
          margin: const EdgeInsets.only(right: 06, bottom: 20),
          decoration: BoxDecoration(
              color: selected ? colorPrimary : lightPrimary,
              borderRadius: BorderRadius.circular(8.w),
              border: Border.all(width: 1, color: colorPrimary)),
          child: Text(
            title,
            style: AppTextStyle.tinySMRegular
                .copyWith(color: selected ? Colors.white : null),
          ),
        ),
      );
}
