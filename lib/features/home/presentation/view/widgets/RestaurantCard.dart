import 'package:ecommerce/core/constants/AppTextStyles.dart';
import 'package:flutter/material.dart';

class RestaurantCard extends StatelessWidget {
  final int index;

  const RestaurantCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/images/nawel.png", height: 80, fit: BoxFit.cover),
          const SizedBox(height: 8.0),
          Text(
            'Restaurant ${index + 1}',
            style: AppTextStyles.bodyMedium.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4.0),
          Text(
            'Cuisine type',
            style: AppTextStyles.bodySmall.copyWith(color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}
