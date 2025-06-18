import 'package:ecommerce/features/home/domain/entities/restaurants.dart';

import '../repositories/home_repository.dart';

class GetProducts {
  final HomeRepository repository;

  GetProducts(this.repository);

  Future<List<Restaurants>> call() => repository.getRestaurants();
}
