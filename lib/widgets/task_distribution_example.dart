import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homekru_owner/widgets/task_distribution_chart.dart';

/// Example usage of the TaskDistributionChart widget
class TaskDistributionExample extends StatelessWidget {
  const TaskDistributionExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Distribution Chart Example'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.all(20.w),
        child: const Column(
          children: [
            // Example usage of the TaskDistributionChart
            TaskDistributionChart(),

            SizedBox(height: 20),

            // You can also use it in a grid or list
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TaskDistributionChart(),
                    SizedBox(height: 16),
                    TaskDistributionChart(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
