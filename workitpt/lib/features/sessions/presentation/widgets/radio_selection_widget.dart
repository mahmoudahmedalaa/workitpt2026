import '../../../../config/typography.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/export.dart';

// ignore: must_be_immutable
class RadioSelectionWidget extends StatefulWidget {
  String groupValue;
  final List<String> items;
  final String title;
  final void Function(String?) onChanged;

  RadioSelectionWidget({
    super.key,
    required this.title,
    required this.items,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  State<RadioSelectionWidget> createState() => _RadioSelectionWidgetState();
}

class _RadioSelectionWidgetState extends State<RadioSelectionWidget> {
  Widget radioTile(String value) => Expanded(
        flex: 1,
        child: ListTile(
          horizontalTitleGap: 0,
          contentPadding: EdgeInsets.zero,
          minLeadingWidth: 10,
          title: Text(
            value,
            maxLines: 1,
            style: AppTextStyle.bodySMRegular,
            overflow: TextOverflow.ellipsis,
          ),
          leading: Radio(
            value: value,
            visualDensity:
                VisualDensity(horizontal: VisualDensity.minimumDensity),
            activeColor: colorPrimary,
            groupValue: widget.groupValue,
            onChanged: widget.onChanged,
          ),
        ),
      );
  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: AppTextStyle.tinySMRegular,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ...widget.items.map(radioTile).toList(),
            ],
          ),
        ],
      );
}
