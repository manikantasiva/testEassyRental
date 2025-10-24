import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../domain/entities/booking_entity.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/styles/app_styles.dart';
import '../../../../core/constants/app_constants.dart';

class BookingConfirmationScreen extends StatelessWidget {
  final BookingEntity booking;

  const BookingConfirmationScreen({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Booking Confirmed',
          style: AppStyles.headingSmall.copyWith(fontWeight: FontWeight.w400),
        ),
        backgroundColor: AppColors.lightBackground,
        elevation: 0,
        centerTitle: true,
      ),

      backgroundColor: AppColors.lightBackground,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: AppColors.green.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check_circle,
                  color: AppColors.green,
                  size: 48,
                ),
              ),
            ),
            const SizedBox(height: 24),

            Center(
              child: Text(
                'Booking Confirmed!',
                style: AppStyles.headingLarge.copyWith(color: AppColors.green),
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: Text(
                'Your booking has been successfully created',
                style: AppStyles.bodyMedium.copyWith(color: AppColors.grey),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 32),

            Container(
              padding: const EdgeInsets.all(20),
              decoration: AppStyles.cardDecoration,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Booking Details', style: AppStyles.headingSmall),
                  const SizedBox(height: 16),

                  _buildDetailRow('Booking ID', booking.id),
                  const SizedBox(height: 12),
                  _buildDetailRow('Car', booking.carName),
                  const SizedBox(height: 12),
                  _buildDetailRow('Customer', booking.customerName),
                  const SizedBox(height: 12),
                  _buildDetailRow('Location', booking.location),
                  const SizedBox(height: 12),
                  _buildDetailRow('From Date', _formatDate(booking.fromDate)),
                  const SizedBox(height: 12),
                  _buildDetailRow('To Date', _formatDate(booking.toDate)),
                  const SizedBox(height: 12),
                  _buildDetailRow(
                    'Time',
                    '${booking.fromTime} - ${booking.toTime}',
                  ),
                  const SizedBox(height: 12),
                  _buildDetailRow('Status', booking.status.toUpperCase()),
                  const SizedBox(height: 12),
                  _buildDetailRow(
                    'Created',
                    _formatDateTime(booking.createdAt),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            Container(
              padding: const EdgeInsets.all(20),
              decoration: AppStyles.cardDecoration,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Pricing', style: AppStyles.headingSmall),
                  const SizedBox(height: 16),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total Amount', style: AppStyles.bodyLarge),
                      Text(
                        '\$${booking.totalPrice.toStringAsFixed(2)}',
                        style: AppStyles.priceMedium.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      context.go(AppConstants.homeRoute);
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      side: const BorderSide(color: AppColors.primary),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'View Bookings',
                      style: AppStyles.buttonMedium.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      context.go(AppConstants.homeRoute);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: AppColors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text('Book Another', style: AppStyles.buttonMedium),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 100,
          child: Text(
            label,
            style: AppStyles.bodyMedium.copyWith(
              color: AppColors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            value,
            style: AppStyles.bodyMedium.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  String _formatDateTime(DateTime dateTime) {
    return '${_formatDate(dateTime)} at ${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  }
}
