import 'package:ecommerce/core/constants/AppTextStyles.dart';
import 'package:ecommerce/features/home/presentation/view/screens/home_screen.dart';
import 'package:flutter/material.dart';

class ShortcutCard extends StatelessWidget {
  final String title;
  final int imageIndex;
  final VoidCallback onTap;

  const ShortcutCard({
    super.key,
    required this.title,
    required this.imageIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(HomeScreen.cardBorderRadius),
        ),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: const BorderRadius.all(
          Radius.circular(HomeScreen.cardBorderRadius),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/Shortcuts${imageIndex}.png",
                width: 50,
                height: 50,
                fit: BoxFit.contain,
              ),

              const SizedBox(height: 4),
              Text(
                title,
                style: AppTextStyles.bodySmall.copyWith(
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
