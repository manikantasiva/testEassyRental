import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../domain/entities/car_entity.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/styles/app_styles.dart';

class CarCard extends StatelessWidget {
  final CarEntity car;
  final VoidCallback? onTap;

  const CarCard({super.key, required this.car, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: AppStyles.cardDecoration,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              child: Container(
                width: 120,
                height: 100,
                decoration: BoxDecoration(color: AppColors.lightGrey),
                child: _buildCarImage(car.imageUrl),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      car.name,
                      style: AppStyles.headingSmall,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Rs \ ${car.pricePerDay.toInt()}/Day',
                      style: AppStyles.priceMedium,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          size: 16,
                          color: AppColors.yellow,
                        ),
                        const SizedBox(width: 4),
                        Text(car.rating.toString(), style: AppStyles.rating),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 36,
                            decoration: AppStyles.primaryButtonDecoration,
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: onTap,
                                borderRadius: BorderRadius.circular(8),
                                child: const Center(
                                  child: Text(
                                    'Book Now',
                                    style: AppStyles.buttonMedium,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            color: AppColors.red,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.favorite,
                            size: 18,
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
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
              size: 40,
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
                  strokeWidth: 2,
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
              size: 40,
              color: AppColors.grey,
            ),
          );
        },
        memCacheWidth: 200,
        memCacheHeight: 150,
        maxWidthDiskCache: 300,
        maxHeightDiskCache: 200,
        cacheKey: imageUrl,
        httpHeaders: const {'User-Agent': 'TestEasyRental/1.0'},
      );
    }
  }
}
