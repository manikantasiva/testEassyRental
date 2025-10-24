import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../bloc/car_details_cubit.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/styles/app_styles.dart';

class CarDetailsScreen extends StatelessWidget {
  final String carId;

  const CarDetailsScreen({super.key, required this.carId});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CarDetailsCubit>().getCarById(carId);
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Car Details', style: AppStyles.headingMedium),
        backgroundColor: AppColors.lightBackground,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.textPrimary),
          onPressed: () => context.pop(),
        ),
      ),
      backgroundColor: AppColors.lightBackground,
      body: BlocBuilder<CarDetailsCubit, CarDetailsState>(
        builder: (context, state) {
          if (state is CarDetailsLoaded) {
            final car = state.car;
            return RefreshIndicator(
              onRefresh: () async {
                context.read<CarDetailsCubit>().getCarById(carId);
                await Future.delayed(const Duration(milliseconds: 500));
              },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 250,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.lightGrey,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(24),
                          bottomRight: Radius.circular(24),
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(24),
                          bottomRight: Radius.circular(24),
                        ),
                        child: _buildCarImage(car.imageUrl),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  car.name,
                                  style: AppStyles.headingLarge,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.yellow.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      size: 16,
                                      color: AppColors.yellow,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      car.rating.toString(),
                                      style: AppStyles.rating,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Rs \\ ${car.pricePerDay.toInt()}/Day',
                            style: AppStyles.priceLarge,
                          ),
                          const SizedBox(height: 16),
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: AppStyles.cardDecoration,
                            child: Column(
                              children: [
                                _buildInfoRow('Brand', car.brand),
                                const SizedBox(height: 12),
                                _buildInfoRow('Model', car.model),
                                const SizedBox(height: 12),
                                _buildInfoRow('Year', car.year.toString()),
                                const SizedBox(height: 12),
                                _buildInfoRow('Seats', '${car.seats} Seats'),
                                const SizedBox(height: 12),
                                _buildInfoRow('Fuel Type', car.fuelType),
                                const SizedBox(height: 12),
                                _buildInfoRow('Transmission', car.transmission),
                                const SizedBox(height: 12),
                                _buildInfoRow('Color', car.color),
                                const SizedBox(height: 12),
                                _buildInfoRow('Location', car.location),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text('Features', style: AppStyles.headingMedium),
                          const SizedBox(height: 12),
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children:
                                car.features.map((feature) {
                                  return Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 6,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.primary.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Text(
                                      feature,
                                      style: AppStyles.bodySmall.copyWith(
                                        color: AppColors.primary,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  );
                                }).toList(),
                          ),
                          const SizedBox(height: 20),
                          Text('Description', style: AppStyles.headingMedium),
                          const SizedBox(height: 12),
                          Text(car.description, style: AppStyles.bodyMedium),
                          const SizedBox(height: 30),
                          SizedBox(
                            width: double.infinity,
                            height: 56,
                            child: ElevatedButton(
                              onPressed: () {
                                context.push(
                                  '/booking-form/${car.id}/${Uri.encodeComponent(car.name)}',
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary,
                                foregroundColor: AppColors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Text(
                                'Book Now - \\ ${car.pricePerDay.toInt()}/Day',
                                style: AppStyles.buttonLarge,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (state is CarDetailsError) {
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
                    'Failed to load car details',
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
                      context.read<CarDetailsCubit>().getCarById(carId);
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.primary,
                strokeWidth: 3,
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppStyles.bodyMedium.copyWith(color: AppColors.grey),
        ),
        Text(
          value,
          style: AppStyles.bodyMedium.copyWith(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

  Widget _buildCarImage(String imageUrl) {
    if (imageUrl.startsWith('assets/')) {
      return Image.asset(
        imageUrl,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            color: AppColors.lightGrey,
            child: const Icon(
              Icons.directions_car,
              size: 80,
              color: AppColors.grey,
            ),
          );
        },
      );
    } else {
      return CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        placeholder:
            (context, url) => Container(
              color: AppColors.lightGrey,
              child: const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
                ),
              ),
            ),
        errorWidget: (context, url, error) {
          print('Image load error: $error for URL: $url');
          return Container(
            color: AppColors.lightGrey,
            child: const Icon(
              Icons.directions_car,
              size: 80,
              color: AppColors.grey,
            ),
          );
        },
        memCacheWidth: 400,
        memCacheHeight: 300,
        maxWidthDiskCache: 600,
        maxHeightDiskCache: 400,
        cacheKey: imageUrl,
        httpHeaders: const {'User-Agent': 'TestEasyRental/1.0'},
      );
    }
  }
}
