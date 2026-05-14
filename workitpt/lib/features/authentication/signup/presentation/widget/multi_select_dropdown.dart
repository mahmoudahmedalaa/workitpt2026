import 'package:multi_select_flutter/multi_select_flutter.dart';

import '../../../../../config/typography.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/export.dart';

class MultiSelectDropDown extends StatefulWidget {
  final List<String> items;
  final List<String> selectedItems;
  final String title;
  final void Function(List<String>) onConfirm;
  final dynamic Function(String)? onRemove;
  const MultiSelectDropDown({
    super.key,
    required this.items,
    required this.title,
    required this.selectedItems,
    required this.onConfirm,
    required this.onRemove,
  });

  @override
  State<MultiSelectDropDown> createState() => _MultiSelectDropDownState();
}

class _MultiSelectDropDownState extends State<MultiSelectDropDown> {
  @override
  Widget build(BuildContext context) => MultiSelectDialogField<String>(
        confirmText: const Text(
          'Ok',
          style: TextStyle(color: darkText),
        ),
        cancelText: const Text(
          'Cancel',
          style: TextStyle(color: darkText),
        ),
        selectedColor: colorPrimary,
        selectedItemsTextStyle: const TextStyle(color: Colors.white),
        buttonIcon: const Icon(Icons.keyboard_arrow_down_rounded),
        buttonText: Text(
          widget.title,
          style: AppTextStyle.bodyMDRegular.copyWith(color: darkText),
        ),
        checkColor: colorPrimary,
        title: Text(widget.title),
        items: widget.items.map((e) => MultiSelectItem(e, e)).toList(),
        listType: MultiSelectListType.CHIP,
        chipDisplay: MultiSelectChipDisplay(
          icon: const Icon(
            Icons.cancel_outlined,
            color: colorPrimary,
          ),
          chipColor: const Color(0xfff8f6ff),
          textStyle: const TextStyle(color: colorPrimary),
          // onTap: (item) {
          //   setState(() {
          //     selectedItems.remove(item);
          //   });
          // },
          onTap: widget.onRemove,
        ),
        initialValue: widget.selectedItems,
        decoration: const BoxDecoration(
          border: BorderDirectional(
            bottom: BorderSide(
              color: darkText,
            ),
          ),
        ),
        // onConfirm: (values) {
        //   setState(() {
        //     selectedItems = values;
        //     //  final sel = values.toString().replaceAll('[', '');
        //     // widget.selectedSpecialization!.text = sel.replaceAll(']', '');
        //   });
        // },
        onConfirm: widget.onConfirm,
      ).padding(bottom: 24);
}
