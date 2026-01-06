import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homekru_owner/features/task/ui/screens/task_managment/create_from_scratch_screen.dart';
import 'package:homekru_owner/features/task/ui/screens/task_managment/suggeste_tasks_screen.dart';
import 'package:homekru_owner/core/theme/app_colors.dart';
import 'package:homekru_owner/shared/widgets/custom_app_bar.dart';

class TaskManagementScreen extends HookWidget {
  const TaskManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final appColors = context.appColors;

    final TabController tabController = useTabController(initialLength: 2);

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: CustomCommonAppBar(
        title: 'Task Management',
        backgroundColor: colorScheme.surface,
      ),
      body:
      // provider.isLoading
      //     ? const Center(child: CircularProgressIndicator())
      //     :
      Container(
        color: colorScheme.primaryContainer,
        child: Column(
          children: [
            Container(
              height: 30.h,
              // margin: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: colorScheme.surface,
                // borderRadius: BorderRadius.circular(8.r),
              ),
              child: TabBar(
                controller: tabController,
                indicator: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: colorScheme.secondary,
                      width: 1.0,
                    ),
                  ),
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: Colors.transparent,
                labelColor: colorScheme.secondary,
                unselectedLabelColor: appColors.greyAA,
                labelStyle: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
                unselectedLabelStyle: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
                tabs: const [
                  Tab(text: 'Suggested Tasks'),
                  Tab(text: 'Create From Scratch'),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [SuggestedTasksScreen(), CreateFromScratchScreen()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
