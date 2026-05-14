import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:workitpt/config/typography.dart';
import 'package:workitpt/core/constants/app_colors.dart';
import 'package:workitpt/core/constants/spacing.dart';
import 'package:workitpt/core/routes/app_router.dart';
import 'package:workitpt/core/utils/validator.dart';
import 'package:workitpt/core/widgets/app_button.dart';
import 'package:workitpt/core/widgets/app_text_field.dart';

import '../../../../core/export.dart';
import '../../../../core/injection/injection.dart';
import '../../../../core/widgets/base_view.dart';
import '../../data/models/withdraw_model.dart';
import '../bloc/wallet_bloc.dart';

@RoutePage()
class WithdrawView extends StatefulWidget {
  final String name;
  final String accNumber;
  final String bankName;
  const WithdrawView({
    super.key,
    required this.name,
    required this.accNumber,
    required this.bankName,
  });

  @override
  State<WithdrawView> createState() => _WithdrawViewState();
}

class _WithdrawViewState extends State<WithdrawView> {
  final amountController = TextEditingController();
  final nameController = TextEditingController();
  final acNoController = TextEditingController();
  final bankController = TextEditingController();

  final GlobalKey<FormState> _key = GlobalKey();
  WalletBloc walletBloc;

  _WithdrawViewState() : walletBloc = getIt<WalletBloc>();

  @override
  void initState() {
    walletBloc.add(WalletEvent.getBalance());
    setInitialValues();
    super.initState();
  }

  setInitialValues() {
    nameController.text = widget.name;
    acNoController.text = widget.accNumber;
    bankController.text = widget.bankName;
  }

  Future showInfoDialog(BuildContext context) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Image.asset(
            Assets.images.wallet.path,
            height: 52,
            width: 52,
          ),
          content: Text(
            'Oops! Insufficient balance in you WorkIT PT wallet. Please recheck.',
            style: AppTextStyle.bodySMRegular,
            textAlign: TextAlign.center,
          ),
        ),
      );
  double currentBalance = 0;

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => walletBloc,
        child: BlocListener<WalletBloc, WalletState>(
          listener: (context, state) {
            state.whenOrNull(
              onLoading: () {
                EasyLoading.show(dismissOnTap: true);
              },
              onGetBalanceSuccess: (balance) {
                currentBalance = balance.currentAmount!;
                setState(() {});
                EasyLoading.dismiss();
              },
              onGetTransactionSuccess: (model) {
                EasyLoading.dismiss();
              },
              onWithdrawSuccess: (message) {
                EasyLoading.showSuccess(message);
                context.router.replace(AllDoneRoute(
                    role: 'TRAINER',
                    desc:
                        'Your withdraw request has been submitted. You will receive the amount within 48 hours.'));
              },
              onFailure: (error) {
                EasyLoading.showError(error ?? '');
              },
            );
          },
          child: BaseView(
              color: Colors.white,
              titleText: 'Withdraw',
              appBarColor: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 16),
              bottomNavigationBar: AppButton(
                buttonText: 'Withdraw Money',
                suffixWidget: SizedBox(),
                onPressed: () {
                  if (_key.currentState!.validate()) {
                    if (currentBalance < double.parse(amountController.text)) {
                      showInfoDialog(context);
                    } else
                      context.router.push(
                        WithdrawSummaryRoute(
                          withdrawAmount:
                              double.tryParse(amountController.text)!,
                          walletBloc: walletBloc,
                          bankDetails: BankDetails(
                            amount: amountController.text,
                            acNo: acNoController.text,
                            name: nameController.text,
                            bankName: bankController.text,
                          ),
                        ),
                      );
                  } else {
                    EasyLoading.showError('Please fill necessary details...');
                  }
                },
              ),
              elevation: 0,
              body: SingleChildScrollView(
                child: Form(
                  key: _key,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        verticalMargin20,
                        Container(
                          width: 90.w,
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.white,
                                  colorPrimary.withOpacity(0.1)
                                ],
                              ),
                              borderRadius: BorderRadius.circular(8)),
                          child: Column(
                            children: [
                              Text(
                                'Available Balance',
                                style: AppTextStyle.bodySMBold,
                              ),
                              Text(
                                '\$${currentBalance}',
                                style: AppTextStyle.headlineSMBold
                                    .copyWith(color: colorPrimary),
                              ),
                            ],
                          ),
                        ),
                        verticalMargin12,
                        Text("Enter Amount",
                            style: AppTextStyle.subHeadSMMedium),
                        verticalMargin12,
                        Container(
                          width: 90.w,
                          height: 16.h,
                          padding: allPadding24,
                          decoration: BoxDecoration(
                              border: Border.all(color: shadowColor),
                              color: buttonBG.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(24)),
                          child: Container(
                              padding: EdgeInsets.only(top: 2.h, left: 20.w),
                              decoration: BoxDecoration(
                                  color: buttonBG.withOpacity(0.5),
                                  border: Border.all(color: shadowColor),
                                  borderRadius: BorderRadius.circular(12)),
                              child: AppTextField(
                                controller: amountController,
                                inputBorder: InputBorder.none,
                                textInputType: TextInputType.number,
                                hintText: 'Enter Amount',
                                validator: (value) =>
                                    validateNotEmpty(value, 'Amount'),
                                textStyle: AppTextStyle.headlineLgSemiBold,
                                prefixText: '\$  ',
                              )),
                        ),
                        verticalMargin20,
                        Text("Please add your bank account details.",
                            style: AppTextStyle.bodyMDMedium),
                        AppTextField(
                          controller: nameController,
                          labelText: 'Account Holder Name',
                          hintText: "eg. Shyam Kishor",
                          validator: (value) =>
                              validateNotEmpty(value, 'Account Holder Name'),
                          textStyle: AppTextStyle.bodyMDMedium,
                        ),
                        AppTextField(
                          controller: acNoController,
                          hintText: "eg. asdfqawert4984166",
                          validator: (value) =>
                              validateNotEmpty(value, 'Account Number'),
                          labelText: 'Account Number',
                          textStyle: AppTextStyle.bodyMDMedium,
                        ),
                        AppTextField(
                          controller: bankController,
                          labelText: 'Enter Bank Name',
                          validator: (value) =>
                              validateNotEmpty(value, 'Bank Name'),
                          hintText: "eg. NIC Asia Bank",
                          textStyle: AppTextStyle.bodyMDMedium,
                        ),
                      ]),
                ),
              )),
        ),
      );
}

class WithdrawMoneyWidget extends StatelessWidget {
  const WithdrawMoneyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: lightPrimary,
          radius: 32,
          child: Image.asset(
            Assets.images.wallet.path,
            height: 32,
            width: 32,
          ),
        ),
        Text(
          "Withdraw\nMoney",
          textAlign: TextAlign.center,
          style: AppTextStyle.bodySMRegular,
        )
      ],
    );
  }
}

class WalletBalanceWidget extends StatelessWidget {
  const WalletBalanceWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 12.h,
          width: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: colorPrimary,
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "\$1000.00",
                  style: AppTextStyle.headlineLgSemiBold
                      .copyWith(color: Colors.white, fontSize: 24),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.remove_red_eye_outlined,
                      color: Colors.white,
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
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: -20,
          top: 0,
          bottom: 0,
          child: CircleAvatar(
            backgroundColor: lightPrimary,
            child: Image.asset(
              Assets.icons.reload.path,
              height: 25,
              width: 25,
            ),
          ),
        ),
      ],
    );
  }
}
