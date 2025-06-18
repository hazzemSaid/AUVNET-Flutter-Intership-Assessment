import 'package:ecommerce/features/home/data/models/restaurants_model.dart';

import '../../domain/repositories/home_repository.dart';
import '../datasources/home_remote_data_source.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<RestaurantsModel>> getRestaurants() async {
    return await remoteDataSource.getProducts();
  }
}
