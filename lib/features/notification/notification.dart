import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homekru_owner/core/constants/image_constant.dart';
import 'package:homekru_owner/shared/utils/common_utils.dart';

import 'package:homekru_owner/core/routes/app_navigator.dart';
import 'package:homekru_owner/core/theme/app_colors.dart';
import 'package:homekru_owner/shared/widgets/custom_app_bar.dart';
import 'package:homekru_owner/shared/widgets/custom_elevated_button.dart';
import 'package:homekru_owner/shared/widgets/custom_text.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final appColors = context.appColors;

    return Scaffold(
      backgroundColor: colorScheme.primaryContainer,
      appBar: CustomCommonAppBar(title: "Notification"),

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
          SizedBox(
            height: 1.sh,
            child: Column(
              children: [
                // Tab Bar
                TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  controller: _tabController,
                  indicatorColor: colorScheme.primary,
                  indicatorWeight: 1,
                  labelColor: colorScheme.primary,
                  unselectedLabelColor: appColors.grey,
                  // labelPadding: EdgeInsets.symmetric(),
                  labelStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  unselectedLabelStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  tabs: [Tab(text: "All"), Tab(text: "Unread")],
                ),

                // Tab Content
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      _buildAllNotifications(),
                      _buildUnreadNotifications(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildAllNotifications() {
    final colorScheme = Theme.of(context).colorScheme;
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Today Section
          CText(
            "Today",
            size: 18,
            weight: FontWeight.bold,
            color: colorScheme.onSurface,
          ),
          SizedBox(height: 20),

          // Today's notifications
          _buildNotificationCard(
            avatarType: "task",
            name: "Maria Johnson",
            taskType: "Clean Kitchen",
            description: "Maria has completed 'Vacuum living room'",
            time: "10m ago",
            hasBadge: true,
            badgeCount: 1,
            border: Border.all(color: colorScheme.primary),
          ),
          _buildNotificationCard(
            avatarType: "task",
            name: "Maria Johnson",
            taskType: "Clean Kitchen",
            description: "Maria has completed 'Vacuum living room'",
            time: "10m ago",
            hasBadge: true,
            badgeCount: 1,
            border: Border.all(color: colorScheme.primary),
          ),

          SizedBox(height: 30),

          // Yesterday Section
          CText(
            "Yesterday",
            size: 18,
            weight: FontWeight.bold,
            color: colorScheme.onSurface,
          ),
          SizedBox(height: 20),

          // Yesterday's notifications
          _buildNotificationCard(
            avatarType: "completed",
            name: "Maria Johnson",
            taskType: "Task Completed",
            description: "Maria has completed 'Vacuum living room'",
            time: "20-04-25",
            hasBadge: false,
          ),
          _buildNotificationCard(
            avatarType: "missed",
            name: "Maria Johnson",
            taskType: "Missed Task",
            description: "Maria has missed task 'Vacuum living room'",
            time: "20-04-25",
            hasBadge: false,
            hasRemindButton: true,
          ),
          _buildNotificationCard(
            avatarType: "helper",
            name: "Maria Johnson",
            taskType: "New Helper Added",
            description: "Maria has completed 'Vacuum living room'",
            time: "20-04-25",
            hasBadge: false,
          ),
          _buildNotificationCard(
            avatarType: "helper",
            name: "Maria Johnson",
            taskType: "New Helper Added",
            description: "Maria has completed 'Vacuum living room'",
            time: "20-04-25",
            hasBadge: false,
          ),
          _buildNotificationCard(
            avatarType: "helper",
            name: "Maria Johnson",
            taskType: "New Helper Added",
            description: "Maria has completed 'Vacuum living room'",
            time: "20-04-25",
            hasBadge: false,
          ),

          SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildUnreadNotifications() {
    final colorScheme = Theme.of(context).colorScheme;
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CText(
            "Unread Notifications",
            size: 18,
            weight: FontWeight.bold,
            color: colorScheme.onSurface,
          ),
          SizedBox(height: 20),

          // Show only unread notifications (with badges)
          _buildNotificationCard(
            avatarType: "task",
            name: "Maria Johnson",
            taskType: "Clean Kitchen",
            description: "Maria has completed 'Vacuum living room'",
            time: "10m ago",
            hasBadge: true,
            badgeCount: 1,
            border: Border.all(color: colorScheme.primary),
          ),
          _buildNotificationCard(
            avatarType: "task",
            name: "Maria Johnson",
            taskType: "Clean Kitchen",
            description: "Maria has completed 'Vacuum living room'",
            time: "10m ago",
            hasBadge: true,
            badgeCount: 1,
            border: Border.all(color: colorScheme.primary),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildNotificationCard({
    required String avatarType,
    required String name,
    required String taskType,
    required String description,
    required String time,
    required bool hasBadge,
    final BoxBorder? border,
    int badgeCount = 0,
    bool hasRemindButton = false,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    final appColors = context.appColors;
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(30),
        border: border,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Avatar
          _buildAvatar(avatarType),
          SizedBox(width: 12),

          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CText(
                            name,
                            size: 14,
                            weight: FontWeight.w600,
                            color: colorScheme.onSurface,
                          ),
                          SizedBox(height: 2),
                          CText(
                            taskType,
                            size: 12,
                            weight: FontWeight.w600,
                            color: appColors.grey,
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CText(
                          time,
                          style: GoogleFonts.karla(
                            fontSize: 14.sp,
                            color: appColors.grey,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        if (hasBadge) ...[
                          SizedBox(height: 4),
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: colorScheme.primary,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: CText(
                                badgeCount.toString(),
                                size: 10,
                                color: Colors.white,
                                weight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
                vGap(2.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CText(
                        description,
                        size: 12,
                        color: appColors.grey,
                        weight: FontWeight.w400,
                      ),
                    ),
                    if (hasRemindButton) ...[
                      SizedBox(width: 8),
                      GestureDetector(
                        onTap: () {
                          showReminderPopup(context);
                        },
                        child: CText(
                          "Remind >",
                          size: 12,
                          weight: FontWeight.w600,
                          color: colorScheme.primary,
                          decoration: TextDecoration.underline,
                          decorationColor: colorScheme.primary,
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAvatar(String type) {
    final colorScheme = Theme.of(context).colorScheme;
    switch (type) {
      case "task":
        return Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(ImageConstant.profile),
              fit: BoxFit.cover,
            ),
          ),
          // decoration: BoxDecoration(
          //   shape: BoxShape.circle,
          //   color: appTheme.veryLightGrey,
          // ),
          // child: Icon(
          //   Icons.cleaning_services,
          //   color: appTheme.primaryColor,
          //   size: 24,
          // ),
        );
      case "completed":
        return Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.green.withValues(alpha: 0.2),
          ),
          child: Icon(Icons.check, color: Colors.green, size: 24),
        );
      case "missed":
        return Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.red.withValues(alpha: 0.2),
          ),
          child: Icon(Icons.warning, color: Colors.red, size: 24),
        );
      case "helper":
        return Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(ImageConstant.profile),
              fit: BoxFit.cover,
            ),
          ),
        );
      default:
        return Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: colorScheme.outlineVariant,
          ),
          child: Icon(
            Icons.notifications,
            color: colorScheme.primary,
            size: 24,
          ),
        );
    }
  }

  void showReminderPopup(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    String selectedValue = '5 minutes';
    final List<String> reminderOptions = [
      '5 minutes',
      '10 minutes',
      '15 minutes',
      '30 minutes',
      '1 hour',
    ];

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: colorScheme.surface,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 32),
                        Expanded(
                          child: CText(
                            "Reminder",
                            textAlign: TextAlign.center,
                            size: 18,
                            weight: FontWeight.bold,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            AppNavigator.pop();
                          },
                          child: CircleAvatar(
                            radius: 16,
                            backgroundColor: colorScheme.secondaryContainer,
                            child: Icon(
                              Icons.close,
                              color: colorScheme.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    // DropdownSearch
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey.shade400),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: DropdownSearch<String>(
                        popupProps: PopupProps.menu(
                          showSelectedItems: true,
                          fit: FlexFit.loose,
                        ),
                        decoratorProps: DropDownDecoratorProps(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintText: "Send reminder in every",
                            hintStyle: TextStyle(
                              fontSize: 13,
                              color: colorScheme.onSurface,
                            ),
                            contentPadding: EdgeInsets.symmetric(vertical: 12),
                          ),
                        ),
                        items: (filter, infiniteScrollProps) => reminderOptions,
                        selectedItem: selectedValue,
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value!;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 15),
                    CustomElevatedButton(onPressed: () {}, text: 'Save'),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
