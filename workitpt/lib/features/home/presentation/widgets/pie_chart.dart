import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../config/typography.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/spacing.dart';
import '../../data/model/sector.dart';

class PieChartWidget extends StatelessWidget {
  final List<Sector> sectors;
  final int income;

  const PieChartWidget(this.sectors, {super.key,required this.income});

  @override
  Widget build(BuildContext context) => Container(
        height: 25.h,
        width: 40.w,
        child: Stack(
          children: [
            PieChart(
                PieChartData(
                  sections: _chartSections(sectors),
                  sectionsSpace: 0,
                  centerSpaceColor: lightPrimary,
                  centerSpaceRadius: 48,
                ),
                swapAnimationDuration: const Duration(milliseconds: 500)),
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Income',
                    style:
                        AppTextStyle.bodySMSemiBold.copyWith(color: darkText),
                  ),
                  Text(
                    '\$$income',
                    style:
                        AppTextStyle.headlineSMXBold.copyWith(color: blackText),
                  ),
                ],
              ),
            )
          ],
        ),
      );

  List<PieChartSectionData> _chartSections(List<Sector> sectors) {
    final list = <PieChartSectionData>[];
    for (final sector in sectors) {
      const radius = 32;
      final data = PieChartSectionData(
        color: sector.color,
        value: sector.value,
        radius: radius.toDouble(),
        title: '',
      );
      list.add(data);
    }
    return list;
  }
}

class SectorRow extends StatelessWidget {
  const SectorRow(this.sector, {super.key});
  final Sector sector;

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                width: 8,
                child: CircleAvatar(
                  backgroundColor: sector.color,
                ),
              ),
              horizontalMargin8,
              Text(
                sector.title,
                style: AppTextStyle.bodySMRegular,
              ),
            ],
          ),
          Text(
            '\$${sector.value.toInt()}',
            style: AppTextStyle.bodySMMedium.copyWith(color: darkText),
          ),
        ],
      );
}
