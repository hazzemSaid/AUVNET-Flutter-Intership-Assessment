import 'package:ecommerce/core/constants/AppTextStyles.dart';
import 'package:ecommerce/features/home/presentation/bloc/services_bloc/services_bloc.dart';
import 'package:ecommerce/features/home/presentation/view/screens/home_screen.dart';
import 'package:ecommerce/features/home/presentation/view/widgets/ServiceCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ServicesBloc, ServicesState>(
      builder: (context, state) {
        if (state is ServicesLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is ServicesLoaded) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: HomeScreen.horizontalPadding,
                  vertical: 10.0,
                ),
                child: Text(
                  'Services:',
                  style: AppTextStyles.heading4.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: HomeScreen.horizontalPadding,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 150,
                        width: double.infinity,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.services.length,
                          separatorBuilder: (_, __) =>
                              const SizedBox(width: 12),
                          itemBuilder: (context, index) {
                            final service = state.services[index];
                            return Padding(
                              padding: const EdgeInsets.only(right: 40.0),
                              child: ServiceCard(service: service),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }
        return Center(
          child: Text(
            'Error: ${state is ServicesError ? state.message : 'Unknown error'}',
            style: AppTextStyles.bodyMedium.copyWith(color: Colors.red),
          ),
        );
      },
    );
  }
}
