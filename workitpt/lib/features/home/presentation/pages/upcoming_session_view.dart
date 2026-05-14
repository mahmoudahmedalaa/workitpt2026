import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workitpt/features/booking/data/model/booking_model.dart';
import 'package:workitpt/features/booking/presentation/bloc/booking_bloc.dart';
import 'package:workitpt/features/booking/presentation/widgets/booking_widget.dart';

import '../../../../core/constants/spacing.dart';
import '../../../../core/export.dart';
import '../../../../core/injection/injection.dart';
import '../../../../core/widgets/base_view.dart';

@RoutePage()
class UpcomingSessionView extends StatefulWidget {
  const UpcomingSessionView({super.key});

  @override
  State<UpcomingSessionView> createState() => _UpcomingSessionViewState();
}

class _UpcomingSessionViewState extends State<UpcomingSessionView> {
  List<BookingModel> sessionList = [];
  BookingBloc bookingBloc;

  _UpcomingSessionViewState() : bookingBloc = getIt<BookingBloc>();
  @override
  void initState() {
    bookingBloc.add(const BookingEvent.getUpcomingBookings());
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BaseView(
      elevation: 0,
      padding: EdgeInsets.zero,
      appBarColor: Colors.white,
      titleText: 'My Upcoming Bookings',
      body: BlocProvider<BookingBloc>(
        create: (context) => bookingBloc,
        child: BlocListener<BookingBloc, BookingState>(
          listener: (context, state) {
            state.whenOrNull(
              onLoading: EasyLoading.show,
              onGetUpcomingBookingsSuccess: (sessions) {
                EasyLoading.dismiss();
                setState(() {
                  sessionList = sessions;
                });
              },
              onFailure: (error) {
                EasyLoading.showError(error ?? '');
              },
            );
          },
          child: ListView.builder(
            padding: allPadding16,
            physics: const AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: sessionList.length,
            itemBuilder: (context, index) => BookingCardWidget(
              model: sessionList[index],
            ),
          ),
        ),
      ));
}
