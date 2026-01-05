import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homekru_owner/shared/utils/common_utils.dart';
import 'package:homekru_owner/core/theme/app_color_extension.dart';
import 'package:homekru_owner/shared/widgets/custom_elevated_button.dart';
import 'package:homekru_owner/shared/widgets/custom_text.dart';

class AccessBottomSheet extends StatefulWidget {
  const AccessBottomSheet({super.key});

  @override
  State<AccessBottomSheet> createState() => _AccessBottomSheetState();
}

class _AccessBottomSheetState extends State<AccessBottomSheet> {
  final Map<String, bool> _accessOptions = {
    "Task management access (create, edit and delete)": false,
    "Action items access (view, edit and mark completed)": false,
    "Check in check out access (discharge, create and edit check in and check out times)":
        false,
    "Overtime access (view and mark as paid)": false,
    "Invite other homeowners and/or helpers": false,
    "Make changes to household settings": false,
  };

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final appColors = context.appColorExtension;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        /// Drag indicator
        Container(
          height: 40.h,
          width: 1.sw,
          decoration: BoxDecoration(
            color: appColors.silver2,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
            ),
          ),

          child: Center(
            child: Container(
              width: 90.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.only(
            left: 20.w,
            right: 20.w,
            top: 20.h,
            bottom: MediaQuery.of(context).viewInsets.bottom + 25.h,
          ),
          child: Column(
            children: [
              /// Title
              CText(
                "Give access for",
                size: 20.sp,
                color: colorScheme.onSurface,
                weight: FontWeight.w600,
                textAlign: TextAlign.center,
              ),
              vGap(20.h),
              ..._accessOptions.entries.map((entry) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 10.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 24.w,
                        width: 24.w,
                        child: Checkbox(
                          value: entry.value,
                          activeColor: colorScheme.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          onChanged: (val) {
                            setState(() {
                              _accessOptions[entry.key] = val ?? false;
                            });
                          },
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: CText(
                          entry.key,
                          size: 16.sp,
                          weight: FontWeight.w400,
                          color: appColors.grey,
                        ),
                      ),
                    ],
                  ),
                );
              }),

              SizedBox(height: 24.h),

              /// Invite button
              CustomElevatedButton(
                text: "Invite via Email",
                height: 50.h,
                width: double.infinity,
                onPressed: () {
                  final selected =
                      _accessOptions.entries
                          .where((e) => e.value)
                          .map((e) => e.key)
                          .toList();
                  Navigator.pop(
                    context,
                    selected,
                  ); // return selected access list
                },
              ),
            ],
          ),
        ),

        /// Checkbox list
      ],
    );
  }
}

/// Function to open the bottom sheet
void showAccessBottomSheet(BuildContext context) {
  final colorScheme = Theme.of(context).colorScheme;

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: colorScheme.surface,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
    ),
    builder: (context) => const AccessBottomSheet(),
  );
}
