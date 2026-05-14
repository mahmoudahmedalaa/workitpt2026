import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workitpt/core/export.dart';
import 'package:workitpt/features/home/data/model/activity_model.dart';
import 'package:workitpt/features/home/presentation/bloc/home_bloc.dart';

import '../../../../config/typography.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/spacing.dart';
import '../../../../core/injection/injection.dart';

class LineGraphWidget extends StatefulWidget {
  const LineGraphWidget({super.key});

  @override
  State<LineGraphWidget> createState() => _LineGraphWidgetState();
}

class _LineGraphWidgetState extends State<LineGraphWidget> {
  HomeBloc homeBloc;

  _LineGraphWidgetState() : homeBloc = getIt<HomeBloc>();

  @override
  void initState() {
    homeBloc.add(HomeEvent.getUserActivity());
    super.initState();
  }

  String selectedOccurance = 'Weekly';
  final occurenceItems = [
    'Weekly',
    // 'Monthly',
  ];

  List<FlSpot> generateList(List<ActivityModel> list) {
    final List<FlSpot> acList = [];
    for (int i = 0; i < list.length; i++) {
      acList.add(FlSpot(i.toDouble(), list[i].total!.toDouble()));
    }
    return acList;
  }

  double findMaxSession(List<ActivityModel> list) {
    if (list.isEmpty) {
      return 0.0;
    }
    double maxPrice = list.first.total!.toDouble();
    for (var model in list) {
      if (model.total!.toDouble() > maxPrice) {
        maxPrice = model.total!.toDouble();
      }
    }
    return maxPrice;
  }

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Activity',
                style: AppTextStyle.headlineSMSemiBold,
              ),
              Container(
                // height: 40,
                padding: allPadding8,
                decoration: BoxDecoration(
                  color: filterExpansionBG,
                  borderRadius: BorderRadius.circular(5),
                ),
                // child: DropdownButton(
                //   elevation: 0,
                //   underline: const SizedBox(),
                //   value: selectedOccurance,
                //   style: AppTextStyle.bodySMMedium.copyWith(color: darkText),
                //   icon: const Icon(
                //     Icons.keyboard_arrow_down,
                //     color: darkText,
                //   ),
                //   items: occurenceItems
                //       .map((items) => DropdownMenuItem(
                //             value: items,
                //             child: Text(items),
                //           ))
                //       .toList(),
                //   onChanged: (newValue) {
                //     setState(() {
                //       selectedOccurance = newValue!;
                //     });
                //   },
                // ),
                child: Text(
                  'Weekly',
                  style: AppTextStyle.bodySMMedium.copyWith(color: darkText),
                ).padding(horizontal: 4),
              ),
            ],
          ),
          verticalMargin24,
          AspectRatio(
            aspectRatio: 2,
            child: BlocProvider(
              create: (context) => homeBloc,
              child: BlocConsumer<HomeBloc, HomeState>(
                listener: (context, state) {
                  state.whenOrNull(
                    onLoading: () => CupertinoActivityIndicator(),
                  );
                },
                builder: (context, state) {
                  return state.maybeWhen(
                      orElse: () => SizedBox(),
                      onGetUserActivitySuccess: (model) {
                        return LineChart(
                          LineChartData(
                            lineBarsData: [
                              LineChartBarData(
                                  // spots: selectedOccurance.contains('Weekly')
                                  //     ? generateList(model)
                                  //     : generateList(model),
                                  spots: generateList(model),
                                  isCurved: true,
                                  barWidth: 8,
                                  preventCurveOverShooting: true,
                                  isStrokeCapRound: true,
                                  dotData: const FlDotData(show: false),
                                  color: colorPrimary)
                            ],
                            maxY: findMaxSession(model) + 1,
                            borderData: FlBorderData(show: false),
                            gridData: FlGridData(
                                show: true,
                                horizontalInterval: 1,
                                verticalInterval: 1,
                                getDrawingHorizontalLine: (value) =>
                                    const FlLine(
                                        color: darkText,
                                        strokeWidth: 1,
                                        dashArray: [2]),
                                getDrawingVerticalLine: (value) => const FlLine(
                                      color: darkText,
                                      strokeWidth: 1,
                                      dashArray: [2],
                                    ),
                                checkToShowVerticalLine: (value) => true,
                                checkToShowHorizontalLine: (value) => true,
                                drawHorizontalLine: true,
                                drawVerticalLine: true),
                            lineTouchData: LineTouchData(
                              enabled: true,
                              touchTooltipData: LineTouchTooltipData(
                                tooltipBgColor: colorPrimary,
                                tooltipRoundedRadius: 4,
                                showOnTopOfTheChartBoxArea: true,
                                fitInsideHorizontally: true,
                                tooltipMargin: 0,
                                getTooltipItems: (touchedSpots) => touchedSpots
                                    .map(
                                      (touchedSpot) => LineTooltipItem(
                                        model[touchedSpot.spotIndex]
                                            .total!
                                            .toStringAsFixed(0),
                                        AppTextStyle.tinySMBold
                                            .copyWith(color: Colors.white),
                                      ),
                                    )
                                    .toList(),
                              ),
                              getTouchedSpotIndicator: (barData, indicators) =>
                                  indicators
                                      .map(
                                        (index) =>
                                            const TouchedSpotIndicatorData(
                                          FlLine(
                                              color: colorPrimary,
                                              strokeWidth: 1,
                                              dashArray: [8]),
                                          FlDotData(show: true),
                                        ),
                                      )
                                      .toList(),
                            ),
                            titlesData: FlTitlesData(
                              show: true,
                              bottomTitles: AxisTitles(
                                  sideTitles:
                                      selectedOccurance.contains('Weekly')
                                          ? _weekTitles
                                          : _monthTitles),
                              leftTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                      showTitles: true,
                                      interval: 1,
                                      reservedSize: 36,
                                      getTitlesWidget: (value, meta) => Text(
                                            '${value.toInt()}',
                                            style: AppTextStyle.tinySMRegular,
                                          ))),
                              topTitles: const AxisTitles(
                                  sideTitles: SideTitles(showTitles: false)),
                              rightTitles: const AxisTitles(
                                  sideTitles: SideTitles(showTitles: false)),
                            ),
                          ),
                        );
                      });
                },
              ),
            ),
          ),
        ],
      );

  SideTitles get _weekTitles => SideTitles(
        showTitles: true,
        interval: 1,
        getTitlesWidget: (value, meta) {
          var text = '';
          switch (value.toInt()) {
            case 0:
              text = 'Sun';
              break;
            case 1:
              text = 'Mon';
              break;
            case 2:
              text = 'Tue';
              break;
            case 3:
              text = 'Wed';
              break;
            case 4:
              text = 'Thu';
              break;
            case 5:
              text = 'Fri';
              break;
            case 6:
              text = 'Sat';
              break;
          }

          return Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              text,
              style: AppTextStyle.bodySMSemiBold.copyWith(color: darkText),
            ),
          );
        },
      );

  SideTitles get _monthTitles => SideTitles(
        showTitles: true,
        interval: 1,
        getTitlesWidget: (value, meta) {
          var text = '';
          switch (value.toInt()) {
            case 0:
              text = 'week 1';
              break;
            case 1:
              text = 'week 2';
              break;
            case 2:
              text = 'week 3';
              break;
            case 3:
              text = 'week 4';
              break;
            case 4:
              text = 'week 5';
              break;
          }
          return Padding(
            padding: const EdgeInsets.only(top: 4, left: 24),
            child: Text(
              text,
              style: AppTextStyle.bodySMSemiBold.copyWith(color: darkText),
            ),
          );
        },
      );
}
