import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homekru_owner/core/constants/image_constant.dart';
import 'package:homekru_owner/core/theme/app_colors.dart';
import 'package:homekru_owner/shared/widgets/custom_image_view.dart';
import 'package:homekru_owner/shared/widgets/custom_text.dart';
import 'dart:math' as math;

class HouseholdStatsDashboard extends StatelessWidget {
  const HouseholdStatsDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CText(
            "Household Stats",
            size: 18.sp,
            weight: FontWeight.bold,
            color: colorScheme.onSurface,
          ),
          SizedBox(height: 16.h),

          // Large Tasks Completed Card
          _buildTasksCompletedCard(context),
          SizedBox(height: 16.h),

          // Two row cards
          Row(
            children: [
              Expanded(
                child: _buildCircularProgressCard(
                  context,
                  "74%",
                  "Tasks Completed on time",
                  0.74,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: _buildCircularProgressCard(
                  context,
                  "45%",
                  "Redo Requests Over Total Tasks",
                  0.45,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),

          Row(
            children: [
              Expanded(
                child: _buildCircularProgressCard(
                  context,
                  "89%",
                  "On-Time Check-ins",
                  0.89,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(child: _buildTaskDistributionCard(context)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTasksCompletedCard(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final appColors = context.appColors;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            offset: Offset(0, 2),
            blurRadius: 10,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        children: [
          // Green accent bar
          Container(
            width: 4.w,
            height: 60.h,
            decoration: BoxDecoration(
              color: appColors.successLight,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(16.r),
                bottomRight: Radius.circular(16.r),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CText(
                              "320",
                              size: 22.sp,
                              weight: FontWeight.w600,
                              color: colorScheme.onSurface,
                            ),
                            SizedBox(height: 4.h),
                            CText(
                              "Tasks completed",
                              size: 16.sp,
                              color: colorScheme.onSurface,
                              weight: FontWeight.w500,
                            ),
                          ],
                        ),
                      ),
                      DottedBorder(
                        options: CircularDottedBorderOptions(
                          dashPattern: [8, 5],
                          strokeWidth: 2,
                          color: colorScheme.primary,
                          padding: EdgeInsets.all(0),
                        ),
                        child: Container(
                          width: 50.w,
                          height: 50.h,
                          decoration: BoxDecoration(
                            color: colorScheme.secondaryContainer,
                            shape: BoxShape.circle,
                            // border: Border.all(
                            //   color: appTheme.primaryColor.withValues(alpha: 0.3),
                            //   width: 2,
                            //   style: BorderStyle.solid,
                            // ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomImageView(
                              imagePath: ImageConstant.checkIcon,
                              height: 12,
                              width: 12,
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CText(
                        "100% Complete",
                        size: 10.sp,
                        color: colorScheme.onSurface,
                        weight: FontWeight.w500,
                      ),
                      CText(
                        "320 Tasks",
                        size: 10.sp,
                        color: appColors.grey,
                        weight: FontWeight.w400,
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  Container(
                    height: 8.h,
                    decoration: BoxDecoration(
                      color: colorScheme.outlineVariant,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: FractionallySizedBox(
                      alignment: Alignment.centerLeft,
                      widthFactor: 1.0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: colorScheme.primary,
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCircularProgressCard(
    BuildContext context,
    String percentage,
    String title,
    double progress,
  ) {
    final colorScheme = Theme.of(context).colorScheme;
    final appColors = context.appColors;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            offset: Offset(0, 2),
            blurRadius: 10,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Yellow accent bar
          Container(
            margin: EdgeInsets.only(top: 22),
            width: 4.w,
            height: 50.h,
            decoration: BoxDecoration(
              color: appColors.mediumYellow,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(16.r),
                bottomRight: Radius.circular(16.r),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 60.w,
                        height: 60.h,
                        child: Stack(
                          children: [
                            // Background circle
                            Container(
                              width: 60.w,
                              height: 60.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: colorScheme.outlineVariant,
                              ),
                            ),
                            // Progress arc
                            CustomPaint(
                              size: Size(60.w, 60.h),
                              painter: CircularProgressPainter(
                                progress: progress,
                                color: colorScheme.primary,
                                strokeWidth: 6,
                              ),
                            ),
                            // Center text
                            Center(
                              child: CText(
                                "100%",
                                size: 10.sp,
                                color: appColors.grey,
                                weight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CText(
                              percentage,
                              size: 24.sp,
                              weight: FontWeight.bold,
                              color: colorScheme.onSurface,
                            ),
                            SizedBox(height: 4.h),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  // Bottom section with text
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CText(
                        title,
                        size: 14.sp,
                        weight: FontWeight.bold,
                        color: colorScheme.onSurface,
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

  Widget _buildTaskDistributionCard(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final appColors = context.appColors;
    return Container(
      padding: EdgeInsetsDirectional.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            offset: Offset(0, 2),
            blurRadius: 10,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Yellow accent bar
          Container(
            margin: EdgeInsets.only(top: 22),
            width: 4.w,
            height: 50.h,
            decoration: BoxDecoration(
              color: appColors.mediumYellow,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(16.r),
                bottomRight: Radius.circular(16.r),
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
                      SizedBox(
                        width: 60.w,
                        height: 60.h,
                        child: Stack(
                          children: [
                            // Background circle
                            Container(
                              width: 60.w,
                              height: 60.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: colorScheme.outlineVariant,
                              ),
                            ),
                            // Donut chart with multiple segments
                            CustomPaint(
                              size: Size(60.w, 60.h),
                              painter: MultiSegmentDonutPainter(
                                segments: [
                                  {'value': 0.6, 'color': colorScheme.primary},
                                  {'value': 0.25, 'color': appColors.grey},
                                  {
                                    'value': 0.15,
                                    'color': colorScheme.outlineVariant,
                                  },
                                ],
                                strokeWidth: 8,
                              ),
                            ),
                            // Center text
                            Center(
                              child: CText(
                                "60%\nRina",
                                size: 8.sp,
                                color: colorScheme.onSurface,
                                weight: FontWeight.w600,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildLegendItem(
                              context,
                              "Rina",
                              colorScheme.primary,
                            ),
                            _buildLegendItem(context, "Budi", appColors.grey),
                            _buildLegendItem(
                              context,
                              "Siti",
                              colorScheme.outlineVariant,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  // Bottom section with text
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CText(
                        "Task Distribution",
                        size: 14.sp,
                        weight: FontWeight.bold,
                        color: colorScheme.onSurface,
                      ),
                      SizedBox(height: 4.h),
                      CText(
                        "Completed By Helper",
                        size: 12.sp,
                        color: appColors.grey,
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

  Widget _buildLegendItem(BuildContext context, String name, Color color) {
    final appColors = context.appColors;
    return Padding(
      padding: EdgeInsets.only(bottom: 4.h),
      child: Row(
        children: [
          Container(
            width: 8.w,
            height: 8.h,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          SizedBox(width: 6.w),
          CText(
            name,
            size: 10.sp,
            color: appColors.grey,
            weight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}

class CircularProgressPainter extends CustomPainter {
  final double progress;
  final Color color;
  final double strokeWidth;

  CircularProgressPainter({
    required this.progress,
    required this.color,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    final paint =
        Paint()
          ..color = color
          ..strokeWidth = strokeWidth
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round;

    final startAngle = -math.pi / 2; // Start from top
    final sweepAngle = 2 * math.pi * progress;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class DonutChartPainter extends CustomPainter {
  final double progress;
  final Color color;
  final double strokeWidth;

  DonutChartPainter({
    required this.progress,
    required this.color,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    final paint =
        Paint()
          ..color = color
          ..strokeWidth = strokeWidth
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round;

    final startAngle = -math.pi / 2; // Start from top
    final sweepAngle = 2 * math.pi * progress;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class MultiSegmentDonutPainter extends CustomPainter {
  final List<Map<String, dynamic>> segments;
  final double strokeWidth;

  MultiSegmentDonutPainter({required this.segments, required this.strokeWidth});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    double currentAngle = -math.pi / 2; // Start from top

    for (var segment in segments) {
      final value = segment['value'] as double;
      final color = segment['color'] as Color;

      final paint =
          Paint()
            ..color = color
            ..strokeWidth = strokeWidth
            ..style = PaintingStyle.stroke
            ..strokeCap = StrokeCap.round;

      final sweepAngle = 2 * math.pi * value;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        currentAngle,
        sweepAngle,
        false,
        paint,
      );

      currentAngle += sweepAngle;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
