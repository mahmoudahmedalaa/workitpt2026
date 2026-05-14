import 'package:workitpt/config/typography.dart';
import 'package:workitpt/core/constants/spacing.dart';
import 'package:workitpt/core/routes/app_router.dart';
import 'package:workitpt/features/sessions/data/models/session_response_model.dart';

import '../../../../../core/export.dart';
import '../../../../../core/widgets/base_view.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/app_button.dart';

@RoutePage()
class CompletedSessionView extends StatefulWidget {
  final List<SessionResponseModel> completedSessions;

  const CompletedSessionView({super.key, required this.completedSessions});

  @override
  State<CompletedSessionView> createState() => _CompletedSessionViewState();
}

class _CompletedSessionViewState extends State<CompletedSessionView> {
  @override
  Widget build(BuildContext context) => BaseView(
        padding: EdgeInsets.zero,
        titleText: '',
        leading: SizedBox(),
        appBarColor: Colors.white,
        color: Colors.white,
        elevation: 0,
        body: Column(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  Assets.images.amico.path,
                ),
                verticalMargin20,
                Text(
                  'Congratulations, Your Session Has Been Completed!',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.subHeadLgRegular,
                ),
              ],
            ).padding(horizontal: 24).expanded(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AppButton(
                  buttonText: 'Rate Sessions',
                  suffixWidget: const SizedBox(),
                  onPressed: () {
                    context.router.push(
                      RatingListRoute(
                        completedSessions: widget.completedSessions,
                      ),
                    );
                  },
                ).expanded(),
                AppButton(
                  backgroundColor: colorLightGrey,
                  buttonText: 'Skip',
                  buttonWidth: ButtonWidth.small,
                  suffixWidget: const SizedBox(),
                  onPressed: () {
                    context.router.pop();
                  },
                ).expanded(),
              ],
            ),
          ],
        ),
      );
}
