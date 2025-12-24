import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:homekru_owner/theme/theme_helper.dart';
import 'package:homekru_owner/shared/widgets/custom_text.dart';

class TaskDistributionData {
  final String name;
  final double percentage;
  final Color color;

  TaskDistributionData({
    required this.name,
    required this.percentage,
    required this.color,
  });
}

class TaskDistributionChart extends StatefulWidget {
  const TaskDistributionChart({super.key});

  @override
  State<TaskDistributionChart> createState() => _TaskDistributionChartState();
}

class _TaskDistributionChartState extends State<TaskDistributionChart> {
  late List<TaskDistributionData> _chartData;
  String? _selectedSegment;
  String? _selectedPercentage;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    super.initState();
    _chartData = [
      TaskDistributionData(
        name: 'Rina',
        percentage: 60,
        color: appTheme.primaryColor,
      ),
      TaskDistributionData(name: 'Budi', percentage: 25, color: appTheme.grey),
      TaskDistributionData(
        name: 'Siti',
        percentage: 15,
        color: appTheme.veryLightGrey,
      ),
    ];
    // Set default selected segment to the largest one
    _selectedSegment = _chartData.first.name;
    _selectedPercentage = '${_chartData.first.percentage.toInt()}%';

    _tooltipBehavior = TooltipBehavior(
      enable: true,
      format: 'point.x : point.y%',
      color: Colors.black87,
      textStyle: TextStyle(
        color: Colors.white,
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, 2),
            blurRadius: 10,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        children: [
          // Yellow accent bar
          Container(
            width: 4.w,
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                bottomLeft: Radius.circular(16.r),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                children: [
                  // Top section with chart and legend
                  Row(
                    children: [
                      // Donut Chart
                      SizedBox(
                        width: 80.w,
                        height: 80.h,
                        child: SfCircularChart(
                          tooltipBehavior: _tooltipBehavior,
                          series: <
                            DoughnutSeries<TaskDistributionData, String>
                          >[
                            DoughnutSeries<TaskDistributionData, String>(
                              dataSource: _chartData,
                              xValueMapper:
                                  (TaskDistributionData data, _) => data.name,
                              yValueMapper:
                                  (TaskDistributionData data, _) =>
                                      data.percentage,
                              pointColorMapper:
                                  (TaskDistributionData data, _) => data.color,
                              innerRadius: '60%',
                              dataLabelSettings: const DataLabelSettings(
                                isVisible: false,
                              ),
                              onPointTap: (ChartPointDetails details) {
                                setState(() {
                                  _selectedSegment =
                                      details.pointIndex != null
                                          ? _chartData[details.pointIndex!].name
                                          : _chartData.first.name;
                                  _selectedPercentage =
                                      details.pointIndex != null
                                          ? '${_chartData[details.pointIndex!].percentage.toInt()}%'
                                          : '${_chartData.first.percentage.toInt()}%';
                                });
                              },
                            ),
                          ],
                          annotations: <CircularChartAnnotation>[
                            CircularChartAnnotation(
                              widget: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CText(
                                      _selectedPercentage ?? '60%',
                                      size: 12.sp,
                                      weight: FontWeight.bold,
                                      color: appTheme.textPrimary,
                                    ),
                                    CText(
                                      _selectedSegment ?? 'Rina',
                                      size: 10.sp,
                                      weight: FontWeight.w600,
                                      color: appTheme.textPrimary,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 16.w),
                      // Legend
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:
                              _chartData.map((data) {
                                return Padding(
                                  padding: EdgeInsets.only(bottom: 8.h),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 12.w,
                                        height: 12.h,
                                        decoration: BoxDecoration(
                                          color: data.color,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      SizedBox(width: 8.w),
                                      CText(
                                        data.name,
                                        size: 12.sp,
                                        color: appTheme.grey,
                                        weight: FontWeight.w500,
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  // Bottom section with text
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CText(
                        "Task Distribution",
                        size: 16.sp,
                        weight: FontWeight.bold,
                        color: appTheme.textPrimary,
                      ),
                      SizedBox(height: 4.h),
                      CText(
                        "Completed By Helper",
                        size: 12.sp,
                        color: appTheme.grey,
                        weight: FontWeight.w500,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
