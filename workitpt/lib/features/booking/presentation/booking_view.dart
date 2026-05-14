import 'package:workitpt/features/booking/data/model/booking_model.dart';

import '../../../../../core/export.dart';
import '../../../../../core/widgets/base_view.dart';
import '../../../config/typography.dart';
import '../../../core/constants/spacing.dart';
import '../../sessions/presentation/widgets/filter_icon_button.dart';
import 'widgets/booking_filter.dart';
import 'widgets/booking_widget.dart';

@RoutePage()
class BookingView extends StatefulWidget {
  const BookingView({super.key});

  @override
  State<BookingView> createState() => _BookingViewState();
}

class _BookingViewState extends State<BookingView> {
  Widget headerWidget(VoidCallback onPressed) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'All Bookings',
            style: AppTextStyle.subHeadLgSemiBold,
          ),
          FilterIconButton(
            icon: Assets.images.filter.path,
            onPressed: onPressed,
          )
        ],
      );

  @override
  Widget build(BuildContext context) => BaseView(
        padding: EdgeInsets.zero,
        titleText: 'Bookings',
        appBarColor: Colors.white,
        elevation: 0,
        body: Column(
          children: <Widget>[
            verticalMargin8,
            headerWidget(() {
              showModalBottomSheet<void>(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(25)),
                  ),
                  builder: (context) => const BookingFilter());
            }),
            verticalMargin8,
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                itemBuilder: (context, index) => BookingCardWidget(
                  model: BookingModel(),
                ),
              ),
            ),
          ],
        ).padding(horizontal: 16),
      );
}
