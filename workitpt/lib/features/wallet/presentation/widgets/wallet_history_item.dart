import 'package:intl/intl.dart';
import 'package:workitpt/config/typography.dart';
import 'package:workitpt/core/export.dart';
import 'package:workitpt/core/utils/date_util.dart';
import 'package:workitpt/features/wallet/data/models/wallet_history_model.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/spacing.dart';

class WalletHistoryItem extends StatefulWidget {
  final WalletHistoryModel model;
  const WalletHistoryItem({super.key, required this.model});

  @override
  State<WalletHistoryItem> createState() => _WalletHistoryItemState();
}

class _WalletHistoryItemState extends State<WalletHistoryItem> {
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
              style: AppTextStyle.bodyLgSemiBold.copyWith(color: Colors.green),
            ),
            title: Text(
              'Amount Received',
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
                          Text('Session Name:',
                                  style: AppTextStyle.bodyMDMedium)
                              .flexible(),
                          Text(
                            model.booking?.session?.sessionTitle ?? '',
                            style: AppTextStyle.bodyMDBold
                                .copyWith(color: colorPrimary),
                          ).flexible(),
                        ],
                      ),
                      verticalMargin4,
                      Row(
                        children: [
                          VerticalDivider(
                            thickness: 3,
                            width: 6,
                            indent: 3,
                            endIndent: 3,
                            color: colorPrimary,
                          ),
                          horizontalMargin4,
                          Text(
                            '${widget.model.booking!.session!.dateFrom!.getFormattedDateOnly()} (${widget.model.booking!.session!.timeFrom} ${widget.model.booking!.session!.timeTo})',
                            style: AppTextStyle.bodySMRegular
                                .copyWith(color: blackText),
                          ),
                        ],
                      ).height(20),
                      verticalMargin16,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Booking ID:',
                            style: AppTextStyle.bodyMDMedium,
                          ),
                          Text(
                            model.booking?.id ?? '',
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
                              color: Colors.green.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Text(
                              'Received',
                              style: AppTextStyle.bodyMDMedium.copyWith(
                                color: Colors.green,
                              ),
                            ),
                          ),
                        ],
                      ),
                      // verticalMargin8,
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Text('Remarks', style: AppTextStyle.bodyMDMedium)
                      //         .flexible(),
                      //     Text(
                      //       'REmarks',
                      //       style: AppTextStyle.bodyMDMedium,
                      //     ).flexible(),
                      //   ],
                      // ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
