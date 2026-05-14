import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:place_picker/place_picker.dart';
import 'package:sizer/sizer.dart';
import 'package:workitpt/core/routes/app_router.dart';
import 'package:workitpt/core/utils/concat_image_url.dart';
import 'package:workitpt/features/booking/data/model/add_booking_model.dart';
import 'package:workitpt/features/booking/data/model/add_booking_response_model.dart';
import 'package:workitpt/features/sessions/data/models/locationvalidate_model.dart';
import 'package:workitpt/features/sessions/data/models/session_response_model.dart';
import 'package:workitpt/features/sessions/domain/controller/i_session_controller.dart';
import 'package:workitpt/features/sessions/presentation/widgets/date_picker_widget.dart';

import '../../../../../config/typography.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/keys/app_keys.dart';
import '../../../../../core/constants/spacing.dart';
import '../../../../../core/export.dart';
import '../../../../../core/injection/injection.dart';
import '../../../../../core/utils/date_util.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/base_view.dart';
import '../../../../booking/presentation/bloc/booking_bloc.dart';
import '../../widgets/session_info_widget.dart';

@RoutePage()
class SessionBookingView extends StatefulWidget {
  final SessionResponseModel model;
  final String? isPaid;
  const SessionBookingView({super.key, required this.model, this.isPaid});

  @override
  State<SessionBookingView> createState() => _SessionBookingViewState();
}

class _SessionBookingViewState extends State<SessionBookingView> {
  int dotIndex = 0;
  List<DateTime> selectedDates = [];
  BookingBloc bookingBloc;
  bool isPayLater = false;
  AddBookingResponseModel? bookingModel;

  _SessionBookingViewState() : bookingBloc = getIt<BookingBloc>();
  String mapLocation = '';

  double serviceFee = 0;

  String calculateServiceFee() {
    //2.5% service tax
    final fee = ((widget.model.price! *
            (selectedDates.isEmpty ? 1 : selectedDates.length)) *
        (2.5 / 100));
    setState(() {
      serviceFee = fee > 20 ? 20 : fee;
    });
    return serviceFee.toStringAsFixed(2);
  }

  List<DateTime> _getAvailableDates() {
    final list = widget.model.prefrenceDataTime!
        .where((element) => !(element.isBooking)!)
        .toList();
    return list.map((e) => e.date!).toList();
  }

  @override
  void initState() {
    if (widget.model.location != null &&
        widget.model.location!.contains('Online')) {
      mapLocation = widget.model.onlineUrl ?? '';
    } else {
      mapLocation = widget.model.mapLocation ?? '';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => bookingBloc,
        child: BlocListener<BookingBloc, BookingState>(
          listener: (context, state) {
            state.whenOrNull(
              onLoading: EasyLoading.show,
              onFailure: (error) {
                EasyLoading.dismiss();
                showBookingAlertDialog(
                  context,
                  error ??
                      'Oops! The chosen date and time are already reserved for a session.',
                  canCall: false,
                );
                // EasyLoading.showError(error ?? '');
              },
              onAddBookingSuccess: (List<AddBookingResponseModel> model) {
                bookingModel = model[0];
                if (!isPayLater) {
                  EasyLoading.dismiss();
                  context.router.push(
                    PaymentCardRoute(
                        bookingId: model.map((e) => e.id!).toList()),
                  );
                } else {
                  EasyLoading.showSuccess('Session booked successfully');
                  context.router.pop();
                }
              },
            );
          },
          child: BaseView(
            padding: EdgeInsets.zero,
            titleText: 'Sessions Booking',
            appBarColor: Colors.white,
            elevation: 0,
            bottomNavigationBar: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: AppButton(
                    backgroundColor: shadowColor,
                    buttonText: 'Pay Later',
                    textColor: blackText,
                    suffixWidget: const SizedBox(),
                    onPressed: () {
                      setState(() {
                        isPayLater = true;
                      });
                      if (widget.model.pendingBookingId == null ||
                          widget.model.pendingBookingId == '') {
                        List selDates = [];
                        if (widget.model.selectType!.contains('one_time')) {
                          final tt = widget.model.prefrenceDataTime!.first;
                          selDates
                              .add(Date(date: tt.date, session: tt.sessionID));
                        } else {
                          for (var j in widget.model.prefrenceDataTime!) {
                            for (var i in selectedDates) {
                              if (checkDate(i, j.date!)) {
                                selDates.add(
                                    Date(date: j.date, session: j.sessionID));
                              }
                            }
                          }
                        }
                        if (selDates.isEmpty) {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Image.asset(
                                Assets.images.warning.path,
                                height: 52,
                                width: 52,
                              ),
                              content: Text(
                                "Please select a date to confirm your booking",
                                style: AppTextStyle.bodySMRegular,
                                textAlign: TextAlign.center,
                              ),
                              actions: [
                                TextButton(
                                  child: Text(
                                    'OK',
                                    style: AppTextStyle.bodyLgSemiBold
                                        .copyWith(color: colorPrimary),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    // if (timeOverlapText == null) {
                                    //   Navigator.pop(context);
                                    // }
                                  },
                                )
                              ],
                            ),
                          );
                        } else {
                          showBookingAlertDialog(context, null);
                        }
                      } else {
                        showBookingAlertDialog(context, null, canCall: false);
                      }
                    },
                  ),
                ),
                Flexible(
                  child: AppButton(
                    buttonText: 'Pay Now',
                    onPressed: () async {
                      List<Date> selDates = [];
                      if (widget.model.selectType!.contains('one_time')) {
                        final tt = widget.model.prefrenceDataTime!.first;
                        selDates
                            .add(Date(date: tt.date, session: tt.sessionID));
                      } else {
                        for (var j in widget.model.prefrenceDataTime!) {
                          for (var i in selectedDates) {
                            if (checkDate(i, j.date!)) {
                              selDates.add(
                                  Date(date: j.date, session: j.sessionID));
                            }
                          }
                        }
                      }
                      if (selDates.isEmpty) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Image.asset(
                              Assets.images.warning.path,
                              height: 52,
                              width: 52,
                            ),
                            content: Text(
                              "Please select a date to confirm your booking",
                              style: AppTextStyle.bodySMRegular,
                              textAlign: TextAlign.center,
                            ),
                            actions: [
                              TextButton(
                                child: Text(
                                  'OK',
                                  style: AppTextStyle.bodyLgSemiBold
                                      .copyWith(color: colorPrimary),
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                  // if (timeOverlapText == null) {
                                  //   Navigator.pop(context);
                                  // }
                                },
                              )
                            ],
                          ),
                        );
                      } else {
                        bookingBloc.add(BookingEvent.addBooking(
                            AddBookingModel(dates: selDates)));
                      }
                    },
                    suffixWidget: const SizedBox(),
                  ),
                ),
              ],
            ).padding(bottom: MediaQuery.of(context).padding.bottom),
            body: Column(
              children: <Widget>[
                SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          CarouselSlider.builder(
                            options: CarouselOptions(
                              autoPlayCurve: Curves.easeInOut,
                              autoPlay: widget.model.images != null &&
                                  widget.model.images!.length > 1,
                              autoPlayAnimationDuration:
                                  const Duration(milliseconds: 400),
                              autoPlayInterval:
                                  const Duration(milliseconds: 5000),
                              initialPage: 0,
                              enlargeCenterPage: false,
                              enableInfiniteScroll: true,
                              pauseAutoPlayOnTouch: true,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  dotIndex = index;
                                });
                              },
                              aspectRatio: 100.w / 25.h,
                              viewportFraction: 1,
                            ),
                            itemCount: widget.model.images?.length ?? 0,
                            itemBuilder: (context, index, realIndex) =>
                                widget.model.images == null ||
                                        widget.model.images!.isEmpty
                                    ? Container(
                                        decoration: BoxDecoration(
                                          gradient: sessionGradient,
                                          image: DecorationImage(
                                            image: AssetImage(
                                                Assets.images.loginBg.path),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      )
                                    : CachedNetworkImage(
                                        imageUrl: concatImageUrl(
                                            widget.model.images![index]),
                                        fit: BoxFit.cover,
                                        width: 100.w,
                                      ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                if (widget.isPaid != null)
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(26),
                                      color: widget.isPaid!.contains('Paid')
                                          ? colorPrimary
                                          : lightPrimary,
                                    ),
                                    child: Text(
                                      widget.isPaid!.contains('Paid')
                                          ? 'Paid'
                                          : 'Booked',
                                      style:
                                          AppTextStyle.bodyMDRegular.copyWith(
                                        color: widget.isPaid!.contains('Paid')
                                            ? Colors.white
                                            : blackText,
                                      ),
                                    ),
                                  )
                                else
                                  SizedBox(),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(26),
                                    color: lightPrimary,
                                  ),
                                  child: Text(
                                    widget.model.sessionType ?? 'One - One',
                                    style: AppTextStyle.bodyMDRegular,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 12,
                            right: 0,
                            left: 0,
                            child: widget.model.images != null &&
                                    widget.model.images!.length > 1
                                ? DotsIndicator(
                                    dotsCount: widget.model.images!.isEmpty
                                        ? 1
                                        : widget.model.images!.length,
                                    position: dotIndex,
                                    decorator: const DotsDecorator(
                                      color: Colors.white,
                                      activeColor: colorPrimary,
                                      spacing: EdgeInsets.symmetric(
                                        horizontal: 2,
                                      ),
                                      size: Size(8, 8),
                                      activeSize: Size(8, 8),
                                    ),
                                  )
                                : const SizedBox(),
                          )
                        ],
                      ).width(100.w),
                      SessionInfoWidget(
                        model: widget.model,
                      ).padding(horizontal: 16, vertical: 12),
                      const Divider(color: shadowColor),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          infoTile1(
                            'Time',
                            '${widget.model.timeFrom} - ${widget.model.timeTo}',
                          ),
                          if (widget.model.selectType!.contains('one_time'))
                            infoTile1(
                              'Date',
                              '${widget.model.date?.getFormattedDateOnly()}',
                            )
                          else
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Preferable Date',
                                  style: AppTextStyle.bodyLgSemiBold,
                                ).padding(top: 12, bottom: 12),
                                DatePicker(
                                  _getAvailableDates(),
                                  // daysCount: 20,
                                  selectedDates: selectedDates,
                                  onDateChange: (date) {
                                    setState(() {
                                      if (selectedDates.contains(date)) {
                                        selectedDates.remove(date);
                                      } else {
                                        selectedDates.add(date);
                                      }
                                    });
                                  },
                                ).padding(bottom: 24)
                              ],
                            ),
                          // TimeSlotSelectionWidget(
                          //     selectedDates: selectedDates,
                          //     availableDates: widget.model.prefrenceDataTime!
                          //         .map((e) => e.date!)
                          //         .toList()),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.model.location!.contains('Online')
                                    ? 'Online Link'
                                    : 'Location',
                                style: AppTextStyle.bodyLgSemiBold,
                              ).padding(bottom: 12),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 70.w,
                                    child: Text(
                                      mapLocation,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: AppTextStyle.bodySMRegular,
                                    ),
                                  ),
                                  if (widget.model.flexibleLocation! &&
                                      !widget.model.location!
                                          .contains('Online') &&
                                      widget.model.coordicates?.lat != null &&
                                      widget.model.coordicates?.lng != null &&
                                      widget.model.locationRange != null)
                                    Container(
                                      height: 36,
                                      width: 36,
                                      decoration: BoxDecoration(
                                          color: colorPrimary,
                                          borderRadius:
                                              BorderRadius.circular(100)),
                                      padding: allPadding8,
                                      child: Image.asset(
                                        Assets.images.send.path,
                                        color: Colors.white,
                                      ),
                                    ).gestures(
                                      onTap: () async {
                                        final value = (await getLocation());
                                        if (value != null) {
                                          mapLocation = value.formattedAddress!;
                                        }
                                        setState(() {});
                                        // widget.onLocationSelect(value);
                                      },
                                    )
                                ],
                              ),
                            ],
                          ),
                          verticalMargin24,
                          if (widget.model.selectType != 'recurring' ||
                              selectedDates.isNotEmpty) ...[
                            Text('Payment Information',
                                style: AppTextStyle.bodyLgSemiBold),
                            verticalMargin12,
                            infoTile2(
                              'Amount',
                              widget.model.price.toString(),
                            ),
                            infoTile2(
                              'Service Fee',
                              '${calculateServiceFee()}',
                            ),
                            infoTile1(
                                'Quantity',
                                widget.model.selectType == 'one_time'
                                    ? '1'
                                    : selectedDates.length.toString()),
                            infoTile2(
                              'Total',
                              (widget.model.price! *
                                          (selectedDates.length > 0
                                              ? selectedDates.length
                                              : 1) +
                                      serviceFee)
                                  .toStringAsFixed(2),
                            ),
                          ],
                          const Divider(
                            color: shadowColor,
                          ),
                          verticalMargin48,
                        ],
                      ).padding(all: 24),
                      const Divider(
                        color: shadowColor,
                      )
                    ],
                  ),
                ).expanded(),
              ],
            ),
          ),
        ),
      );

  Widget infoTile1(String text1, String text2) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text1, style: AppTextStyle.bodyLgSemiBold),
          Text(text2, style: AppTextStyle.bodyMDRegular),
        ],
      ).padding(bottom: 12);

  Widget infoTile2(String text1, String text2) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text1,
            style: AppTextStyle.bodyLgSemiBold.copyWith(color: darkText),
          ),
          Text('\$$text2', style: AppTextStyle.bodyLgSemiBold),
        ],
      ).padding(bottom: 12);

  LatLng? selectedLatLng = const LatLng(27.67386, 85.348685);

  Future<LocationResult?> getLocation() async => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => PlacePicker(
            AppKeys.apiKey,
            displayLocation: selectedLatLng,
            latitude: selectedLatLng!.latitude,
            longitude: selectedLatLng!.longitude,
            radius: widget.model.locationRange ?? 5,
            onSelectionRejected: (message) {
              EasyLoading.showError(message);
            },
            onLocationWillSelect: (val) {
              return getIt<ISessionController>().validateLocation(
                  LocationValidateModel(
                      sessionId: widget.model.id,
                      location:
                          Location(lat: val.latitude, lng: val.longitude)));
            },
          ),
        ),
      );

  Future showBookingAlertDialog(BuildContext context, String? timeOverlapText,
          {bool canCall = true}) =>
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Image.asset(
            Assets.images.warning.path,
            height: 52,
            width: 52,
          ),
          content: Text(
            timeOverlapText ??
                'Payment needs to be done 4 hours before the session starts or the session booking will expire',
            style: AppTextStyle.bodySMRegular,
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
              child: Text(
                'OK',
                style:
                    AppTextStyle.bodyLgSemiBold.copyWith(color: colorPrimary),
              ),
              onPressed: () {
                Navigator.pop(context);
                // if (timeOverlapText == null) {
                //   Navigator.pop(context);
                // }
                if (canCall) {
                  List<Date> selDates = [];
                  if (widget.model.selectType!.contains('one_time')) {
                    final tt = widget.model.prefrenceDataTime!.first;
                    selDates.add(Date(date: tt.date, session: tt.sessionID));
                  } else {
                    for (var j in widget.model.prefrenceDataTime!) {
                      for (var i in selectedDates) {
                        if (checkDate(i, j.date!)) {
                          selDates
                              .add(Date(date: j.date, session: j.sessionID));
                        }
                      }
                    }
                  }
                  bookingBloc.add(BookingEvent.addBooking(
                      AddBookingModel(dates: selDates)));
                } else {
                  context.router.pop();
                }
              },
            )
          ],
        ),
      );

  bool checkDate(DateTime d1, DateTime d2) {
    if (d1.year == d2.year && d1.month == d2.month && d1.day == d2.day) {
      return true;
    } else {
      return false;
    }
  }
}
