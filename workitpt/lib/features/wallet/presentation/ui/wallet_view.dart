import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:workitpt/config/typography.dart';
import 'package:workitpt/core/constants/app_colors.dart';
import 'package:workitpt/core/constants/spacing.dart';
import 'package:workitpt/core/routes/app_router.dart';
import 'package:workitpt/features/wallet/data/models/balance_model.dart';
import 'package:workitpt/features/wallet/data/models/transaction_model.dart';
import 'package:workitpt/features/wallet/data/models/wallet_history_model.dart';
import 'package:workitpt/features/wallet/presentation/bloc/wallet_bloc.dart';
import 'package:workitpt/features/wallet/presentation/widgets/transaction_item.dart';
import 'package:workitpt/features/wallet/presentation/widgets/wallet_history_item.dart';

import '../../../../core/export.dart';
import '../../../../core/injection/injection.dart';
import '../../../../core/widgets/base_view.dart';

@RoutePage()
class WalletView extends StatefulWidget {
  const WalletView({super.key});

  @override
  State<WalletView> createState() => _WalletViewState();
}

class _WalletViewState extends State<WalletView>
    with SingleTickerProviderStateMixin {
  int currentTier = 1;

  String getChargePercent() {
    if (currentTier == 1) {
      return '20';
    } else if (currentTier == 2) {
      return '12';
    } else {
      return '7';
    }
  }

  Future showInfoDialog(BuildContext context) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          insetPadding: EdgeInsets.all(24),
          title: Image.asset(
            Assets.images.transInfo.path,
            height: 52,
            width: 52,
          ),
          content: Text(
            '''You are in Tier $currentTier and you will be charged ${getChargePercent()}% transaction fee per session sales. Below is the tier information.\n🏆 Tier 1: Up to 3,500 HKD (20%)\n🌟 Tier 2: Up to 7,000 HKD (12%)\n✨ Tier 3: Up to 10,500 HKD (7%)
            ''',
            style: AppTextStyle.bodySMRegular.copyWith(height: 2),
            textAlign: TextAlign.center,
          ),
        ),
      );

  WalletBloc walletBloc;

  _WalletViewState() : walletBloc = getIt<WalletBloc>();

  @override
  void initState() {
    walletBloc.add(WalletEvent.getWalletHistory());
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  TabController? tabController;

  BalanceModel balanceModel = BalanceModel();

  String? name;
  String? accNumber;
  String? bankName;

  List<TransactionModel> withdrawHistoryList = [];
  List<WalletHistoryModel> walletHistoryList = [];

  @override
  Widget build(BuildContext context) => BaseView(
        color: Colors.white,
        titleText: 'Wallet',
        appBarColor: Colors.white,
        padding: EdgeInsets.zero,
        actions: [
          IconButton(
            onPressed: () {
              showInfoDialog(context);
            },
            icon: Icon(Icons.info, color: colorPrimary),
          ),
        ],
        elevation: 0,
        body: BlocProvider(
          create: (context) => walletBloc,
          child: BlocListener<WalletBloc, WalletState>(
            listener: (context, state) {
              state.whenOrNull(
                onLoading: () {
                  EasyLoading.show(dismissOnTap: true);
                },
                onGetWalletHistorySuccess: (model) {
                  EasyLoading.dismiss();
                  walletHistoryList = model;
                  walletBloc.add(WalletEvent.getTransactions());
                },
                onGetTransactionSuccess: (model) {
                  EasyLoading.dismiss();
                  setState(() {
                    withdrawHistoryList = model;
                  });
                  if (model.isNotEmpty) {
                    name = model.first.details?.name ?? '';
                    accNumber = model.first.details?.acNo ?? '';
                    bankName = model.first.details?.bankName ?? '';
                  }
                },
                onFailure: (error) {
                  EasyLoading.showError(error ?? '');
                },
              );
            },
            child: Padding(
              padding: horizontalPadding16,
              child: Column(
                children: [
                  verticalMargin20,
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      WalletBalanceWidget(),
                      WithdrawMoneyWidget(
                        name: name ?? '',
                        accNumber: accNumber ?? '',
                        bankName: bankName ?? '',
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TabBar(
                    unselectedLabelColor: Colors.black,
                    labelColor: colorPrimary,
                    labelStyle: AppTextStyle.bodyMDRegular,
                    tabs: const [
                      Tab(
                        text: 'Transaction History',
                      ),
                      Tab(
                        text: 'Withdraw History',
                      ),
                    ],
                    controller: tabController,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: colorPrimary,
                    indicatorWeight: 3,
                    padding: const EdgeInsets.only(bottom: 10),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: tabController,
                      children: [
                        if (walletHistoryList.isNotEmpty)
                          ListView.builder(
                            itemCount: walletHistoryList.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) => WalletHistoryItem(
                                model: walletHistoryList[index]),
                          )
                        else
                          Center(
                            child: Text(
                              'No Transactions done yet.',
                              style: AppTextStyle.bodyLgSemiBold
                                  .copyWith(color: colorLightGrey),
                            ),
                          ),
                        if (withdrawHistoryList.isNotEmpty)
                          ListView.builder(
                            itemCount: withdrawHistoryList.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) =>
                                TransactionItemWidget(
                                    model: withdrawHistoryList[index]),
                          )
                        else
                          Center(
                            child: Text(
                              'No Transactions done yet.',
                              style: AppTextStyle.bodyLgSemiBold
                                  .copyWith(color: colorLightGrey),
                            ),
                          )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}

class WithdrawMoneyWidget extends StatelessWidget {
  final String name;
  final String accNumber;
  final String bankName;
  const WithdrawMoneyWidget(
      {super.key,
      required this.name,
      required this.accNumber,
      required this.bankName});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.router.push(WithdrawRoute(
          name: name,
          accNumber: accNumber,
          bankName: bankName,
        ));
      },
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: lightPrimary,
            radius: 30,
            child: Image.asset(
              Assets.images.wallet.path,
              height: 28,
              width: 28,
            ),
          ),
          verticalMargin4,
          Text(
            "Withdraw\nMoney",
            textAlign: TextAlign.center,
            style: AppTextStyle.bodySMRegular,
          )
        ],
      ),
    );
  }
}

class WalletBalanceWidget extends StatefulWidget {
  const WalletBalanceWidget({super.key});

  @override
  State<WalletBalanceWidget> createState() => _WalletBalanceWidgetState();
}

class _WalletBalanceWidgetState extends State<WalletBalanceWidget> {
  bool showBalance = false;
  WalletBloc walletBloc;

  _WalletBalanceWidgetState() : walletBloc = getIt<WalletBloc>();

  @override
  void initState() {
    walletBloc.add(WalletEvent.getBalance());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => walletBloc,
      child: Stack(
        children: [
          Container(
            height: 12.h,
            margin: EdgeInsets.only(right: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: colorPrimary,
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BlocConsumer<WalletBloc, WalletState>(
                    listener: (context, state) {
                      state.whenOrNull(
                        onLoading: () {
                          // EasyLoading.show(dismissOnTap: true);
                        },
                        onGetBalanceSuccess: (model) {
                          // EasyLoading.dismiss();
                        },
                        onFailure: (error) {
                          EasyLoading.showError(error ?? '');
                        },
                      );
                    },
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () => CircularProgressIndicator(
                          color: Colors.white,
                        ).center().expanded(),
                        onGetBalanceSuccess: (model) {
                          return Text(
                            showBalance
                                ? "\$ ${model.currentAmount?.toStringAsFixed(2)}"
                                : "\$ XXXX.XX",
                            style: AppTextStyle.headlineLgSemiBold.copyWith(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          );
                        },
                      );
                    },
                  ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            showBalance = !showBalance;
                          });
                        },
                        child: Icon(
                          showBalance ? Icons.visibility_off : Icons.visibility,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Wallet Balance",
                        style: AppTextStyle.bodyMDRegular
                            .copyWith(color: Colors.white),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              walletBloc.add(WalletEvent.getBalance());
            },
            customBorder: CircleBorder(),
            radius: 28,
            child: CircleAvatar(
              backgroundColor: lightPrimary,
              child: Image.asset(
                Assets.icons.reload.path,
                height: 25,
                width: 25,
              ),
            ),
          )
              .translate(
                offset: Offset(-10, 0),
              )
              .positioned(top: 0, bottom: 0, right: 0),
        ],
      ),
    ).expanded();
  }
}
