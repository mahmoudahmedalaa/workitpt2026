import 'package:workitpt/features/home/data/model/analytics_model.dart';

import '../../../../core/constants/spacing.dart';
import '../../../../core/export.dart';
import '../../../../core/widgets/base_view.dart';
import '../../data/model/sector.dart';
import '../widgets/analytics_item.dart';
import '../widgets/line_graph.dart';
import '../widgets/pie_chart.dart';
import '../widgets/title_drop_analytics.dart';

@RoutePage()
class AnalyticsView extends StatefulWidget {
  final AnalyticsModel model;
  const AnalyticsView({super.key, required this.model});

  @override
  State<AnalyticsView> createState() => _AnalyticsViewState();
}

class _AnalyticsViewState extends State<AnalyticsView> {
  final selectedActivity = TextEditingController(text: 'Weekly');

  @override
  Widget build(BuildContext context) => BaseView(
        elevation: 0,
        padding: allPadding24,
        appBarColor: Colors.white,
        titleText: 'Analytics',
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnalyticsItemWidget(
                isAnalyticsPage: true,
                model: widget.model,
              ),
              verticalMargin24,
              Container(
                padding: allPadding12,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                child: const LineGraphWidget(),
              ),
              verticalMargin12,
              Container(
                padding: allPadding12,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    TitleDropDownAnalyticsWidget(
                      selectedActivity: selectedActivity,
                      title: 'Income',
                    ),
                    verticalMargin16,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        PieChartWidget(
                          industrySectors,
                          income: widget.model.totalIncome!,
                        ).expanded(),
                        horizontalMargin12,
                        SizedBox(
                          // width: 40.w,
                          // height: 15.h,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: industrySectors
                                .map<Widget>(SectorRow.new)
                                .toList(),
                          ),
                        ).expanded(),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
  List<Sector> get industrySectors {
    return [
      Sector(
          color: Color(0xff1AB0B0),
          value: widget.model.totalIncome!.toDouble(),
          title: 'Total Income'),
      Sector(
          color: Color(0xffFF844B),
          value: widget.model.totalCustomer!.toDouble(),
          title: 'Total Customer'),
      Sector(
          color: Color(0xffF46081),
          value: widget.model.totalSession!.toDouble(),
          title: 'Past Sessions'),
      // Sector(color: Color(0xff7B61FF), value: 10, title: 'Withdrawn'),
    ];
  }
}
