import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../bloc/booking_cubit.dart';
import '../bloc/booking_state.dart';
import '../../data/repositories/booking_repository.dart';
import '../../domain/entities/booking_form_entity.dart';
import '../../../auth/presentation/bloc/auth_cubit.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/styles/app_styles.dart';

class BookingFormScreen extends StatelessWidget {
  final String carId;
  final String carName;

  const BookingFormScreen({
    super.key,
    required this.carId,
    required this.carName,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final authState = context.read<AuthCubit>().state;
        String? customerName;
        if (authState is AuthSuccess) {
          customerName = authState.user.name;
        }

        return BookingCubit(bookingRepository: BookingRepositoryImpl())
          ..initializeForm(carId, carName, customerName: customerName);
      },
      child: _BookingFormView(carId: carId, carName: carName),
    );
  }
}

class _BookingFormView extends StatelessWidget {
  final String carId;
  final String carName;

  const _BookingFormView({required this.carId, required this.carName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Book Car',
          style: AppStyles.headingSmall.copyWith(fontWeight: FontWeight.w400),
        ),
        backgroundColor: AppColors.lightBackground,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.textPrimary),
          onPressed: () => context.pop(),
        ),
      ),

      backgroundColor: AppColors.lightBackground,
      body: BlocBuilder<BookingCubit, BookingState>(
        builder: (context, state) {
          if (state is BookingLoading) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            );
          } else if (state is BookingFormLoaded) {
            return _buildForm(context, state.form);
          } else if (state is BookingCreated) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              context.go('/booking-confirmation/${state.booking.id}');
            });
            return const Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            );
          } else if (state is BookingError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.error_outline,
                    color: AppColors.red,
                    size: 64,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Booking Error',
                    style: AppStyles.headingMedium.copyWith(
                      color: AppColors.red,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    state.message,
                    style: AppStyles.bodyMedium.copyWith(color: AppColors.red),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.read<BookingCubit>().clearError();
                    },
                    child: const Text('Try Again'),
                  ),
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(color: AppColors.primary),
          );
        },
      ),
    );
  }

  Widget _buildForm(BuildContext context, BookingFormEntity form) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: AppStyles.cardDecoration,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Car Details', style: AppStyles.headingSmall),
                  const SizedBox(height: 8),
                  Text(form.carName, style: AppStyles.bodyLarge),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),

          Text('Customer Name *', style: AppStyles.headingSmall),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: TextFormField(
              initialValue: form.customerName,
              decoration: InputDecoration(
                hintText: 'Enter your full name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                prefixIcon: const Icon(Icons.person),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
              ),
              onChanged: (value) {
                context.read<BookingCubit>().updateCustomerName(value);
              },
            ),
          ),
          const SizedBox(height: 20),

          Text('Pickup Location *', style: AppStyles.headingSmall),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: TextFormField(
              initialValue: form.location,
              decoration: InputDecoration(
                hintText: 'Enter pickup location',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                prefixIcon: const Icon(Icons.location_on),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
              ),
              onChanged: (value) {
                context.read<BookingCubit>().updateLocation(value);
              },
            ),
          ),
          const SizedBox(height: 20),

          Text('Booking Type', style: AppStyles.headingSmall),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: _buildToggleButton(
                  context,
                  'Single Day',
                  form.isSingleDay,
                  () => context.read<BookingCubit>().toggleSingleDay(true),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildToggleButton(
                  context,
                  'Multiple Days',
                  !form.isSingleDay,
                  () => context.read<BookingCubit>().toggleSingleDay(false),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          Text('From Date *', style: AppStyles.headingSmall),
          const SizedBox(height: 8),
          InkWell(
            onTap: () => _selectDate(context, true),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.lightGrey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const Icon(Icons.calendar_today, color: AppColors.grey),
                  const SizedBox(width: 12),
                  Text(
                    form.fromDate != null
                        ? '${form.fromDate!.day}/${form.fromDate!.month}/${form.fromDate!.year}'
                        : 'Select from date',
                    style: AppStyles.bodyMedium.copyWith(
                      color:
                          form.fromDate != null
                              ? AppColors.textPrimary
                              : AppColors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          if (!form.isSingleDay) ...[
            Text('To Date *', style: AppStyles.headingSmall),
            const SizedBox(height: 8),
            InkWell(
              onTap: () => _selectDate(context, false),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.lightGrey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.calendar_today, color: AppColors.grey),
                    const SizedBox(width: 12),
                    Text(
                      form.toDate != null
                          ? '${form.toDate!.day}/${form.toDate!.month}/${form.toDate!.year}'
                          : 'Select to date',
                      style: AppStyles.bodyMedium.copyWith(
                        color:
                            form.toDate != null
                                ? AppColors.textPrimary
                                : AppColors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],

          Text('Time', style: AppStyles.headingSmall),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('From Time', style: AppStyles.bodyMedium),
                    const SizedBox(height: 4),
                    InkWell(
                      onTap: () => _selectTime(context, true),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.lightGrey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.access_time,
                              color: AppColors.grey,
                            ),
                            const SizedBox(width: 8),
                            Text(form.fromTime, style: AppStyles.bodyMedium),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('To Time', style: AppStyles.bodyMedium),
                    const SizedBox(height: 4),
                    InkWell(
                      onTap: () => _selectTime(context, false),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.lightGrey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.access_time,
                              color: AppColors.grey,
                            ),
                            const SizedBox(width: 8),
                            Text(form.toTime, style: AppStyles.bodyMedium),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),

          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed:
                  form.isValid
                      ? () => context.read<BookingCubit>().createBooking()
                      : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text('Confirm Booking', style: AppStyles.buttonLarge),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildToggleButton(
    BuildContext context,
    String text,
    bool isSelected,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.lightGrey,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: AppStyles.bodyMedium.copyWith(
            color: isSelected ? AppColors.white : AppColors.textPrimary,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context, bool isFromDate) async {
    final currentState = context.read<BookingCubit>().state;
    if (currentState is BookingFormLoaded) {
      final initialDate =
          isFromDate
              ? currentState.form.fromDate ?? DateTime.now()
              : currentState.form.toDate ??
                  currentState.form.fromDate ??
                  DateTime.now();

      final selectedDate = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 365)),
      );

      if (selectedDate != null) {
        if (isFromDate) {
          context.read<BookingCubit>().updateFromDate(selectedDate);
        } else {
          context.read<BookingCubit>().updateToDate(selectedDate);
        }
      }
    }
  }

  Future<void> _selectTime(BuildContext context, bool isFromTime) async {
    final currentState = context.read<BookingCubit>().state;
    if (currentState is BookingFormLoaded) {
      final currentTime =
          isFromTime ? currentState.form.fromTime : currentState.form.toTime;

      final timeParts = currentTime.split(':');
      final initialTime = TimeOfDay(
        hour: int.parse(timeParts[0]),
        minute: int.parse(timeParts[1]),
      );

      final selectedTime = await showTimePicker(
        context: context,
        initialTime: initialTime,
      );

      if (selectedTime != null) {
        final timeString =
            '${selectedTime.hour.toString().padLeft(2, '0')}:${selectedTime.minute.toString().padLeft(2, '0')}';

        if (isFromTime) {
          context.read<BookingCubit>().updateFromTime(timeString);
        } else {
          context.read<BookingCubit>().updateToTime(timeString);
        }
      }
    }
  }
}
