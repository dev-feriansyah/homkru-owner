import 'package:flutter/material.dart';
import 'package:homekru_owner/core/utils/common_utils.dart';
import 'package:homekru_owner/presentation/attendance_screen/provider/attendance_provider.dart';

import 'package:homekru_owner/presentation/attendance_screen/widgets/history_attendance_screen.dart';
import 'package:homekru_owner/presentation/attendance_screen/widgets/todays_attendance_screen.dart';
import 'package:homekru_owner/theme/theme_helper.dart';
import 'package:homekru_owner/shared/widgets/custom_app_bar.dart';
import 'package:homekru_owner/shared/widgets/custom_text.dart';
import 'package:provider/provider.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.lightBlue,
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
            child: Consumer<AttendanceProvider>(
              builder: (context, provider, child) {
                return Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey.shade300,
                            width: 1,
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          // Today tab
                          Expanded(
                            child: GestureDetector(
                              onTap: () => provider.changeTab(0),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 15,
                                ),
                                decoration: BoxDecoration(
                                  color:
                                      provider.selectedIndex == 0
                                          ? appTheme.primaryColor
                                          : Colors.transparent,
                                  borderRadius:
                                      provider.selectedIndex == 0
                                          ? BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                            bottomRight: Radius.circular(10),
                                          )
                                          : null,
                                  border: Border(
                                    bottom: BorderSide(
                                      color:
                                          provider.selectedIndex == 0
                                              ? Colors.transparent
                                              : appTheme.grey,
                                    ),
                                  ),
                                ),
                                child: CText(
                                  'Today',
                                  textAlign: TextAlign.center,
                                  size: 13,
                                  color:
                                      provider.selectedIndex == 0
                                          ? appTheme.white
                                          : appTheme.grey,
                                  weight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),

                          // History tab
                          Expanded(
                            child: GestureDetector(
                              onTap: () => provider.changeTab(1),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 15,
                                ),
                                decoration: BoxDecoration(
                                  color:
                                      provider.selectedIndex == 1
                                          ? appTheme.primaryColor
                                          : Colors.transparent,
                                  borderRadius:
                                      provider.selectedIndex == 1
                                          ? BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                            bottomLeft: Radius.circular(10),
                                          )
                                          : null,
                                  border: Border(
                                    bottom: BorderSide(
                                      color:
                                          provider.selectedIndex == 1
                                              ? Colors.transparent
                                              : appTheme.grey,
                                    ),
                                  ),
                                ),
                                child: CText(
                                  'History',
                                  textAlign: TextAlign.center,
                                  size: 13,
                                  color:
                                      provider.selectedIndex == 1
                                          ? appTheme.white
                                          : appTheme.grey,
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
                          provider.selectedIndex == 0
                              ? TodayAttendanceWidget()
                              : HistoryAttendanceScreen(),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
