import 'package:ecommerce/features/introdactions/presentation/widgets/onboardingsliderwidget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatefulWidget {
  OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final List<String> headlines = [
    "all-in-one delivery",
    "User-to-User Delivery",
    "Sales & Discounts",
  ];

  final List<String> secondLines = [
    "Order groceries, medicines, and meals delivered straight to your door",
    "Send or receive items from other users quickly and easily",
    "Discover exclusive sales and deals every day",
  ];
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        dragStartBehavior: DragStartBehavior.down,
        onPageChanged: (index) {
          if (index == 3) {
            GoRouter.of(context).go("/login");
          }
        },
        itemBuilder: (context, index) {
          if (index < 3) {
            return OnboardingSlideWidget(
              headline: headlines[index],
              secondLine: secondLines[index],
              pageController: _pageController,
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
