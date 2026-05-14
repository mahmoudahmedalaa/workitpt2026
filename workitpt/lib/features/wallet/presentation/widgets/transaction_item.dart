import 'package:intl/intl.dart';
import 'package:workitpt/config/typography.dart';
import 'package:workitpt/core/export.dart';
import 'package:workitpt/features/wallet/data/models/transaction_model.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/spacing.dart';

class TransactionItemWidget extends StatefulWidget {
  final TransactionModel model;
  const TransactionItemWidget({super.key, required this.model});

  @override
  State<TransactionItemWidget> createState() => _TransactionItemWidgetState();
}

class _TransactionItemWidgetState extends State<TransactionItemWidget> {
  String formatDateTime(DateTime dateTime) {
    return DateFormat('h:mm a').format(dateTime.toLocal());
  }

  String formatDate(DateTime dateTime) {
    return DateFormat('d MMM').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    final model = widget.model;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: ExpansionTile(
            backgroundColor: filterExpansionBG,
            collapsedBackgroundColor: filterExpansionBG,
            iconColor: Colors.transparent,
            collapsedIconColor: Colors.transparent,
            subtitle: Text(
              formatDateTime(model.createdAt!),
              style: AppTextStyle.tinySMRegular,
            ),
            trailing: Text(
              '\$${model.amount}',
              style: AppTextStyle.bodyLgSemiBold.copyWith(
                  color: model.approved!.contains('Rejected')
                      ? Colors.red
                      : model.approved!.contains('Paid')
                          ? Colors.green
                          : Color(0xffecbd02)),
            ),
            title: Text(
              'Amount ${model.approved}',
              style: AppTextStyle.bodySMMedium,
            ),
            children: <Widget>[
              Divider(
                height: 1,
                color: colorBorder,
              ),
              Container(
                  padding: allPadding16,
                  decoration: BoxDecoration(
                      color: Color(0xFFF6F6F6),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Transaction ID:',
                            style: AppTextStyle.bodyMDMedium,
                          ),
                          Text(
                            model.transactionId ?? model.trainer!.id!,
                            style: AppTextStyle.bodyMDMedium
                                .copyWith(color: Colors.black),
                          ),
                        ],
                      ),
                      verticalMargin8,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Date and Time',
                              style: AppTextStyle.bodyMDMedium),
                          Text(
                            '${formatDate(model.createdAt!)} (${formatDateTime(model.createdAt!)})',
                            style: AppTextStyle.bodyMDMedium.copyWith(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      verticalMargin8,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Status', style: AppTextStyle.bodyMDMedium),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 2),
                            decoration: BoxDecoration(
                              color: model.approved!.contains('Rejected')
                                  ? Colors.red.withOpacity(0.2)
                                  : model.approved!.contains('Pending')
                                      ? Colors.yellow.withOpacity(0.3)
                                      : Colors.green.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Text(
                              model.approved ?? '',
                              style: AppTextStyle.bodyMDMedium.copyWith(
                                color: model.approved!.contains('Rejected')
                                    ? Colors.red
                                    : model.approved!.contains('Pending')
                                        ? Color(0xffecbd02)
                                        : Colors.green,
                              ),
                            ),
                          ),
                        ],
                      ),
                      verticalMargin8,
                      if (model.remarks != null && model.remarks!.isNotEmpty)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Remarks', style: AppTextStyle.bodyMDMedium)
                                .flexible(),
                            Text(
                              model.remarks ?? '',
                              style: AppTextStyle.bodyMDMedium,
                            ).flexible(),
                          ],
                        ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
