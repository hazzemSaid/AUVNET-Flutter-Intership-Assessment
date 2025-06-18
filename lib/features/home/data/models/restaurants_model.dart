import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/features/home/domain/entities/restaurants.dart';

class RestaurantsModel extends Restaurants {
  RestaurantsModel({
    required super.id,
    required super.name,
    required super.image,
    required super.time,
  });

  factory RestaurantsModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return RestaurantsModel(
      id: doc.id,
      name: data['name'] ?? '',
      image: data['image'] ?? '',
      time: data['time'] ?? '',
    );
  }

  factory RestaurantsModel.fromJson(Map<String, dynamic> json) {
    return RestaurantsModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      time: json['time'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'image': image, 'time': time};
  }

  RestaurantsModel copyWith({
    String? id,
    String? name,
    String? image,
    String? time,
  }) {
    return RestaurantsModel(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      time: time ?? this.time,
    );
  }
}
