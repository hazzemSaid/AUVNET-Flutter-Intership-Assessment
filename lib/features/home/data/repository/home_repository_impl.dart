import 'package:ecommerce/features/home/data/datasources/home_local_data_source.dart';
import 'package:ecommerce/features/home/domain/entities/restaurants.dart';
import 'package:ecommerce/features/home/domain/entities/services.dart';

import '../../domain/repositories/home_repository.dart';
import '../datasources/home_remote_data_source.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeRemoteDataSource remoteDataSource;
  final HomeLocalDataSource localDataSource;

  HomeRepositoryImpl(this.remoteDataSource, this.localDataSource);

  @override
  Future<List<Restaurants>> getRestaurants() async {
    try {
      final products = await remoteDataSource.getProducts();
      await localDataSource.cacherestourants(products);
      return products;
    } catch (e) {
      final cached = await localDataSource.getCacherestourants();
      return cached;
    }
  }

  @override
  Future<List<Services>> getservices() async {
    final services = await remoteDataSource.getservces();
    await localDataSource.cacheservices(services);
    return services;
  }
}
