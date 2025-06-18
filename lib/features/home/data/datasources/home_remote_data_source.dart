import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/features/home/data/models/restaurants_model.dart';
import 'package:ecommerce/features/home/data/models/services_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<RestaurantsModel>> getProducts();
  Future<List<ServicesModel>> getservces();
}

class HomeRemoteDataSourceFirebaseImpl extends HomeRemoteDataSource {
  final FirebaseFirestore firestore;

  HomeRemoteDataSourceFirebaseImpl(this.firestore);

  @override
  Future<List<RestaurantsModel>> getProducts() async {
    final snapshot = await firestore.collection('products').get();
    return snapshot.docs.map(RestaurantsModel.fromFirestore).toList();
  }

  @override
  Future<List<ServicesModel>> getservces() async {
    final snapshot = await firestore.collection('Services').get();
    return snapshot.docs.map(ServicesModel.fromFirestore).toList();
  }
}
