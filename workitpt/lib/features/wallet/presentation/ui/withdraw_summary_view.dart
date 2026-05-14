import 'package:workitpt/core/constants/app_colors.dart';
import 'package:workitpt/core/export.dart';
import 'package:workitpt/core/utils/date_util.dart';
import 'package:workitpt/core/widgets/app_button.dart';
import 'package:workitpt/core/widgets/base_view.dart';
import 'package:workitpt/features/wallet/data/models/withdraw_model.dart';
import 'package:workitpt/features/wallet/presentation/bloc/wallet_bloc.dart';

import '../../../../config/typography.dart';
import '../../../../core/constants/spacing.dart';

@RoutePage()
class WithdrawSummaryView extends StatefulWidget {
  final BankDetails bankDetails;
  final WalletBloc walletBloc;
  final double withdrawAmount;
  const WithdrawSummaryView(
      {super.key,
      required this.bankDetails,
      required this.withdrawAmount,
      required this.walletBloc});

  @override
  State<WithdrawSummaryView> createState() => _WithdrawSummaryViewState();
}

class _WithdrawSummaryViewState extends State<WithdrawSummaryView> {
  Widget infoTile1(String text1, String text2) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text1,
              style: AppTextStyle.bodyLgSemiBold.copyWith(color: darkText)),
          Text(text2, style: AppTextStyle.bodyMDRegular),
        ],
      ).padding(bottom: 12);

  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return BaseView(
      titleText: 'Withdraw Summary',
      appBarColor: Colors.white,
      elevation: 0.0,
      padding: EdgeInsets.zero,
      color: Colors.white,
      body: Column(
        children: <Widget>[
          verticalMargin16,
          Column(
            children: <Widget>[
              infoTile1('Amount Withdrawn', '\$ ${widget.withdrawAmount}'),
              verticalMargin8,
              infoTile1(
                'Date & Time',
                '${now.getFormattedDateOnly()} (${now.getFormattedDateWithTime()})',
              ),
              const Divider(
                color: shadowColor,
                thickness: 0.8,
                height: 10,
              ),
              verticalMargin16,
              infoTile1(
                'Total Withdrawn Amount',
                '\$ ${widget.bankDetails.amount}',
              ),
            ],
          ).padding(all: 16).expanded(),
          AppButton(
            buttonText: 'Confirm',
            suffixWidget: SizedBox(),
            onPressed: () {
              widget.walletBloc.add(
                WalletEvent.withdrawAmount(widget.bankDetails),
              );
            },
          ),
        ],
      ),
    );
  }
}
