import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/styles/app_styles.dart';

class BookingsScreen extends StatelessWidget {
  const BookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      appBar: AppBar(
        title: Text(
          'Bookings',
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
            Icon(Icons.book_online, size: 100, color: AppColors.primary),
            const SizedBox(height: 20),
            Text('Your Bookings', style: AppStyles.headingLarge),
            const SizedBox(height: 10),
            Text(
              'Manage your car rental bookings here',
              style: AppStyles.bodyMedium.copyWith(),
            ),
          ],
        ),
      ),
    );
  }
}
