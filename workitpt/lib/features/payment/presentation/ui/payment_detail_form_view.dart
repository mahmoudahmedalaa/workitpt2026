import 'package:webview_flutter/webview_flutter.dart';
import 'package:workitpt/core/widgets/base_view.dart';

import '../../../../core/export.dart';
import '../../../../core/routes/app_router.dart';

@RoutePage()
class PaymentDetailFormView extends StatelessWidget {
  final String paymentUrl;
  PaymentDetailFormView({super.key, required this.paymentUrl});
  final WebViewController controller = WebViewController();

  @override
  Widget build(BuildContext context) {
    return BaseView(
      color: Colors.white,
      titleText: 'Payment Details',
      appBarColor: Colors.white,
      padding: EdgeInsets.zero,
      elevation: 0,
      body: WebViewWidget(
          controller: controller
            ..setJavaScriptMode(JavaScriptMode.unrestricted)
            ..setBackgroundColor(const Color(0x00000000))
            ..setNavigationDelegate(
              NavigationDelegate(
                onNavigationRequest: (NavigationRequest request) async {
                  print('request.url');
                  print(request.url);
                  print('request.url');
                  // context.router.pop(request.url);
                  if (request.url.contains('/payment/success')) {
                    context.router.popAndPush(AllDoneRoute(
                        desc: "Congratulations! Your session has been booked!",
                        role: 'USER'));
                    // return NavigationDecision.prevent;
                  }
                  return NavigationDecision.navigate;
                },
              ),
            )
            ..loadRequest(Uri.parse(paymentUrl))),
    );
  }
  //  Padding(
  //   padding: allPadding16,
  //   child: Column(
  //     mainAxisAlignment: MainAxisAlignment.start,
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Text(
  //         "Please enter your payment details",
  //         style: AppTextStyle.bodyLgRegular,
  //       ),
  //       SizedBox(
  //         height: 10,
  //       ),
  //       Text(
  //         "Card Details",
  //         style: AppTextStyle.bodyMDSemiBold,
  //       ),
  //       SizedBox(
  //         height: 10,
  //       ),
  //       AppTextField(
  //         controller: _cardNumber,
  //         labelText: 'Card Number',
  //         hintText: 'XXXX XXXX XXXX XXXX',
  //         validator: (value) => validateNotEmpty(value, 'Contact Name'),
  //         // prefixIcon: Assets.icons.profile.path,
  //         textColor: colorPrimary,
  //         textInputType: TextInputType.name,
  //       ),
  //       AppTextField(
  //         controller: _cardNumber,
  //         labelText: 'Name',
  //         hintText: 'Sam Louis',
  //         validator: (value) => validateNotEmpty(value, 'Contact Name'),
  //         // prefixIcon: Assets.icons.profile.path,
  //         textColor: colorPrimary,
  //         textInputType: TextInputType.name,
  //       ),
  //       Row(
  //         children: [
  //           Expanded(
  //             child: AppTextField(
  //               controller: _cardNumber,
  //               labelText: 'Expiration Date',
  //               hintText: 'Sam Louis',
  //               validator: (value) =>
  //                   validateNotEmpty(value, 'Contact Name'),
  //               // prefixIcon: Assets.icons.profile.path,
  //               textColor: colorPrimary,
  //               textInputType: TextInputType.datetime,
  //             ),
  //           ),
  //           SizedBox(
  //             width: 10,
  //           ),
  //           Expanded(
  //             child: AppTextField(
  //               controller: _cardNumber,
  //               labelText: 'CVV',
  //               hintText: 'Sam Louis',
  //               validator: (value) =>
  //                   validateNotEmpty(value, 'Contact Name'),
  //               // prefixIcon: Assets.icons.profile.path,
  //               textColor: colorPrimary,
  //               textInputType: TextInputType.number,
  //             ),
  //           ),
  //         ],
  //       ),
  //       Spacer(),
  //       Align(
  //           alignment: Alignment.bottomCenter,
  //           child: AppButton(
  //             buttonText: "Next",
  //             onPressed: () {
  //               context.router.push(PaymentReviewRoute());
  //             },
  //           ))
  //     ],
  //   ),
  // ),
  // );
}
