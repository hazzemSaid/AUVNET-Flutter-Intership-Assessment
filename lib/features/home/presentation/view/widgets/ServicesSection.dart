import 'package:ecommerce/core/constants/AppTextStyles.dart';
import 'package:ecommerce/features/home/presentation/view/screens/home_screen.dart';
import 'package:ecommerce/features/home/presentation/view/widgets/ServiceCard.dart';
import 'package:flutter/material.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: HomeScreen.horizontalPadding,
            vertical: 10.0,
          ),
          child: Text(
            'Services:',
            style: AppTextStyles.heading4.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 10.0),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: HomeScreen.horizontalPadding,
          ),
          child: Row(
            children: [
              ..._buildServiceCards().map((card) => Expanded(child: card)),
            ],
          ),
        ),
      ],
    );
  }

  List<Widget> _buildServiceCards() {
    final services = [
      ('Service 1', 'Description 1'),
      ('Service 2', 'Description 2'),
      ('Service 3', 'Description 3'),
    ];

    return services.asMap().entries.map((entry) {
      final index = entry.key;
      final service = entry.value;

      return Padding(
        padding: EdgeInsets.only(left: index > 0 ? 12.0 : 0),
        child: ServiceCard(
          title: service.$1,
          description: service.$2,
          onTap: () => print('Service ${index + 1} tapped'),
        ),
      );
    }).toList();
  }
}
