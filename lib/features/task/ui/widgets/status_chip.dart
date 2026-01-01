import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homekru_owner/core/theme/app_colors.dart';
import 'package:homekru_owner/shared/widgets/custom_text.dart';

class StatusStyle {
  final Color bg;
  final Color text;
  const StatusStyle(this.bg, this.text);
}

class StatusChip extends StatelessWidget {
  final String status;
  const StatusChip(this.status, {super.key});

  static final _statusColors = <String, StatusStyle>{
    'complete': StatusStyle(
      appColors.brightGreen.withValues(alpha: 0.1),
      appColors.brightGreen,
    ),
    'in progress': StatusStyle(
      appColors.primaryColor.withValues(alpha: 0.1),
      appColors.primaryColor,
    ),
    'pending': StatusStyle(
      appColors.amber.withValues(alpha: 0.1),
      appColors.amber,
    ),
  };

  @override
  Widget build(BuildContext context) {
    final style =
        _statusColors[status.toLowerCase()] ?? _statusColors['pending']!;

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
