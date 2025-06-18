import 'package:ecommerce/core/Dependency_njection/service_locator.dart';
import 'package:ecommerce/features/home/presentation/bloc/home_bloc_bloc.dart';
import 'package:ecommerce/features/home/presentation/bloc/home_bloc_event.dart';
import 'package:ecommerce/features/home/presentation/bloc/services_bloc/services_bloc.dart';
import 'package:ecommerce/features/home/presentation/view/widgets/HeaderSection.dart';
import 'package:ecommerce/features/home/presentation/view/widgets/ImageSliderWithListView.dart';
import 'package:ecommerce/features/home/presentation/view/widgets/PromoCodeSection.dart';
import 'package:ecommerce/features/home/presentation/view/widgets/RestaurantsSection.dart';
import 'package:ecommerce/features/home/presentation/view/widgets/ServicesSection.dart';
import 'package:ecommerce/features/home/presentation/view/widgets/ShortcutsSection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const List<String> shortcutsText = [
    "Past orders",
    "Super Saver",
    "Must-tries",
    "Give Back",
    "BestSellers",
  ];

  static const gradientColors = [Color(0xff8900FE), Color(0xffFFDE59)];
  static const borderRadius = 16.0;
  static const cardBorderRadius = 12.0;
  static const horizontalPadding = 20.0;
  static const restaurantCount = 10;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<HomeBloc>()..add(LoadProducts())),
        BlocProvider(
          create: (context) => sl<ServicesBloc>()..add(ServicesLoad()),
        ),
      ],
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              HeaderSection(),
              ServicesSection(),
              PromoCodeSection(),
              SizedBox(height: 20.0),
              ShortcutsSection(),
              SizedBox(height: 20.0),
              ImageSliderWithListView(),
              SizedBox(height: 20.0),
              RestaurantsSection(),
            ],
          ),
        ),
      ),
    );
  }
}
