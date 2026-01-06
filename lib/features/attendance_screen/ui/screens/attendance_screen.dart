import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:homekru_owner/shared/utils/common_utils.dart';

import 'package:homekru_owner/features/attendance_screen/ui/widgets/history_attendance_tab.dart';
import 'package:homekru_owner/features/attendance_screen/ui/widgets/todays_attendance_tab.dart';
import 'package:homekru_owner/core/theme/app_colors.dart';
import 'package:homekru_owner/shared/widgets/custom_app_bar.dart';
import 'package:homekru_owner/shared/widgets/custom_text.dart';

class AttendanceScreen extends HookWidget {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final appColors = context.appColors;

    final selectedIndex = useState(0);

    return Scaffold(
      backgroundColor: colorScheme.primaryContainer,
      appBar: CustomCommonAppBar(title: "Attendance & Time"),
      body: Stack(
        children: [
          bottomWaveWidget(),
          // Positioned(
          //   bottom: 0,
          //   left: 0,
          //   child: CustomImageView(
          //     imagePath: ImageConstant.backgroundImage2,
          //     height: 200,
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey.shade300, width: 1),
                    ),
                  ),
                  child: Row(
                    children: [
                      // Today tab
                      Expanded(
                        child: GestureDetector(
                          onTap: () => selectedIndex.value = 0,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 15,
                            ),
                            decoration: BoxDecoration(
                              color:
                                  selectedIndex.value == 0
                                      ? colorScheme.primary
                                      : Colors.transparent,
                              borderRadius:
                                  selectedIndex.value == 0
                                      ? BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      )
                                      : null,
                              border: Border(
                                bottom: BorderSide(
                                  color:
                                      selectedIndex.value == 0
                                          ? Colors.transparent
                                          : appColors.grey,
                                ),
                              ),
                            ),
                            child: CText(
                              'Today',
                              textAlign: TextAlign.center,
                              size: 13,
                              color:
                                  selectedIndex.value == 0
                                      ? colorScheme.surface
                                      : appColors.grey,
                              weight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),

                      // History tab
                      Expanded(
                        child: GestureDetector(
                          onTap: () => selectedIndex.value = 1,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 15,
                            ),
                            decoration: BoxDecoration(
                              color:
                                  selectedIndex.value == 1
                                      ? colorScheme.primary
                                      : Colors.transparent,
                              borderRadius:
                                  selectedIndex.value == 1
                                      ? BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                      )
                                      : null,
                              border: Border(
                                bottom: BorderSide(
                                  color:
                                      selectedIndex.value == 1
                                          ? Colors.transparent
                                          : appColors.grey,
                                ),
                              ),
                            ),
                            child: CText(
                              'History',
                              textAlign: TextAlign.center,
                              size: 13,
                              color:
                                  selectedIndex.value == 1
                                      ? colorScheme.surface
                                      : appColors.grey,
                              weight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Expanded(
                  child:
                      selectedIndex.value == 0
                          ? TodayAttendanceTab()
                          : HistoryAttendanceTab(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
