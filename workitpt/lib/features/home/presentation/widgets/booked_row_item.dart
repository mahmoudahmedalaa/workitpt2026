import '../../../../config/typography.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/spacing.dart';
import '../../../../core/export.dart';

class BookedRowItem extends StatelessWidget {
  final String text1;
  final String text2;
  final Color text2color;
  const BookedRowItem(
      {super.key,
      required this.text1,
      required this.text2,
      this.text2color = blackText});

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Expanded(
            flex: 2,
            child: Row(
              children: [
                const VerticalDivider(
                  thickness: 3,
                  width: 6,
                  indent: 4,
                  endIndent: 3,
                  color: colorPrimary,
                ),
                horizontalMargin4,
                // if(widget.model.dateFrom!=null )
                Text(
                  text1,
                  // '${widget.model.dateFrom!.getFormattedDateOnly()} (${widget.model.timeFrom} - ${widget.model.timeTo})',
                  style: AppTextStyle.bodySMRegular.copyWith(color: blackText),
                  overflow: TextOverflow.ellipsis,
                ).expanded(),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                const VerticalDivider(
                  thickness: 3,
                  width: 6,
                  indent: 4,
                  endIndent: 3,
                  color: colorPrimary,
                ),
                horizontalMargin4,
                Text(
                  text2,
                  maxLines: 2,
                  style: AppTextStyle.bodySMRegular.copyWith(color: text2color),
                  overflow: TextOverflow.ellipsis,
                ).expanded(),
              ],
            ),
          ),
        ],
      ).height(20);
}
