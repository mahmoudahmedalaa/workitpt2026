import 'package:workitpt/features/booking/data/model/booking_model.dart';
import 'package:workitpt/features/home/presentation/widgets/pending_payment_card.dart';

import '../../../../../core/export.dart';
import '../../../../../core/widgets/base_view.dart';
import '../../../core/constants/spacing.dart';

@RoutePage()
class PendingPaymentView extends StatefulWidget {
  final List<BookingModel> totalSessions;
  const PendingPaymentView({super.key, required this.totalSessions});

  @override
  State<PendingPaymentView> createState() => _PendingPaymentViewState();
}

class _PendingPaymentViewState extends State<PendingPaymentView> {
  @override
  Widget build(BuildContext context) => BaseView(
        padding: EdgeInsets.zero,
        titleText: 'Pending Payments',
        appBarColor: Colors.white,
        elevation: 0,
        body: Column(
          children: <Widget>[
            verticalMargin8,
            Expanded(
              child: ListView.builder(
                  itemCount: widget.totalSessions.length,
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (context, index) => PendingPaymentCard(
                        model: widget.totalSessions[index],
                      )),
            ),
          ],
        ).padding(horizontal: 16),
      );
}
