import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homekru_owner/theme/theme_helper.dart';
import 'package:homekru_owner/shared/widgets/custom_text.dart';

class TaskDropdown extends StatelessWidget {
  final String? selectedTask;
  final List<String> tasks;
  final String? hintText;
  final void Function(String?) onChanged;

  const TaskDropdown({
    super.key,
    required this.selectedTask,
    this.hintText,
    required this.tasks,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: 57.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 3.h),
      decoration: ShapeDecoration(
        color: appTheme.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 0, color: appTheme.white),
          borderRadius: BorderRadius.circular(15),
        ),

        shadows: [
          BoxShadow(
            color: appTheme.shadowColor,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
          // BoxShadow(
          //   color: appTheme.shadowColor,
          //   blurRadius: 50,
          //   offset: const Offset(10, 20),
          //   spreadRadius: 0,
          // ),
        ],
      ),

      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedTask,
          isExpanded: true,
          hint: CText(
            hintText ?? 'Select Task',
            size: 16,
            weight: FontWeight.w400,
            color: appTheme.grey,
            // style:
          ),
          icon: Icon(
            Icons.keyboard_arrow_down,
            color: appTheme.textPrimary,
            // size: 20,
          ),
          style: TextStyle(
            fontSize: 14.sp,
            color: appTheme.textPrimary,
            fontFamily: 'Poppins',
          ),
          dropdownColor: appTheme.white,
          borderRadius: BorderRadius.circular(15),
          items:
              tasks
                  .map(
                    (task) => DropdownMenuItem<String>(
                      value: task,
                      child: Text(
                        task,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: appTheme.textPrimary,
                        ),
                      ),
                    ),
                  )
                  .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
