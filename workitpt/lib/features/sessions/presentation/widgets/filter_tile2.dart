import 'package:flutter/material.dart';

import 'filter_tile.dart';

// ignore: must_be_immutable
class FilterTile2Widget extends StatefulWidget {
  final List<String> items;
  TextEditingController selectedChip;
  FilterTile2Widget(
      {super.key, required this.items, required this.selectedChip});

  @override
  State<FilterTile2Widget> createState() => _FilterTile2WidgetState();
}

class _FilterTile2WidgetState extends State<FilterTile2Widget> {
  @override
  Widget build(BuildContext context) => Wrap(
        children: List<Widget>.generate(
          widget.items.length,
          (index) {
            final chips = widget.items[index];
            return FilterChoiceChip(
              title: chips,
              selected: widget.selectedChip.text == chips,
              onSelected: (selected) {
                if (selected) {
                  widget.selectedChip.text = chips;
                } else {
                  widget.selectedChip.text = '';
                }
                setState(() {});
              },
            );
          },
        ).toList(),
      );
}
