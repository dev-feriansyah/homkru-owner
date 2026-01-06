import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homekru_owner/shared/utils/common_utils.dart';
import 'package:homekru_owner/core/theme/app_colors.dart';
import 'package:homekru_owner/shared/widgets/custom_app_bar.dart';
import 'package:homekru_owner/shared/widgets/custom_text.dart';
import 'dart:math' as math;

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  String _selectedTimeframe = '7 Days';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final appColors = context.appColors;

    return Scaffold(
      backgroundColor: colorScheme.primaryContainer,
      appBar: const CustomCommonAppBar(title: "Analytics"),
      body: Stack(
        children: [
          bottomWaveWidget(),
          // Positioned(
          //   bottom: 0,
          //   left: 0,
          //   child: CustomImageView(
          //     imagePath: ImageConstant.backgroundImage2,
          //     height: 200,
          //   ),
          // ),
          Column(
            children: [
              // Timeframe Selector
              Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CText(
                      "Timeframe:",
                      size: 16.sp,
                      weight: FontWeight.w600,
                      color: colorScheme.onSurface,
                    ),
                    DropdownButton<String>(
                      value: _selectedTimeframe,
                      underline: SizedBox(),
                      items:
                          ['7 Days', '30 Days', '90 Days', '1 Year'].map((
                            String timeframe,
                          ) {
                            return DropdownMenuItem<String>(
                              value: timeframe,
                              child: CText(
                                timeframe,
                                size: 14.sp,
                                color: colorScheme.onSurface,
                              ),
                            );
                          }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedTimeframe = newValue!;
                        });
                      },
                    ),
                  ],
                ),
              ),

              // Tab Bar
              Container(
                color: Colors.white,
                child: TabBar(
                  controller: _tabController,
                  indicatorColor: colorScheme.primary,
                  indicatorWeight: 3,
                  labelColor: colorScheme.primary,
                  unselectedLabelColor: appColors.grey,
                  labelStyle: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  unselectedLabelStyle: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  tabs: [
                    Tab(text: "Overview"),
                    Tab(text: "Tasks"),
                    Tab(text: "Helpers"),
                  ],
                ),
              ),

              // Tab Content
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _buildOverviewTab(),
                    _buildTasksTab(),
                    _buildHelpersTab(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOverviewTab() {
    final colorScheme = Theme.of(context).colorScheme;
    final appColors = context.appColors;
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Key Metrics
          Row(
            children: [
              Expanded(
                child: _buildMetricCard(
                  "Total Tasks",
                  "1,247",
                  "+15%",
                  colorScheme.primary,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: _buildMetricCard(
                  "Completion Rate",
                  "94%",
                  "+3%",
                  appColors.successColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              Expanded(
                child: _buildMetricCard(
                  "Avg. Time",
                  "2.3h",
                  "-0.2h",
                  appColors.amber,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: _buildMetricCard(
                  "Efficiency",
                  "87%",
                  "+5%",
                  appColors.orangeDark,
                ),
              ),
            ],
          ),
          SizedBox(height: 24.h),

          // Performance Chart
          _buildPerformanceChart(),
          SizedBox(height: 24.h),

          // Trend Analysis
          _buildTrendAnalysis(),
        ],
      ),
    );
  }

  Widget _buildTasksTab() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Task Categories
          _buildTaskCategoryChart(),
          SizedBox(height: 24.h),

          // Task Completion Timeline
          _buildTaskTimeline(),
          SizedBox(height: 24.h),

          // Top Performing Tasks
          _buildTopTasks(),
        ],
      ),
    );
  }

  Widget _buildHelpersTab() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Helper Performance
          _buildHelperPerformance(),
          SizedBox(height: 24.h),

          // Helper Distribution
          _buildHelperDistribution(),
          SizedBox(height: 24.h),

          // Helper Ratings
          _buildHelperRatings(),
        ],
      ),
    );
  }

  Widget _buildMetricCard(
    String title,
    String value,
    String change,
    Color color,
  ) {
    final colorScheme = Theme.of(context).colorScheme;
    final appColors = context.appColors;

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            offset: Offset(0, 2),
            blurRadius: 10,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CText(
            title,
            size: 12.sp,
            color: appColors.grey,
            weight: FontWeight.w500,
          ),
          SizedBox(height: 8.h),
          CText(
            value,
            size: 24.sp,
            weight: FontWeight.bold,
            color: colorScheme.onSurface,
          ),
          SizedBox(height: 4.h),
          Row(
            children: [
              Icon(
                change.startsWith('+')
                    ? Icons.trending_up
                    : Icons.trending_down,
                size: 16.sp,
                color:
                    change.startsWith('+')
                        ? appColors.successColor
                        : colorScheme.error,
              ),
              SizedBox(width: 4.w),
              CText(
                change,
                size: 12.sp,
                color:
                    change.startsWith('+')
                        ? appColors.successColor
                        : colorScheme.error,
                weight: FontWeight.w600,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPerformanceChart() {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            offset: Offset(0, 2),
            blurRadius: 10,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CText(
            "Performance Trend",
            size: 18.sp,
            weight: FontWeight.bold,
            color: colorScheme.onSurface,
          ),
          SizedBox(height: 16.h),
          SizedBox(
            height: 200.h,
            child: CustomPaint(
              painter: LineChartPainter(primaryColor: colorScheme.primary),
              size: Size.infinite,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTrendAnalysis() {
    final colorScheme = Theme.of(context).colorScheme;
    final appColors = context.appColors;
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            offset: Offset(0, 2),
            blurRadius: 10,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CText(
            "Trend Analysis",
            size: 18.sp,
            weight: FontWeight.bold,
            color: colorScheme.onSurface,
          ),
          SizedBox(height: 16.h),
          _buildTrendItem(
            "Task completion rate is improving",
            Icons.trending_up,
            appColors.successColor,
          ),
          _buildTrendItem(
            "Average task time is decreasing",
            Icons.trending_down,
            colorScheme.primary,
          ),
          _buildTrendItem(
            "Helper satisfaction is stable",
            Icons.trending_flat,
            appColors.amber,
          ),
        ],
      ),
    );
  }

  Widget _buildTrendItem(String text, IconData icon, Color color) {
    final colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        children: [
          Icon(icon, color: color, size: 20.sp),
          SizedBox(width: 12.w),
          Expanded(
            child: CText(text, size: 14.sp, color: colorScheme.onSurface),
          ),
        ],
      ),
    );
  }

  Widget _buildTaskCategoryChart() {
    final colorScheme = Theme.of(context).colorScheme;
    final appColors = context.appColors;
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            offset: Offset(0, 2),
            blurRadius: 10,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CText(
            "Task Categories",
            size: 18.sp,
            weight: FontWeight.bold,
            color: colorScheme.onSurface,
          ),
          SizedBox(height: 16.h),
          SizedBox(
            height: 200.h,
            child: CustomPaint(
              painter: PieChartPainter(
                primaryColor: colorScheme.primary,
                successColor: appColors.successColor,
                amberColor: appColors.amber,
              ),
              size: Size.infinite,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTaskTimeline() {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            offset: Offset(0, 2),
            blurRadius: 10,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CText(
            "Task Completion Timeline",
            size: 18.sp,
            weight: FontWeight.bold,
            color: colorScheme.onSurface,
          ),
          SizedBox(height: 16.h),
          SizedBox(
            height: 150.h,
            child: CustomPaint(
              painter: BarChartPainter(primaryColor: colorScheme.primary),
              size: Size.infinite,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopTasks() {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            offset: Offset(0, 2),
            blurRadius: 10,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CText(
            "Top Performing Tasks",
            size: 18.sp,
            weight: FontWeight.bold,
            color: colorScheme.onSurface,
          ),
          SizedBox(height: 16.h),
          _buildTaskItem("Kitchen Cleaning", "98%", "2.1h avg"),
          _buildTaskItem("Living Room", "95%", "1.8h avg"),
          _buildTaskItem("Bathroom", "92%", "2.5h avg"),
          _buildTaskItem("Bedroom", "89%", "1.5h avg"),
        ],
      ),
    );
  }

  Widget _buildTaskItem(String task, String completion, String time) {
    final colorScheme = Theme.of(context).colorScheme;
    final appColors = context.appColors;
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CText(
            task,
            size: 14.sp,
            color: colorScheme.onSurface,
            weight: FontWeight.w500,
          ),
          Row(
            children: [
              CText(
                completion,
                size: 12.sp,
                color: appColors.successColor,
                weight: FontWeight.w600,
              ),
              SizedBox(width: 16.w),
              CText(time, size: 12.sp, color: appColors.grey),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHelperPerformance() {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            offset: Offset(0, 2),
            blurRadius: 10,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CText(
            "Helper Performance",
            size: 18.sp,
            weight: FontWeight.bold,
            color: colorScheme.onSurface,
          ),
          SizedBox(height: 16.h),
          _buildHelperItem("Maria Johnson", "4.8", "156 tasks"),
          _buildHelperItem("John Smith", "4.6", "142 tasks"),
          _buildHelperItem("Sarah Wilson", "4.5", "128 tasks"),
          _buildHelperItem("Mike Brown", "4.3", "115 tasks"),
        ],
      ),
    );
  }

  Widget _buildHelperItem(String name, String rating, String tasks) {
    final colorScheme = Theme.of(context).colorScheme;
    final appColors = context.appColors;
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20.r,
            backgroundColor: colorScheme.primary.withValues(alpha: 0.1),
            child: CText(
              name[0],
              size: 16.sp,
              color: colorScheme.primary,
              weight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CText(
                  name,
                  size: 14.sp,
                  color: colorScheme.onSurface,
                  weight: FontWeight.w600,
                ),
                CText(tasks, size: 12.sp, color: appColors.grey),
              ],
            ),
          ),
          Row(
            children: [
              Icon(Icons.star, color: appColors.amber, size: 16.sp),
              SizedBox(width: 4.w),
              CText(
                rating,
                size: 14.sp,
                color: colorScheme.onSurface,
                weight: FontWeight.w600,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHelperDistribution() {
    final colorScheme = Theme.of(context).colorScheme;
    final appColors = context.appColors;
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            offset: Offset(0, 2),
            blurRadius: 10,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CText(
            "Helper Distribution",
            size: 18.sp,
            weight: FontWeight.bold,
            color: colorScheme.onSurface,
          ),
          SizedBox(height: 16.h),
          SizedBox(
            height: 200.h,
            child: CustomPaint(
              painter: HelperDistributionPainter(
                primaryColor: colorScheme.primary,
                successColor: appColors.successColor,
              ),
              size: Size.infinite,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHelperRatings() {
    final colorScheme = Theme.of(context).colorScheme;
    final appColors = context.appColors;
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            offset: Offset(0, 2),
            blurRadius: 10,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CText(
            "Helper Ratings",
            size: 18.sp,
            weight: FontWeight.bold,
            color: colorScheme.onSurface,
          ),
          SizedBox(height: 16.h),
          _buildRatingBar("5 Stars", 85, appColors.successColor),
          _buildRatingBar("4 Stars", 12, colorScheme.primary),
          _buildRatingBar("3 Stars", 2, appColors.amber),
          _buildRatingBar("2 Stars", 1, appColors.orangeDark),
          _buildRatingBar("1 Star", 0, colorScheme.error),
        ],
      ),
    );
  }

  Widget _buildRatingBar(String label, int percentage, Color color) {
    final colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        children: [
          SizedBox(
            width: 60.w,
            child: CText(label, size: 12.sp, color: colorScheme.onSurface),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Container(
              height: 8.h,
              decoration: BoxDecoration(
                color: colorScheme.outlineVariant,
                borderRadius: BorderRadius.circular(4.r),
              ),
              child: FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: percentage / 100,
                child: Container(
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 8.w),
          CText(
            "$percentage%",
            size: 12.sp,
            color: colorScheme.onSurface,
            weight: FontWeight.w600,
          ),
        ],
      ),
    );
  }
}

// Custom Painters for Charts
class LineChartPainter extends CustomPainter {
  final Color primaryColor;

  LineChartPainter({required this.primaryColor});

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = primaryColor
          ..strokeWidth = 2
          ..style = PaintingStyle.stroke;

    final path = Path();
    final points = [
      Offset(0, size.height * 0.8),
      Offset(size.width * 0.2, size.height * 0.6),
      Offset(size.width * 0.4, size.height * 0.4),
      Offset(size.width * 0.6, size.height * 0.3),
      Offset(size.width * 0.8, size.height * 0.2),
      Offset(size.width, size.height * 0.1),
    ];

    path.moveTo(points[0].dx, points[0].dy);
    for (int i = 1; i < points.length; i++) {
      path.lineTo(points[i].dx, points[i].dy);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class PieChartPainter extends CustomPainter {
  final Color primaryColor;
  final Color successColor;
  final Color amberColor;

  PieChartPainter({
    required this.primaryColor,
    required this.successColor,
    required this.amberColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width, size.height) / 2 - 20;

    final paint = Paint()..style = PaintingStyle.fill;

    // Draw pie slices
    paint.color = primaryColor;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      math.pi * 0.4,
      true,
      paint,
    );

    paint.color = successColor;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2 + math.pi * 0.4,
      math.pi * 0.3,
      true,
      paint,
    );

    paint.color = amberColor;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2 + math.pi * 0.7,
      math.pi * 0.3,
      true,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class BarChartPainter extends CustomPainter {
  final Color primaryColor;

  BarChartPainter({required this.primaryColor});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = primaryColor;

    final barWidth = size.width / 7;
    final maxHeight = size.height - 20;

    for (int i = 0; i < 7; i++) {
      final height = maxHeight * (0.3 + (i * 0.1));
      final x = i * barWidth + barWidth * 0.2;
      final y = size.height - height;

      canvas.drawRect(Rect.fromLTWH(x, y, barWidth * 0.6, height), paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class HelperDistributionPainter extends CustomPainter {
  final Color primaryColor;
  final Color successColor;

  HelperDistributionPainter({
    required this.primaryColor,
    required this.successColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width, size.height) / 2 - 20;

    // Draw donut chart
    paint.color = primaryColor;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      math.pi * 0.6,
      true,
      paint,
    );

    paint.color = successColor;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2 + math.pi * 0.6,
      math.pi * 0.4,
      true,
      paint,
    );

    // Draw inner circle
    paint.color = Colors.white;
    canvas.drawCircle(center, radius * 0.6, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
