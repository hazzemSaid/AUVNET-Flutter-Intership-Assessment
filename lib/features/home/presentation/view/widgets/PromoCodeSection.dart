import 'package:ecommerce/core/constants/AppTextStyles.dart';
import 'package:ecommerce/features/home/presentation/view/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class PromoCodeSection extends StatelessWidget {
  const PromoCodeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: double.infinity,
      padding: const EdgeInsets.only(
        left: HomeScreen.horizontalPadding,
        bottom: 20.0,
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
            width: 150,
            height: 100,
            child: Stack(
              alignment: Alignment.center,
              children: [
                const Image(
                  image: Svg('assets/images/SecurityVault.svg'),
                  width: 150,
                  height: 100,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  right: 14,
                  left: 1,
                  bottom: 13,
                  child: Image.asset(
                    'assets/images/N-removebg-preview.png',
                    fit: BoxFit.contain,
                    width: 50,
                    height: 50,
                    alignment: Alignment.bottomCenter,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16.0),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Got a code!", style: AppTextStyles.heading4),
                SizedBox(height: 8.0),
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
