import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homekru_owner/theme/theme_helper.dart';
import 'package:homekru_owner/shared/widgets/custom_text.dart';
import 'package:homekru_owner/shared/widgets/attendance_header_widget.dart';

class AttendanceScreenWithDropdown extends StatefulWidget {
  const AttendanceScreenWithDropdown({super.key});

  @override
  State<AttendanceScreenWithDropdown> createState() =>
      _AttendanceScreenWithDropdownState();
}

class _AttendanceScreenWithDropdownState
    extends State<AttendanceScreenWithDropdown> {
  DateTime selectedDate = DateTime(
    2025,
    4,
    30,
  ); // Default to Tuesday, April 30, 2025

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.lightBlue,
      appBar: AppBar(
        title: const Text('Attendance'),
        backgroundColor: appTheme.primaryColor,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with date and dropdown
            AttendanceHeaderWidget(
              selectedDate: selectedDate,
              onDateSelected: (date) {
                setState(() {
                  selectedDate = date;
                });
              },
            ),

            SizedBox(height: 20.h),

            // Sample attendance cards
            _buildAttendanceCard(
              name: 'James Miller',
              initials: 'JM',
              checkIn: '8:15 AM',
              checkOut: '5:00 PM',
              status: 'Present',
              hasTag: false,
            ),

            SizedBox(height: 16.h),

            _buildAttendanceCard(
              name: 'James Miller',
              initials: 'JM',
              checkIn: '8:15 AM',
              checkOut: '5:00 PM',
              status: 'Day Off',
              hasTag: true,
              tagText: 'Day Off',
            ),

            SizedBox(height: 16.h),

            _buildAttendanceCard(
              name: 'James Miller',
              initials: 'JM',
              checkIn: '8:15 AM',
              checkOut: '5:00 PM',
              status: 'Day Off',
              hasTag: true,
              tagText: 'Day Off',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAttendanceCard({
    required String name,
    required String initials,
    required String checkIn,
    required String checkOut,
    required String status,
    required bool hasTag,
    String? tagText,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.r),
        border: Border.all(
          color: appTheme.primaryColor.withOpacity(0.3),
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Avatar
              CircleAvatar(
                backgroundColor: appTheme.lightBlue,
                radius: 18.r,
                child: CText(
                  initials,
                  color: appTheme.primaryColor,
                  size: 11.sp,
                  weight: FontWeight.bold,
                ),
              ),

              SizedBox(width: 12.w),

              // Name and details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CText(
                      name,
                      weight: FontWeight.bold,
                      size: 16.sp,
                      color: appTheme.textPrimary,
                    ),
                    SizedBox(height: 5.h),
                    CText(
                      'Check-in: $checkIn',
                      size: 14.sp,
                      color: appTheme.grey,
                    ),
                    SizedBox(height: 5.h),
                    CText(
                      'Expected check-out: $checkOut',
                      size: 14.sp,
                      color: appTheme.grey,
                    ),
                  ],
                ),
              ),

              // Status tag
              _buildStatusTag(status, hasTag, tagText),
            ],
          ),

          SizedBox(height: 15.h),

          // Location info
          Container(
            padding: EdgeInsets.all(15.w),
            decoration: BoxDecoration(
              color: appTheme.silver.withOpacity(0.1),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30.r),
                bottomRight: Radius.circular(30.r),
              ),
            ),
            child: Row(
              children: [
                Icon(Icons.location_on, size: 20.sp, color: appTheme.grey),
                SizedBox(width: 8.w),
                CText(
                  "123 Main St (within geo-fence)",
                  size: 14.sp,
                  color: appTheme.grey,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusTag(String status, bool hasTag, String? tagText) {
    Color bgColor;
    Color textColor;

    if (status == 'Day Off') {
      bgColor = appTheme.lightPink.withOpacity(0.6);
      textColor = appTheme.darkRed;
    } else {
      bgColor = appTheme.lightYellow;
      textColor = appTheme.amber;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 7.h),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: CText(
        hasTag ? tagText! : status,
        color: textColor,
        weight: FontWeight.bold,
        size: 14.sp,
        fontFamily: "PoppinsMedium",
      ),
    );
  }
}
