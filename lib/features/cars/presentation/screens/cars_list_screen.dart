import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../bloc/car_cubit.dart';
import '../bloc/car_state.dart';
import '../widgets/car_card.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/styles/app_styles.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../shared/widgets/shimmer_card.dart';

class CarsListScreen extends StatelessWidget {
  const CarsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CarCubit>().resetAndLoadAllCars();
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'All Cars',
          style: AppStyles.headingSmall.copyWith(fontWeight: FontWeight.w400),
        ),
        backgroundColor: AppColors.lightBackground,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.textPrimary),
          onPressed: () => context.pop(),
        ),
      ),
      backgroundColor: AppColors.lightBackground,
      body: BlocBuilder<CarCubit, CarState>(
        builder: (context, state) {
          if (state is CarLoading) {
            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: 6,
              itemBuilder: (context, index) => const CarCardShimmer(),
            );
          } else if (state is CarLoaded) {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<CarCubit>().resetAndLoadAllCars();
                await Future.delayed(const Duration(milliseconds: 500));
              },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Available Cars', style: AppStyles.headingLarge),
                        Text(
                          '${state.cars.length} cars',
                          style: AppStyles.bodyMedium.copyWith(
                            color: AppColors.grey,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    ...state.cars.map(
                      (car) => CarCard(
                        car: car,
                        onTap: () {
                          context.push(
                            AppConstants.carDetailsRoute.replaceAll(
                              ':carId',
                              car.id,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (state is CarError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.error_outline,
                    color: AppColors.error,
                    size: 64,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Failed to load cars',
                    style: AppStyles.headingMedium.copyWith(
                      color: AppColors.error,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    state.message,
                    style: AppStyles.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.read<CarCubit>().resetAndLoadAllCars();
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
