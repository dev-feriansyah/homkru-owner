import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homekru_owner/core/utils/size_utils.dart';
import 'package:homekru_owner/core/theme/theme_helper.dart';

class SelectTimeWidget<T> extends StatelessWidget {
  final bool value;
  final T? groupValue;
  final void Function(bool)? onChanged;
  final double? width;
  final String label;

  const SelectTimeWidget({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.label,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 57.h,
      width: width ?? SizeUtils.width,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 15.h),
      decoration: ShapeDecoration(
        color: appTheme.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1.w, color: appTheme.offWhite),
          borderRadius: BorderRadius.circular(15.r),
        ),
        shadows: [
          BoxShadow(
            color: appTheme.offWhite,
            blurRadius: 10.r,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextFormField(
            // readOnly: true,
            onTap: () {
              showTimePicker(context: context, initialTime: TimeOfDay.now());
            },
            decoration: InputDecoration(
              hintText: label,
              suffixIcon: Icon(Icons.access_time),
            ),
          ),
        ],
      ),
    );
  }
}
