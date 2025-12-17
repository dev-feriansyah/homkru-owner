import 'package:flutter/material.dart';
import 'package:homekru_owner/presentation/subscription/widgets/subscription_card.dart';
import 'package:homekru_owner/widgets/custom_text.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Subscription')),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CText(
            'Choose a plan',
            textAlign: TextAlign.center,
            color: const Color(0xFF212121),
            size: 24,
            weight: FontWeight.w600,
            height: 0.92,
          ),
          SizedBox(height: 10),
          CText(
            'Pick the right plan for you',
            textAlign: TextAlign.center,
            color: const Color(0xFF616161),
            size: 15,
            weight: FontWeight.w400,
            height: 1.20,
          ),
          SizedBox(height: 20),
          SubscriptionCard(),
          SizedBox(height: 20),
          SubscriptionCard(),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
