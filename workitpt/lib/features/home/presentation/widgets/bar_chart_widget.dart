import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../config/typography.dart';
import '../../../../core/constants/app_colors.dart';
import '../../data/model/price_point.dart';

class BarChartWidget extends StatefulWidget {
  const BarChartWidget({super.key, required this.points});

  final List<PricePoint> points;

  @override
  State<BarChartWidget> createState() => _BarChartWidgetState(points: points);
}

class _BarChartWidgetState extends State<BarChartWidget> {
  final List<PricePoint> points;

  _BarChartWidgetState({required this.points});

  @override
  Widget build(BuildContext context) => AspectRatio(
        aspectRatio: 2,
        child: BarChart(
          BarChartData(
            barGroups: _chartGroups(),
            borderData: FlBorderData(border: const Border()),
            gridData: const FlGridData(show: false),
            barTouchData: BarTouchData(
                enabled: true,
                touchTooltipData:
                    BarTouchTooltipData(tooltipBgColor: blackText)),
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(sideTitles: _bottomTitles),
              leftTitles:
                  const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              topTitles:
                  const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles:
                  const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            ),
          ),
        ),
      );

  List<BarChartGroupData> _chartGroups() => points
      .map((point) => BarChartGroupData(
              x: point.x.toInt(),
              // showingTooltipIndicators: points.map((e) => e.y.toInt()).toList(),
              barRods: [
                BarChartRodData(
                    toY: point.y,
                    color: buttonBG,
                    width: 30,
                    borderRadius: BorderRadius.circular(4)),
              ]))
      .toList();

  SideTitles get _bottomTitles => SideTitles(
        showTitles: true,
        getTitlesWidget: (value, meta) {
          var text = '';
          switch (value.toInt()) {
            case 1:
              text = 'Sun';
              break;
            case 2:
              text = 'Mon';
              break;
            case 3:
              text = 'Tue';
              break;
            case 4:
              text = 'Wed';
              break;
            case 5:
              text = 'Thu';
              break;
            case 6:
              text = 'Fri';
              break;
            case 7:
              text = 'Sat';
              break;
          }

          return Text(
            text,
            style: AppTextStyle.bodySMSemiBold.copyWith(color: darkText),
          );
        },
      );
}
