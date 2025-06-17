import 'package:ecommerce/core/constants/AppTextStyles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingSlideWidget extends StatelessWidget {
  const OnboardingSlideWidget({
    super.key,
    required this.headline,
    required this.secondLine,
    required this.pageController,
  });

  final String headline;
  final String secondLine;
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Image.asset("assets/images/background_onbording.png"),
              Positioned(
                top: height * 0.12,
                left: 28,
                child: Image.asset("assets/images/nawel.png"),
              ),
            ],
          ),

          SizedBox(height: height * 0.3),

          Align(
            alignment: Alignment.center,
            child: Text(
              headline,
              style: AppTextStyles.heading2.copyWith(fontFamily: "Rubik"),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 16),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Text(
              secondLine,
              style: AppTextStyles.label.copyWith(
                fontFamily: "Rubik",
                color: Colors.grey.shade600,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: height * 0.1),
          InkWell(
            onTap: () {
              GoRouter.of(context).go("/login");
            },
            child: Container(
              width: double.infinity,
              height: 54,

              margin: const EdgeInsets.symmetric(horizontal: 40.0),
              decoration: BoxDecoration(
                color: Color(0xff8900FE),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  "Get Started",
                  style: AppTextStyles.buttonLarge.copyWith(
                    fontFamily: "Rubik",
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Align(
            alignment: Alignment.center,
            child: TextButton(
              onPressed: () {
                pageController.nextPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
              child: Text("next", style: TextStyle(color: Color(0xff677294))),
            ),
          ),
        ],
      ),
    );
  }
}
