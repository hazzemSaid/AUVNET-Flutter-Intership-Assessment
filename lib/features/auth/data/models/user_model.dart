import '../../domain/entities/user.dart';

class UserModel extends User {
  const UserModel({required super.uid, required super.email});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(uid: json['uid'], email: json['email']);
  }

  Map<String, dynamic> toJson() => {'uid': uid, 'email': email};

  User toEntity() => this;
}
