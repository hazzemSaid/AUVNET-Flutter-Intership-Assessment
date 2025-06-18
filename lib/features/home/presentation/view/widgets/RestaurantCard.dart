import 'package:ecommerce/core/constants/AppTextStyles.dart';
import 'package:ecommerce/features/home/domain/entities/restaurants.dart';
import 'package:flutter/material.dart';

class RestaurantCard extends StatelessWidget {
  final int index;
  final Restaurants product;
  const RestaurantCard({super.key, required this.index, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(product.image, height: 80, fit: BoxFit.cover),
          const SizedBox(height: 8.0),
          Text(
            product.name,
            style: AppTextStyles.bodyMedium.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4.0),
          Row(
            children: [
              Icon(Icons.alarm, size: 12, color: Colors.grey[600]),
              const SizedBox(width: 4.0),
              Text(
                product.time,
                style: AppTextStyles.bodySmall.copyWith(
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
