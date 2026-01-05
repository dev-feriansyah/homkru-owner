import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homekru_owner/core/theme/app_color_extension.dart';
import 'package:homekru_owner/shared/widgets/custom_text.dart';

class StatusStyle {
  final Color bg;
  final Color text;
  const StatusStyle(this.bg, this.text);
}

class StatusChip extends StatelessWidget {
  final String status;
  const StatusChip(this.status, {super.key});

  // Convert from static field to method to access theme colors via BuildContext
  Map<String, StatusStyle> _getStatusColors(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final appColors = context.appColorExtension;

    return {
      'complete': StatusStyle(
        appColors.successColor.withValues(alpha: 0.1),
        appColors.successColor,
      ),
      'in progress': StatusStyle(
        colorScheme.primary.withValues(alpha: 0.1),
        colorScheme.primary,
      ),
      'pending': StatusStyle(
        appColors.warningColor.withValues(alpha: 0.1),
        appColors.warningColor,
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    final statusColors = _getStatusColors(context);
    final style =
        statusColors[status.toLowerCase()] ?? statusColors['pending']!;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 2.sp),
      decoration: BoxDecoration(
        color: style.bg,
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: CText(
        status,
        color: style.text,
        size: 12.sp,
        weight: FontWeight.w600,
      ),
    );
  }
}
