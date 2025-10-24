import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/styles/app_styles.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: AppStyles.headingSmall.copyWith(fontWeight: FontWeight.w400),
        ),
        backgroundColor: AppColors.lightBackground,
        elevation: 0,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.notifications, size: 100, color: AppColors.primary),
            const SizedBox(height: 20),
            Text('Notifications', style: AppStyles.headingLarge),
            const SizedBox(height: 10),
            Text(
              'Stay updated with your car rental notifications',
              style: AppStyles.bodyMedium.copyWith(color: AppColors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
