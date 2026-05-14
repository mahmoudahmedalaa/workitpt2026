import '../../../../config/typography.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/export.dart';

// ignore: must_be_immutable
class FlexibleLocationCounter extends StatefulWidget {
  final int locationRange;
  final VoidCallback onAddTap;
  final VoidCallback onSubtractTap;
  FlexibleLocationCounter({
    super.key,
    required this.locationRange,
    required this.onAddTap,
    required this.onSubtractTap,
  });

  @override
  State<FlexibleLocationCounter> createState() =>
      _FlexibleLocationCounterState();
}

class _FlexibleLocationCounterState extends State<FlexibleLocationCounter> {
  @override
  Widget build(BuildContext context) => Row(
        children: <Widget>[
          const Icon(
            Icons.remove,
            color: Colors.white,
            size: 20,
          )
              .decorated(
                  color: colorPrimary, borderRadius: BorderRadius.circular(8))
              .height(24)
              .width(24)
              .gestures(onTap: widget.onSubtractTap),
          Text(
            '${widget.locationRange}',
            style: AppTextStyle.bodyLgRegular,
          ).center().width(80).height(30),
          const Icon(
            Icons.add,
            color: ColorName.white,
            size: 20,
          )
              .decorated(
                  color: colorPrimary, borderRadius: BorderRadius.circular(8))
              .height(24)
              .width(24)
              .gestures(onTap: widget.onAddTap),
        ],
      ).padding(horizontal: 8, vertical: 6).decorated(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(width: 1, color: colorPrimary),
          );
}
