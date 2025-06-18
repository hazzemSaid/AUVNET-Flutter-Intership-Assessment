import 'dart:developer';

import 'package:ecommerce/core/constants/AppTextStyles.dart';
import 'package:ecommerce/features/home/domain/entities/services.dart';
import 'package:ecommerce/features/home/presentation/view/screens/home_screen.dart';
import 'package:flutter/material.dart';

class ServiceCard extends StatelessWidget {
  final Services service;

  const ServiceCard({required this.service, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        log("Service Card Tapped: ${service.name}");
      },
      borderRadius: const BorderRadius.all(
        Radius.circular(HomeScreen.cardBorderRadius),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(service.image, fit: BoxFit.cover),
            const SizedBox(height: 8.0),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 2.0,
                vertical: 1.0,
              ),
              decoration: BoxDecoration(
                color: const Color(0xff8900FE),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                service.discount,
                style: AppTextStyles.heading6.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                ),
              ),
            ),
            const SizedBox(height: 4.0),

            Text(
              service.name,
              style: AppTextStyles.heading6.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
