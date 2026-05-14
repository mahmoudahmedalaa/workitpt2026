import 'package:workitpt/config/typography.dart';
import 'package:workitpt/core/constants/spacing.dart';
import 'package:workitpt/core/routes/app_router.dart';
import 'package:workitpt/features/sessions/data/models/session_response_model.dart';
import 'package:workitpt/features/sessions/presentation/widgets/session_card_widget.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/export.dart';
import '../../../../../core/widgets/base_view.dart';

@RoutePage()
class RatingListView extends StatefulWidget {
  final List<SessionResponseModel> completedSessions;

  const RatingListView({super.key, required this.completedSessions});

  @override
  State<RatingListView> createState() => _RatingListViewState();
}

class _RatingListViewState extends State<RatingListView> {
  @override
  Widget build(BuildContext context) => BaseView(
        padding: EdgeInsets.zero,
        titleText: 'Completed Sessions',
        appBarColor: Colors.white,
        color: Colors.white,
        elevation: 0,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            verticalMargin24,
            Text('Rate your sessions', style: AppTextStyle.bodyMDBold),
            verticalMargin12,
            ...List.generate(
              widget.completedSessions.length,
              (index) => Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 5,
                      offset: const Offset(0, 4),
                      spreadRadius: 3,
                    )
                  ],
                  borderRadius: BorderRadius.circular(8),
                ),
                margin: EdgeInsets.only(right: 8, left: 8, bottom: 8),
                padding: EdgeInsets.all(8),
                child: Column(
                  children: <Widget>[
                    SessionCardWidget(
                      model: widget.completedSessions[index],
                      isPressed: () {},
                    ),
                    InkWell(
                      onTap: () {
                        context.router.replace(
                          RatingRoute(
                            session: widget.completedSessions[index],
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                            color: lightPrimary,
                            border: Border.all(color: colorPrimary, width: 1),
                            borderRadius: BorderRadius.circular(6)),
                        child: Text(
                          'Rate Session',
                          style: AppTextStyle.tinySMRegular
                              .copyWith(color: colorPrimary),
                        ),
                      ),
                    ).alignment(Alignment.bottomRight),
                    verticalMargin8,
                  ],
                ),
              ),
            ),
          ],
        ).padding(horizontal: 12).scrollable(),
      );
}
