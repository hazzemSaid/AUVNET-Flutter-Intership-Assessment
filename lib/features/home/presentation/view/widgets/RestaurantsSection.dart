import 'package:ecommerce/core/constants/AppTextStyles.dart';
import 'package:ecommerce/features/home/presentation/view/screens/home_screen.dart';
import 'package:ecommerce/features/home/presentation/view/widgets/RestaurantCard.dart';
import 'package:flutter/material.dart';

class RestaurantsSection extends StatelessWidget {
  const RestaurantsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: HomeScreen.horizontalPadding,
          ),
          child: Text(
            'Popular restaurants nearby',
            style: AppTextStyles.heading4.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 200,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(
              horizontal: HomeScreen.horizontalPadding,
            ),
            separatorBuilder: (context, index) => const SizedBox(width: 12.0),
            itemCount: HomeScreen.restaurantCount,
            itemBuilder: (context, index) {
              return RestaurantCard(index: index);
            },
          ),
        ),
      ],
    );
  }
}
