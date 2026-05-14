import 'package:sizer/sizer.dart';
import 'package:workitpt/features/home/data/model/analytics_model.dart';
import '../../../../config/typography.dart';
import '../../../../core/constants/spacing.dart';
import '../../../../core/export.dart';

class AnalyticsItemWidget extends StatefulWidget {
  final bool isAnalyticsPage;
   final AnalyticsModel model;

   AnalyticsItemWidget({super.key, this.isAnalyticsPage = false,required this.model});

  @override
  State<AnalyticsItemWidget> createState() => _AnalyticsItemWidgetState();
}

class _AnalyticsItemWidgetState extends State<AnalyticsItemWidget> {

  List<Widget> analyticsList(AnalyticsModel model){
    return [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              Image.asset(Assets.images.income.path),
              horizontalMargin8,
              Text(
                'Total Income',
                style:
                AppTextStyle.subHeadLgSemiBold.copyWith(color: Colors.white),
              ),
            ],
          ),
          Text(
            '\$${model.totalIncome??0}',
            style: AppTextStyle.titleMDSemiBold.copyWith(color: Colors.white),
          ),
        ],
      )
          .padding(all: 16)
          .decorated(
        color: Colors.lightBlueAccent,
        borderRadius: BorderRadius.circular(10),
      )
          .width(((246 / 375) * 100).w),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              Image.asset(Assets.images.grpUser.path),
              horizontalMargin8,
              Text(
                'Total Customers',
                style:
                AppTextStyle.subHeadLgSemiBold.copyWith(color: Colors.white),
              ),
            ],
          ),
          Text(
           '${model.totalCustomer??0}',
            style: AppTextStyle.titleMDSemiBold.copyWith(color: Colors.white),
          ),
        ],
      )
          .padding(all: 16)
          .decorated(
        color: Colors.deepOrangeAccent,
        borderRadius: BorderRadius.circular(10),
      )
          .width(((246 / 375) * 100).w),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              Image.asset(Assets.images.grpUser.path),
              horizontalMargin8,
              Text(
                'Past Session',
                style:
                AppTextStyle.subHeadLgSemiBold.copyWith(color: Colors.white),
              ),
            ],
          ),
          Text(
            '${model.totalSession??0}',
            style: AppTextStyle.titleMDSemiBold.copyWith(color: Colors.white),
          ),
        ],
      )
          .padding(all: 16)
          .decorated(
        color: Colors.pinkAccent,
        borderRadius: BorderRadius.circular(10),
      )
          .width(((246 / 375) * 100).w),
    ];
  }
  List<Widget> analyticsList2(AnalyticsModel model){
    return [
      Container(
        padding: allPadding16,
        decoration: BoxDecoration(
          color: Colors.lightBlueAccent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Image.asset(
                  Assets.images.income.path,
                  height: 16,
                  width: 16,
                ),
                horizontalMargin8,
                Text(
                  'Total Income',
                  style: AppTextStyle.tinySMSemiBold
                      .copyWith(color: Colors.white, fontSize: 11),
                ),
              ],
            ),
            Text(
              '\$${model.totalIncome??0}',
              style: AppTextStyle.subHeadLgSemiBold.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
      Container(
        padding: allPadding16,
        decoration: BoxDecoration(
          color: Colors.deepOrangeAccent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Image.asset(Assets.images.grpUser.path, height: 16, width: 16),
                horizontalMargin8,
                Text(
                  'Total Customers',
                  style: AppTextStyle.tinySMSemiBold
                      .copyWith(color: Colors.white, fontSize: 11),
                ),
              ],
            ),
            Text(
              '${model.totalCustomer??0}',
              style: AppTextStyle.subHeadLgSemiBold.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
      Container(
        padding: allPadding16,
        decoration: BoxDecoration(
          color: Colors.pinkAccent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Image.asset(Assets.images.grpUser.path, height: 16, width: 16),
                horizontalMargin8,
                Text(
                  'Past Session',
                  style: AppTextStyle.tinySMSemiBold
                      .copyWith(color: Colors.white, fontSize: 11),
                ),
              ],
            ),
            Text(
              '${model.totalSession??0}',
              style: AppTextStyle.subHeadLgSemiBold.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) => widget.isAnalyticsPage
      ? SizedBox(
          height: 25.h,
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 163 / 80,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
            ),
            physics: const AlwaysScrollableScrollPhysics(),
            children: analyticsList2(widget.model),
          ),
        )
      : SizedBox(
          height: ((150 / 888) * 100).h,
          child: ListView.separated(
            physics: const AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) => analyticsList(widget.model)[index],
            separatorBuilder: (ctx, index) => horizontalMargin24,
          ),
        );
}
