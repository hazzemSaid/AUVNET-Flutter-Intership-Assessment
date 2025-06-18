import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/features/home/domain/entities/services.dart';

class ServicesModel extends Services {
  ServicesModel({
    required super.discount,
    required super.image,
    required super.name,
  });

  Map<String, dynamic> toMap() {
    return {'discount': discount, 'image': image, 'name': name};
  }

  factory ServicesModel.fromJson(Map<String, dynamic> json) {
    return ServicesModel(
      discount: json['discount'] ?? '',
      image: json['image'] ?? '',
      name: json['name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'discount': discount, 'image': image, 'name': name};
  }

  factory ServicesModel.fromMap(Map<String, dynamic> map) {
    return ServicesModel(
      discount: map['discount'] ?? '',
      image: map['image'] ?? '',
      name: map['name'] ?? '',
    );
  }

  factory ServicesModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return ServicesModel(
      discount: data['discount'] ?? '',
      image: data['image'] ?? '',
      name: data['name'] ?? '',
    );
  }
}
