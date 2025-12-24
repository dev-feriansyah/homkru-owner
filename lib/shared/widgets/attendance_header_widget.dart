import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homekru_owner/core/theme/theme_helper.dart';
import 'package:homekru_owner/shared/widgets/custom_text.dart';
import 'package:intl/intl.dart';

class AttendanceHeaderWidget extends StatefulWidget {
  final DateTime selectedDate;
  final Function(DateTime) onDateSelected;

  const AttendanceHeaderWidget({
    super.key,
    required this.selectedDate,
    required this.onDateSelected,
  });

  @override
  State<AttendanceHeaderWidget> createState() => _AttendanceHeaderWidgetState();
}

class _AttendanceHeaderWidgetState extends State<AttendanceHeaderWidget> {
  OverlayEntry? _overlayEntry;

  @override
  void dispose() {
    _removeOverlay();
    super.dispose();
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  void _showDateDropdown(BuildContext context) {
    _removeOverlay(); // Remove any existing overlay

    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero);

    _overlayEntry = OverlayEntry(
      builder:
          (context) => GestureDetector(
            onTap: _removeOverlay,
            child: Stack(
              children: [
                // Background overlay to close dropdown when tapped outside
                Positioned.fill(child: Container(color: Colors.transparent)),
                // Date dropdown
                Positioned(
                  top: position.dy + 50.h, // Position below the button
                  right: 20.w, // Align to right side
                  child: Material(
                    elevation: 8,
                    borderRadius: BorderRadius.circular(8.r),
                    child: Container(
                      width: 150.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            offset: const Offset(0, 2),
                            blurRadius: 8,
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _buildDateItem('24-04-2025'),
                          _buildDateItem('25-04-2025'),
                          _buildDateItem('26-04-2025'),
                          _buildDateItem('27-04-2025'),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  Widget _buildDateItem(String dateString) {
    final date = DateTime.parse(
      '${dateString.split('-')[2]}-${dateString.split('-')[1]}-${dateString.split('-')[0]}',
    );
    final isSelected = _isSameDay(date, widget.selectedDate);

    return GestureDetector(
      onTap: () {
        widget.onDateSelected(date);
        _removeOverlay();
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: isSelected ? appTheme.primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: CText(
          dateString,
          size: 14.sp,
          color: isSelected ? Colors.white : appTheme.textPrimary,
          weight: isSelected ? FontWeight.w600 : FontWeight.w400,
        ),
      ),
    );
  }

  bool _isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Left side: Date title
        Expanded(
          child: CText(
            DateFormat('EEEE, MMMM d, y').format(widget.selectedDate),
            size: 18.sp,
            weight: FontWeight.bold,
            color: appTheme.textPrimary,
          ),
        ),

        // Right side: 3-dot menu button
        GestureDetector(
          onTap: () => _showDateDropdown(context),
          child: Container(
            padding: EdgeInsets.all(8.w),
            child: Icon(
              Icons.more_vert,
              size: 24.sp,
              color: appTheme.textPrimary,
            ),
          ),
        ),
      ],
    );
  }
}
