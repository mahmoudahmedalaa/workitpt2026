import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:workitpt/config/typography.dart';
import 'package:workitpt/core/utils/date_util.dart';
import 'package:workitpt/features/booking/presentation/bloc/booking_bloc.dart';
import 'package:workitpt/features/payment/presentation/bloc/payment_bloc.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/spacing.dart';
import '../../../../core/export.dart';
import '../../../../core/injection/injection.dart';
import '../../../../core/routes/app_router.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/base_view.dart';
import '../../../booking/data/model/booking_model.dart';
import '../../../booking/presentation/widgets/booking_widget.dart';
import '../../data/models/checkout_card_model.dart';

@RoutePage()
class PaymentReviewView extends StatefulWidget {
  final List<String> bookingId;
  final String cardID;
  const PaymentReviewView({
    super.key,
    required this.bookingId,
    required this.cardID,
  });

  @override
  State<PaymentReviewView> createState() => _PaymentReviewViewState();
}

class _PaymentReviewViewState extends State<PaymentReviewView> {
  // List<DateTime> selectedDates = [];

  String mapLocation = '';

  PaymentBloc paymentBloc;
  BookingBloc bookingBloc;

  _PaymentReviewViewState()
      : paymentBloc = getIt<PaymentBloc>(),
        bookingBloc = getIt<BookingBloc>();

  @override
  void initState() {
    // if (widget.model.session!.location != null &&
    //     widget.model.session!.location!.contains('Online')) {
    //   mapLocation = widget.model.session!.onlineUrl ?? '';
    // } else {
    //   mapLocation = widget.model.session!.mapLocation ?? '';
    // }
    bookingBloc.add(BookingEvent.getMultipleBookingDetail(widget.bookingId));
    super.initState();
  }

  // getSelectedDates(BookingModel model) {
  //   final value = model.session!.prefrenceDataTime!
  //       .where((element) => element.isBooking!);
  // }

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => paymentBloc,
          ),
          BlocProvider(
            create: (context) => bookingBloc,
          ),
        ],
        child: BlocListener<PaymentBloc, PaymentState>(
          listener: (context, state) {
            state.whenOrNull(
              onLoading: () => EasyLoading.show(),
              onFailure: (message) => EasyLoading.showError(message!),
              onCheckoutWithCardSuccess: (message) {
                EasyLoading.showSuccess(message);
                context.router.popAndPush(
                  PaymentSuccessRoute(
                    role: 'USER',
                    id: widget.bookingId,
                  ),
                );
              },
              onGetPaymentReceiptSuccess: (model) {
                EasyLoading.showSuccess('Success');
              },
            );
          },
          child: BlocBuilder<BookingBloc, BookingState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () => SizedBox(),
                onGetMultipleBookingDetailSuccess: (model) {
                  return BaseView(
                    color: Colors.white,
                    titleText: 'Review Summary',
                    appBarColor: Colors.white,
                    padding: allPadding16,
                    elevation: 0,
                    body: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BookingCardWidget(
                              model: BookingModel(
                                session: model.session,
                                dateFrom: model.session!.dateFrom,
                                dateTo: model.session!.dateTo,
                                timeFrom: model.session!.timeFrom,
                                timeTo: model.session!.timeTo,
                              ),
                            ),
                            verticalMargin8,
                            const Divider(
                              color: shadowColor,
                            ),
                            verticalMargin12,
                            infoTile1('Time',
                                '${model.session!.timeFrom} - ${model.session!.timeTo}'),
                            Row(
                              children: [
                                Text('Date', style: AppTextStyle.bodyLgSemiBold)
                                    .expanded(),
                                Wrap(
                                  children: [
                                    ...List.generate(
                                      model.bookingDates?.length ?? 1,
                                      // widget.selectedDates.length,
                                      (index) => Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 1.w, horizontal: 2.w),
                                        margin: EdgeInsets.only(right: 1.w),
                                        decoration: BoxDecoration(
                                          color: colorPrimary.withOpacity(0.2),
                                          borderRadius:
                                              BorderRadius.circular(8.w),
                                        ),
                                        child: Text(
                                          // widget.selectedDates[index]
                                          //     .getFormattedDateOnly(),

                                          model.bookingDates != null ||
                                                  model.bookingDates != []
                                              ? DateTime.parse(model
                                                      .bookingDates![index])
                                                  .getFormattedDateOnly()
                                              : model.dateFrom!
                                                  .getFormattedDateOnly(),
                                          // model.dateFrom
                                          //         ?.getFormattedDateOnly() ??
                                          //     '',
                                          style: AppTextStyle.bodyMDRegular
                                              .copyWith(color: colorPrimary),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ).padding(bottom: 12),
                            infoTile1('Trainer',
                                '${model.session?.trainer?.firstName} ${model.session?.trainer?.lastName}'),
                            verticalMargin8,
                            const Divider(
                              color: shadowColor,
                            ),
                            verticalMargin12,
                            Text('Payment Information',
                                style: AppTextStyle.bodyLgSemiBold),
                            verticalMargin12,
                            infoTile2(
                                'Amount',
                                model.pricing?.details?.currentCost
                                        .toString() ??
                                    ''),
                            infoTile2(
                                'Service Fee',
                                model.pricing?.details?.serviceCharge
                                        .toString() ??
                                    ''),
                            const Divider(
                              color: shadowColor,
                            ),
                            verticalMargin12,
                            infoTile2(
                                'Total', (model.pricing?.total).toString()),
                            const Divider(
                              color: shadowColor,
                            ),
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
                                  onPressed: () {
                                    context.router.pop();
                                  },
                                  child: Text(
                                    'Change Card',
                                    style: AppTextStyle.bodySMRegular
                                        .copyWith(color: colorPrimary),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ).scrollable().expanded(),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: AppButton(
                            buttonText: "Done",
                            suffixWidget: SizedBox.shrink(),
                            onPressed: () {
                              paymentBloc.add(
                                PaymentEvent.checkoutWithCard(
                                  CheckoutCardModel(
                                    cardId: widget.cardID,
                                    booking: widget.bookingId,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
      );

  Widget infoTile1(String text1, String text2) => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(text1, style: AppTextStyle.bodyLgSemiBold).expanded(),
          Text(
            text2,
            style: AppTextStyle.bodyMDRegular,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ).alignment(Alignment.centerRight).expanded(),
        ],
      ).padding(bottom: 12);

  Widget infoTile2(String text1, String text2) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text1,
              style: AppTextStyle.bodyLgSemiBold.copyWith(color: darkText)),
          Text('\$$text2', style: AppTextStyle.bodyLgSemiBold),
        ],
      ).padding(bottom: 12);
}
