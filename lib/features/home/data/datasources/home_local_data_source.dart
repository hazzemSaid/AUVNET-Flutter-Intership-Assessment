import 'package:ecommerce/features/home/data/models/restaurants_model.dart';
import 'package:ecommerce/features/home/data/models/services_model.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource {
  Future<void> cacherestourants(List<RestaurantsModel> products);
  Future<List<RestaurantsModel>> getCacherestourants();
  Future<void> cacheservices(List<ServicesModel> services);
  Future<List<ServicesModel>> getCacheservices();
}

class HomeLocalDataSourceHiveImpl extends HomeLocalDataSource {
  final Box box;

  HomeLocalDataSourceHiveImpl(this.box);

  static const String key = 'cached_restourants';
  static const String keyServices = 'cached_services';

  @override
  Future<void> cacherestourants(List<RestaurantsModel> products) async {
    final List<Map<String, dynamic>> productList = products
        .map((e) => e.toJson())
        .toList();
    await box.put(key, productList);
  }

  @override
  Future<List<RestaurantsModel>> getCacherestourants() async {
    final data = box.get(key, defaultValue: <Map<String, dynamic>>[]);
    if (data is List) {
      return data
          .map((e) => RestaurantsModel.fromJson(Map<String, dynamic>.from(e)))
          .toList();
    }
    return [];
  }

  Future<void> cacheservices(List<ServicesModel> services) async {
    final List<Map<String, dynamic>> serviceList = services
        .map((e) => e.toJson())
        .toList();
    await box.put(keyServices, serviceList);
  }

  @override
  Future<List<ServicesModel>> getCacheservices() async {
    final data = box.get(keyServices, defaultValue: <Map<String, dynamic>>[]);
    if (data is List) {
      return data
          .map((e) => ServicesModel.fromJson(Map<String, dynamic>.from(e)))
          .toList();
    }
    return [];
  }
}
