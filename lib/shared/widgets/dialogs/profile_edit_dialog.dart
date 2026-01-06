import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homekru_owner/core/constants/app_strings.dart';
import 'package:homekru_owner/shared/utils/logger.dart';
import 'package:homekru_owner/core/theme/app_colors.dart';
import 'package:homekru_owner/shared/widgets/custom_dropdown_widget.dart';
import 'package:homekru_owner/shared/widgets/custom_elevated_button.dart';
import 'package:homekru_owner/shared/widgets/custom_text.dart';
import 'package:homekru_owner/shared/widgets/textfield/custom_text_form_field.dart';

void showEditDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      final colorScheme = Theme.of(context).colorScheme;
      final appColors = context.appColors;

      return Dialog(
        backgroundColor: colorScheme.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        insetPadding: const EdgeInsets.symmetric(horizontal: 24),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Title + Close button
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Spacer(), // pushes "Edit" to the center
                  CText(
                    "Edit",
                    color: colorScheme.onSurface,
                    size: 18.sp,
                    weight: FontWeight.w600,
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      height: 25.w,
                      width: 25.w,
                      decoration: BoxDecoration(
                        color: colorScheme.surfaceContainerHighest,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.close,
                          color: colorScheme.primary,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),

              Container(
                width: double.infinity,
                height: 57.h,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 0,
                ),
                decoration: ShapeDecoration(
                  color: colorScheme.surface,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      color: colorScheme.surfaceContainerHighest,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  shadows: [
                    BoxShadow(
                      color: colorScheme.shadow.withValues(alpha: 0.08),
                      blurRadius: 50,
                      offset: const Offset(10, 20),
                      spreadRadius: 0,
                    ),
                  ],
                ),

                child: Row(
                  children: [
                    CText(
                      "Image upload",
                      color: appColors.grey,
                      size: 16.sp,
                      weight: FontWeight.w500,
                    ),
                    const Spacer(),
                    Icon(
                      Icons.cloud_upload_outlined,
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),

              // Name field
              CustomTextFormField(
                controller: TextEditingController(),
                hintText: "Name",
                onChanged: (value) {},
              ),
              const SizedBox(height: 15),

              // Dropdown field
              CustomDropdownWidget(
                selectedValue: "Live-in",
                hintText: "Live-in",
                items: ["Live-in", "Non Live-in"],
                borderColor: colorScheme.surfaceContainerHighest,
                onChanged: (val) {
                  Log.d(val);
                },
              ),
              const SizedBox(height: 20),

              // Continue button
              CustomElevatedButton(
                text: AppStrings.continueText,
                height: 50.h,
                width: double.infinity,
                onPressed: () {},
              ),
            ],
          ),
        ),
      );
    },
  );
}
