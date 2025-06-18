import 'package:ecommerce/features/home/domain/entities/restaurants.dart';

import '../repositories/home_repository.dart';

class Getrestaurants {
  final HomeRepository repository;

  Getrestaurants(this.repository);

  Future<List<Restaurants>> call() => repository.getRestaurants();
}
