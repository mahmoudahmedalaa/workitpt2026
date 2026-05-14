import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workitpt/config/typography.dart';
import 'package:workitpt/core/constants/app_colors.dart';
import 'package:workitpt/core/constants/spacing.dart';
import 'package:workitpt/core/export.dart';
import 'package:workitpt/core/routes/app_router.dart';
import 'package:workitpt/core/utils/date_util.dart';
import 'package:workitpt/core/widgets/base_view.dart';
import 'package:workitpt/features/payment/presentation/bloc/payment_bloc.dart';

import '../../../../core/injection/injection.dart';
import '../../../../core/widgets/app_button.dart';

@RoutePage()
class PaymentCardView extends StatefulWidget {
  final List<String> bookingId;
  const PaymentCardView({
    super.key,
    required this.bookingId,
  });

  @override
  State<PaymentCardView> createState() => _PaymentCardViewState();
}

class _PaymentCardViewState extends State<PaymentCardView> {
  PaymentBloc paymentBloc;

  int dotIndex = 0;
  int selectedIndex = 0;
  String selectedCardId = '';

  _PaymentCardViewState() : paymentBloc = getIt<PaymentBloc>();

  @override
  void initState() {
    paymentBloc.add(PaymentEvent.getCardList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => paymentBloc,
      child: BlocListener<PaymentBloc, PaymentState>(
        listener: (context, state) {
          state.whenOrNull(
            onGetCardListSuccess: (model) {
              if (model.isNotEmpty) {
                setState(() {
                  selectedCardId = model[0].id!;
                });
              }
            },
          );
        },
        child: BaseView(
          hideAppBar: false,
          appBarColor: Colors.white,
          color: Colors.white,
          elevation: 0,
          padding: EdgeInsets.zero,
          titleText: 'Cards',
          body: Column(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  verticalMargin12,
                  Text(
                    'Your Cards',
                    style: AppTextStyle.bodyMDMedium.copyWith(
                      color: Color(0xCC010101),
                    ),
                  ).padding(horizontal: 16),
                  verticalMargin12,
                  BlocBuilder<PaymentBloc, PaymentState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () => SizedBox(),
                        onLoading: () => CircularProgressIndicator()
                            .center()
                            .height(MediaQuery.of(context).size.height * 0.3),
                        onGetCardListSuccess: (model) {
                          if (model.isEmpty) {
                            return SizedBox();
                          } else
                            return Column(
                              children: <Widget>[
                                CarouselSlider.builder(
                                  options: CarouselOptions(
                                    autoPlayCurve:
                                        Curves.easeInOutCubicEmphasized,
                                    autoPlay: false,
                                    autoPlayAnimationDuration:
                                        const Duration(milliseconds: 400),
                                    autoPlayInterval:
                                        const Duration(milliseconds: 5000),
                                    initialPage: 0,
                                    enlargeCenterPage: true,
                                    enableInfiniteScroll:
                                        model.length > 1 ? true : false,
                                    onPageChanged: (index, reason) {
                                      setState(() {
                                        dotIndex = index;
                                      });
                                    },
                                    aspectRatio:
                                        (MediaQuery.of(context).size.width *
                                                .92) /
                                            (MediaQuery.of(context).size.width *
                                                .52),
                                    viewportFraction: 1,
                                  ),
                                  itemCount: model.length,
                                  itemBuilder: (context, index, realIndex) =>
                                      _buildCreditCard(
                                    isSelected: selectedIndex == dotIndex,
                                    context: context,
                                    color: colorPrimary,
                                    cardNumber:
                                        '**** **** **** ${model[index].card?.last4}',
                                    cardHolder:
                                        '${model[index].billingDetails?.name}',
                                    cardExpiration:
                                        '${DateTime.utc(model[index].card!.expYear!, model[index].card!.expMonth!).getExpiryMonth()}/${DateTime.utc(model[index].card!.expYear!).getExpiryYear()}',
                                    category: 'category',
                                    onTap: () {
                                      setState(() {
                                        selectedCardId = model[index].id!;
                                        selectedIndex = index;
                                      });
                                    },
                                  ),
                                ),
                                verticalMargin12,
                                if (model.isNotEmpty && model.length > 1)
                                  DotsIndicator(
                                    dotsCount: model.length,
                                    position: dotIndex,
                                    decorator: const DotsDecorator(
                                      color: darkText,
                                      activeColor: colorPrimary,
                                      spacing: EdgeInsets.symmetric(
                                        horizontal: 2,
                                      ),
                                      size: Size(6, 6),
                                      activeSize: Size(6, 6),
                                    ),
                                  )
                              ],
                            );
                        },
                      );
                    },
                  ),
                  verticalMargin12,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.credit_card,
                          ),
                          horizontalMargin8,
                          Text(
                            'Card',
                            style: AppTextStyle.bodySMRegular,
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () async {
                          final value =
                              await context.router.push(AddCardRoute());
                          if (value != null && value != '') {
                            paymentBloc.add(PaymentEvent.getCardList());
                          }
                        },
                        child: Text(
                          'Add Card',
                          style: AppTextStyle.bodySMRegular
                              .copyWith(color: colorPrimary),
                        ),
                      ),
                    ],
                  ).padding(horizontal: 16),
                ],
              ).expanded(),
              AppButton(
                buttonText: "Checkout",
                suffixWidget: SizedBox(),
                onPressed: () {
                  print(widget.bookingId);
                  context.router.push(
                    PaymentReviewRoute(
                      bookingId: widget.bookingId,
                      cardID: selectedCardId,
                    ),
                  );
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).padding.bottom,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCreditCard({
    required BuildContext context,
    required Color color,
    required String cardNumber,
    required String cardHolder,
    required String cardExpiration,
    required String category,
    required VoidCallback onTap,
    required bool isSelected,
  }) {
    return Stack(
      children: <Widget>[
        Card(
          color: color,
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          child: Container(
            height: MediaQuery.of(context).size.width *
                .56, // card ratio = 85.60/53.98
            width: MediaQuery.of(context).size.width * .9,
            padding:
                const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 22.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // _buildLogosBlock(category),

                Text(
                  '$cardNumber',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontFamily: 'CourrierPrime',
                  ),
                )
                    .padding(
                        top: ((MediaQuery.of(context).size.width * .56) / 2) -
                            15)
                    .expanded(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildDetailsBlock(label: 'Card Holder', value: cardHolder),
                    _buildDetailsBlock(
                        label: 'VALID THRU', value: cardExpiration),
                  ],
                ),
              ],
            ),
          ),
        ),
        Radio(
          value: isSelected,
          groupValue: true,
          onChanged: (val) {
            onTap();
          },
          // activeColor: Colors.white,
          // focusColor: Colors.white,
          fillColor: MaterialStatePropertyAll(Colors.white),
        ).positioned(top: 0, right: 0),
      ],
    ).gestures(onTap: onTap);
  }

  // Build the top row containing logos
  Row _buildLogosBlock(String category) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Image.asset(
          "assets/images/contact_less.png",
          height: 20,
          width: 18,
        ),
        Image.asset(
          category == 'MC'
              ? "assets/images/mastercard.png"
              : "assets/images/visa.png",
          height: 50,
          width: 50,
        ),
      ],
    );
  }

// Build Column containing the cardholder and expiration information
  Column _buildDetailsBlock({required String label, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '$label',
          style: AppTextStyle.tinySMRegular.copyWith(color: Colors.white),
        ),
        Text(
          '$value',
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
