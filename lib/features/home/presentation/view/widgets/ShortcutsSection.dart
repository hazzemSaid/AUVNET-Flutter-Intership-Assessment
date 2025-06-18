import 'package:ecommerce/core/constants/AppTextStyles.dart';
import 'package:ecommerce/features/home/presentation/view/screens/home_screen.dart';
import 'package:ecommerce/features/home/presentation/view/widgets/ShortcutCard.dart';
import 'package:flutter/material.dart';

class ShortcutsSection extends StatelessWidget {
  const ShortcutsSection({super.key});

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
            'Shortcuts:',
            style: AppTextStyles.heading4.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 10.0),
        SizedBox(
          height: 130,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(
              horizontal: HomeScreen.horizontalPadding,
            ),
            itemCount: HomeScreen.shortcutsText.length,
            itemExtent: 100,
            itemBuilder: (context, index) {
              return ShortcutCard(
                title: HomeScreen.shortcutsText[index],
                imageIndex: index + 1,
                onTap: () => print('Shortcut ${index + 1} tapped'),
              );
            },
          ),
        ),
      ],
    );
  }
}
