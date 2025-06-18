import 'package:ecommerce/core/constants/AppTextStyles.dart';
import 'package:ecommerce/features/home/presentation/view/screens/home_screen.dart';
import 'package:flutter/material.dart';

class PromoCodeSection extends StatelessWidget {
  const PromoCodeSection({super.key});
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: 110,
      width: screenWidth - 40,
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      padding: const EdgeInsets.only(
        left: HomeScreen.horizontalPadding,
        right: HomeScreen.horizontalPadding,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: const BorderRadius.all(Radius.circular(30.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 90,
            child: Image.asset(
              "assets/images/Shortcuts2.png",
              width: 90,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12.0),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Got a code!", style: AppTextStyles.heading4),
                SizedBox(height: 6.0),
                Text(
                  "Add your code and save on your order",
                  style: TextStyle(fontSize: 14.0, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
