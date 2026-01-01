import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homekru_owner/shared/utils/common_utils.dart';
import 'package:homekru_owner/core/constants/app_strings.dart';
import 'package:homekru_owner/core/constants/image_constant.dart';
import 'package:homekru_owner/features/task/ui/widgets/info_item.dart';
import 'package:homekru_owner/core/theme/app_colors.dart';
import 'package:homekru_owner/shared/widgets/custom_image_view.dart';
import 'package:homekru_owner/shared/widgets/custom_text.dart';

class TaskDetailCard extends StatelessWidget {
  final String assignedTo;
  final String assignedInitials;
  final String roomZone;
  final String description;
  final String subTask;
  final String frequency;
  final String time;
  final String duration;

  const TaskDetailCard({
    super.key,
    required this.assignedTo,
    required this.assignedInitials,
    required this.roomZone,
    required this.description,
    required this.subTask,
    required this.frequency,
    required this.time,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: appColors.white,
      elevation: 0.1,
      shadowColor: appColors.offWhite,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.r)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.r),
          color: appColors.white,
        ),
        padding: EdgeInsets.only(left: 14.w, bottom: 14.h),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25.r),
                child: CustomImageView(
                  imagePath: ImageConstant.taskDetailWave,
                  height: 150,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Assigned To
                vGap(14),
                CText(
                  AppStrings.assignedTo,
                  color: appColors.primaryColor,
                  size: 18.sp,
                  weight: FontWeight.w600,
                ),
                vGap(21.h),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(6.r),
                      decoration: BoxDecoration(
                        color: appColors.lightBlueTwo,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: CText(
                          assignedInitials,
                          color: appColors.primaryColor,
                          size: 16.sp,
                          fontFamily: 'Karla',
                          weight: FontWeight.w700,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    hGap(6.w),
                    CText(
                      assignedTo,
                      color: appColors.grey,
                      size: 15.sp,
                      weight: FontWeight.w500,
                      height: 1.47,
                    ),
                  ],
                ),

                /// Room / Zone
                vGap(23.h),
                CText(
                  AppStrings.roomZone,
                  color: appColors.textPrimary,
                  size: 14.sp,
                  weight: FontWeight.w600,
                ),
                vGap(5.h),
                CText(
                  roomZone,
                  color: appColors.grey,
                  size: 14.sp,
                  weight: FontWeight.w400,
                ),

                /// Description
                vGap(15.h),
                CText(
                  AppStrings.description,
                  color: appColors.textPrimary,
                  size: 14.sp,
                  weight: FontWeight.w600,
                ),
                vGap(5.h),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: CText(
                    description,
                    color: appColors.grey,
                    size: 12.sp,
                    weight: FontWeight.w400,
                    height: 1.83,
                  ),
                ),

                /// Sub Task
                vGap(15.h),
                CText(
                  AppStrings.subTask,
                  color: appColors.textPrimary,
                  size: 14.sp,
                  weight: FontWeight.w600,
                ),
                vGap(5.h),
                CText(
                  subTask,
                  color: appColors.grey,
                  size: 12.sp,
                  weight: FontWeight.w400,
                  height: 1.83,
                ),

                /// Recurrence Settings
                vGap(15.h),
                CText(
                  AppStrings.recurrenceSettings,
                  color: appColors.textPrimary,
                  size: 14.sp,
                  weight: FontWeight.w600,
                ),
                vGap(13.h),
                Padding(
                  padding: const EdgeInsets.only(right: 14.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InfoItem(label: AppStrings.frequency, value: frequency),
                      InfoItem(label: AppStrings.time, value: time),
                      InfoItem(label: AppStrings.duration, value: duration),
                    ],
                  ),
                ),
                vGap(13.h),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
