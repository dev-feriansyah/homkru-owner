import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homekru_owner/core/theme/app_colors.dart';

class CustomDropdownWidget extends StatelessWidget {
  final String? selectedValue;
  final List<String> items;
  final String? hintText;
  final void Function(String?) onChanged;
  final Color? borderColor;

  const CustomDropdownWidget({
    super.key,
    required this.selectedValue,
    this.hintText,
    required this.items,
    required this.onChanged,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final appColors = context.appColors;

    return Container(
      width: double.infinity,
      height: 57.h,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      decoration: ShapeDecoration(
        color: colorScheme.surface,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: borderColor ?? colorScheme.outline),
          borderRadius: BorderRadius.circular(15),
        ),
        shadows: [
          BoxShadow(
            color: colorScheme.primary.withValues(alpha: 0.08),
            blurRadius: 50,
            offset: const Offset(10, 20),
          ),
        ],
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedValue,
          isExpanded: true,
          hint: Text(
            hintText ?? 'Select Task',
            style: GoogleFonts.poppins(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: appColors.grey,
              // fontFamily: "Poppins",
            ),
          ),
          icon: Icon(
            Icons.keyboard_arrow_down,
            color: appColors.grey,
            size: 20,
          ),
          // style: GoogleFonts.poppins(
          //   fontSize: 16.sp,
          //   fontWeight: FontWeight.w400,
          //   color: appTheme.grey,
          //   // fontFamily: "Poppins",
          // ),
          dropdownColor: colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          items:
              items
                  .map(
                    (task) => DropdownMenuItem<String>(
                      value: task,
                      child: Text(
                        task,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: appColors.grey,
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
