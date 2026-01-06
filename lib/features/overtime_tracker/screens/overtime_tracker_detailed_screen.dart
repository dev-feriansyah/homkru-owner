import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homekru_owner/shared/domain/value_objects/date_range.dart';
import 'package:homekru_owner/shared/utils/common_utils.dart';

import 'package:homekru_owner/core/theme/app_colors.dart';
import 'package:homekru_owner/shared/widgets/custom_app_bar.dart';
import 'package:homekru_owner/shared/widgets/custom_elevated_button.dart';
import 'package:homekru_owner/shared/widgets/custom_text.dart';

class OvertimeTrackerDetailedScreen extends StatefulWidget {
  const OvertimeTrackerDetailedScreen({super.key});

  @override
  State<OvertimeTrackerDetailedScreen> createState() =>
      _OvertimeTrackerDetailedScreenState();
}

class _OvertimeTrackerDetailedScreenState
    extends State<OvertimeTrackerDetailedScreen> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final appColors = context.appColors;

    return Scaffold(
      backgroundColor: colorScheme.primaryContainer,
      appBar: CustomCommonAppBar(title: "Maria Johnson"),

      body: Stack(
        children: [
          bottomWaveWidget(),
          SizedBox(
            height: 1.sh,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CText(
                          "Date Range",
                          size: 18,
                          weight: FontWeight.bold,
                          fontFamily: "PoppinsMedium",
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 0,
                          ),
                          decoration: BoxDecoration(
                            color: colorScheme.surface,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: colorScheme.primary.withValues(alpha: 0.3),
                              width: 2,
                            ),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: null,
                              icon: Icon(
                                Icons.arrow_drop_down,
                                color: colorScheme.primary,
                              ),
                              style: TextStyle(
                                color: colorScheme.primary,
                                fontWeight: FontWeight.w500,
                              ),
                              items:
                                  DateRange.values.map((DateRange value) {
                                    return DropdownMenuItem<String>(
                                      value: value.label,
                                      child: Text(value.label),
                                    );
                                  }).toList(),
                              onChanged: (newValue) {},
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),

                    Container(
                      width: 1.sw,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: colorScheme.surface,
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 20,
                            ),
                            width: 1.sw,
                            decoration: BoxDecoration(
                              color: colorScheme.primary,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              ),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: CText(
                                    "Date",
                                    size: 12,
                                    weight: FontWeight.bold,
                                    color: colorScheme.surface,
                                  ),
                                ),
                                Expanded(
                                  child: CText(
                                    "Lateness",
                                    size: 12,
                                    weight: FontWeight.bold,
                                    textAlign: TextAlign.center,
                                    color: colorScheme.surface,
                                  ),
                                ),
                                Expanded(
                                  child: CText(
                                    "Rate",
                                    size: 12,
                                    textAlign: TextAlign.center,
                                    weight: FontWeight.bold,
                                    color: colorScheme.surface,
                                  ),
                                ),
                                Expanded(
                                  child: CText(
                                    "Total",
                                    size: 12,
                                    weight: FontWeight.bold,
                                    textAlign: TextAlign.end,
                                    color: colorScheme.surface,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: 9,
                            separatorBuilder:
                                (context, index) => Container(
                                  height: 1,
                                  width: 1.sw,
                                  color: colorScheme.outlineVariant,
                                ),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  // Navigate to detailed view if needed
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 15,
                                  ),
                                  decoration: BoxDecoration(
                                    color: colorScheme.surface,
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: CText(
                                          "15-05-2025",
                                          weight: FontWeight.w600,
                                          color: appColors.grey,
                                          size: 12,
                                        ),
                                      ),
                                      Expanded(
                                        child: CText(
                                          "\$5.00",
                                          weight: FontWeight.w600,
                                          textAlign: TextAlign.center,
                                          color: appColors.grey,
                                          size: 12,
                                        ),
                                      ),
                                      Expanded(
                                        child: CText(
                                          "\$15/hr",
                                          textAlign: TextAlign.center,
                                          size: 12,
                                          color: appColors.grey,
                                          weight: FontWeight.w600,
                                        ),
                                      ),
                                      Expanded(
                                        child: CText(
                                          "\$187.50",
                                          weight: FontWeight.w600,
                                          textAlign: TextAlign.end,
                                          color: appColors.grey,
                                          size: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                          Container(
                            height: 1,
                            width: 1.sw,
                            color: colorScheme.outlineVariant,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 20,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CText(
                                  "Total",
                                  size: 14,
                                  weight: FontWeight.bold,
                                  fontFamily: "PoppinsMedium",
                                  color: appColors.grey,
                                ),
                                const SizedBox(width: 8),
                                CText(
                                  "\$1,500.00",
                                  size: 14,
                                  fontFamily: "PoppinsMedium",
                                  weight: FontWeight.bold,
                                  color: colorScheme.primary,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 50.h),

                    CustomElevatedButton(
                      onPressed: () {
                        // Export detailed report functionality
                      },
                      text: "Export Detailed Report",
                    ),
                    SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
