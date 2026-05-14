import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/export.dart';
import '../../../../../core/widgets/base_view.dart';
import '../../../config/typography.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/injection/injection.dart';
import '../../../core/widgets/expandable_text.dart';
import '../../home/presentation/widgets/booked_widget.dart';
import '../../sessions/data/models/session_response_model.dart';
import '../../sessions/presentation/bloc/session_bloc.dart';

@RoutePage()
class BookingDetailsView extends StatefulWidget {
  final String id;

  const BookingDetailsView({super.key, required this.id});

  @override
  State<BookingDetailsView> createState() => _BookingDetailsViewState();
}

class _BookingDetailsViewState extends State<BookingDetailsView> {
  SessionResponseModel model = SessionResponseModel();
  SessionBloc sessionBloc;

  _BookingDetailsViewState() : sessionBloc = getIt<SessionBloc>();

  @override
  void initState() {
    sessionBloc.add(SessionEvent.viewSession(widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BaseView(
        padding: EdgeInsets.zero,
        titleText: 'Booking Details',
        appBarColor: Colors.white,
        elevation: 0,
        body: BlocProvider(
          create: (context) => sessionBloc,
          child: BlocBuilder<SessionBloc, SessionState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () => SizedBox(),
                onGetSessionDetailsSuccess: (model) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      verticalMargin8,
                      BookedWidget(
                        showDecoration: false,
                      ),
                      const Divider(
                        color: shadowColor,
                      ),
                      verticalMargin8,
                      const Text('Session Description:'),
                      verticalMargin4,
                      if (model.description == null ||
                          model.description!.isEmpty)
                        Text(
                          'No data provided.',
                          style: AppTextStyle.tinySMBold
                              .copyWith(color: colorLightGrey),
                        )
                      else
                        ExpandableText(
                          text: model.description ?? '',
                          trimLines: 6,
                        ),
                      const Text('What to Expect:'),
                      verticalMargin4,
                      if (model.whatToExpect == null ||
                          model.whatToExpect!.isEmpty)
                        Text(
                          'No data provided.',
                          style: AppTextStyle.tinySMBold
                              .copyWith(color: colorLightGrey),
                        )
                      else
                        ExpandableText(
                          text: model.whatToExpect ?? '',
                          trimLines: 6,
                        ),
                      const Text('Benefits:'),
                      verticalMargin4,
                      if (model.benefits == null || model.benefits!.isEmpty)
                        Text(
                          'No data provided.',
                          style: AppTextStyle.tinySMBold
                              .copyWith(color: colorLightGrey),
                        )
                      else
                        ExpandableText(
                          text: model.benefits ?? '',
                          trimLines: 6,
                        ),
                      const Text('What to Bring:'),
                      verticalMargin4,
                      if (model.whatToBring == null ||
                          model.whatToBring!.isEmpty)
                        Text(
                          'No data provided.',
                          style: AppTextStyle.tinySMBold
                              .copyWith(color: colorLightGrey),
                        )
                      else
                        ExpandableText(
                          text: model.whatToBring ?? '',
                          trimLines: 6,
                        ),
                    ],
                  ).padding(horizontal: 16);
                },
              );
            },
          ),
        ),
      );
}
