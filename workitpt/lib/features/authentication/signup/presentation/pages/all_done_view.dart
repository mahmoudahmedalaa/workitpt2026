import 'package:sizer/sizer.dart';

import '../../../../../config/typography.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/export.dart';
import '../../../../../core/routes/app_router.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/base_view.dart';

@RoutePage()
class AllDoneView extends StatefulWidget {
  final String? image;
  final String? desc;
  final String role;

  const AllDoneView({super.key, this.desc, required this.role, this.image});

  @override
  State<AllDoneView> createState() => _AllDoneViewState();
}

class _AllDoneViewState extends State<AllDoneView> {
  @override
  Widget build(BuildContext context) => BaseView(
        hideAppBar: true,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 65.h,
              child: Image.asset(
                widget.image??Assets.icons.alldone.path,
                height: 100.w,
                width: 100.w,
              ),
            ),
            DescriptionWidget(
              desc: widget.desc,
            ),
            AppButton(
              onPressed: () {
                context.router.popAndPush(DashboardRoute(role: widget.role));
              },
              buttonText: 'Done',
              suffixWidget: const SizedBox(),
            ),
          ],
        ),
      );
}

class DescriptionWidget extends StatelessWidget {
  final String? desc;
  const DescriptionWidget({
    super.key,
    this.desc,
  });

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Text(
            'All Done',
            style: AppTextStyle.titleMDSemiBold,
          ),
          Text(
            desc ??
                'Congratulations! Your account has been successfully created',
            textAlign: TextAlign.center,
            style: AppTextStyle.bodyMDRegular.copyWith(color: darkText),
          ),
        ],
      );
}
