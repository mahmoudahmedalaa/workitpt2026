import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:workitpt/core/export.dart';
import 'package:workitpt/core/injection/injection.dart';
import 'package:workitpt/core/widgets/base_view.dart';
import 'package:workitpt/features/payment/presentation/bloc/payment_bloc.dart';

import '../../../../config/typography.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/spacing.dart';
import '../../../../core/routes/app_router.dart';
import '../../../../core/widgets/app_button.dart';

@RoutePage()
class PaymentSuccessView extends StatefulWidget {
  final String role;
  final List<String> id;
  const PaymentSuccessView({super.key, required this.role, required this.id});

  @override
  State<PaymentSuccessView> createState() => _PaymentSuccessViewState();
}

class _PaymentSuccessViewState extends State<PaymentSuccessView> {
  final bloc = getIt<PaymentBloc>();

  bool isDownloaded = false;
  String filePath = '';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: BlocListener<PaymentBloc, PaymentState>(
        listener: (context, state) {
          state.whenOrNull(
            onLoading: () => EasyLoading.show(),
            onGetPaymentReceiptSuccess: (model) {
              EasyLoading.showSuccess('Downloaded Successfully.');
              setState(() {
                filePath = model.path;
                isDownloaded = true;
              });
            },
          );
        },
        child: BaseView(
          hideAppBar: true,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Assets.icons.paymentSuccess.path,
                    height: 50.h,
                  ),
                  verticalMargin24,
                  Text(
                    'Congratulations, Your Session Has\nBeen Booked!',
                    textAlign: TextAlign.center,
                    style: AppTextStyle.bodyMDRegular.copyWith(color: darkText),
                  ),
                  horizontalMargin12,
                  TextButton(
                    onPressed: isDownloaded
                        ? () {
                            EasyLoading.showInfo('Receipt already downloaded');
                          }
                        : () {
                            bloc.add(PaymentEvent.getPaymentReceipt(widget.id));
                          },
                    child: Text(
                      isDownloaded ? 'Downloaded' : 'Download e-receipt',
                      style: AppTextStyle.bodyMDRegular
                          .copyWith(color: colorPrimary),
                    ),
                  ),
                ],
              ).padding(top: 72, horizontal: 24, bottom: 24).expanded(),
              AppButton(
                onPressed: () {
                  context.router.popAndPush(DashboardRoute(role: widget.role));
                },
                buttonText: 'Done',
                suffixWidget: const SizedBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
