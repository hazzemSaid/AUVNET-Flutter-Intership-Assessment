import 'package:ecommerce/features/home/domain/entities/restaurants.dart';
import 'package:ecommerce/features/home/domain/entities/services.dart';

abstract class HomeRepository {
  Future<List<Restaurants>> getRestaurants();
  Future<List<Services>> getservices();
}
