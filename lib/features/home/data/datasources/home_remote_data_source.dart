import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/features/home/data/models/restaurants_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<RestaurantsModel>> getProducts();
}

class HomeRemoteDataSourceFirebaseImpl extends HomeRemoteDataSource {
  final FirebaseFirestore firestore;

  HomeRemoteDataSourceFirebaseImpl(this.firestore);

  @override
  Future<List<RestaurantsModel>> getProducts() async {
    final snapshot = await firestore.collection('products').get();
    return snapshot.docs.map(RestaurantsModel.fromFirestore).toList();
  }
}
