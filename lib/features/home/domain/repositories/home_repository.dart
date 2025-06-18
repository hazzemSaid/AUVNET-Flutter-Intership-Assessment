import 'package:ecommerce/features/home/domain/entities/restaurants.dart';

abstract class HomeRepository {
  Future<List<Restaurants>> getRestaurants();
}
