import 'package:ecommerce/features/auth/data/models/user_model.dart';
import 'package:hive/hive.dart';

abstract class AuthLocalDataSource {
  Future<void> cacheUser(UserModel user);
  Future<UserModel?> getCachedUser();
  Future<void> clearCachedUser();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final Box _box;

  AuthLocalDataSourceImpl(this._box);

  static const String _userKey = 'user';

  @override
  Future<void> cacheUser(UserModel user) async {
    await _box.put(_userKey, user.toJson());
  }

  @override
  Future<UserModel?> getCachedUser() async {
    final json = _box.get(_userKey);
    if (json != null) {
      return UserModel.fromJson(Map<String, dynamic>.from(json));
    } else {
      return null;
    }
  }

  @override
  Future<void> clearCachedUser() async {
    await _box.delete(_userKey);
  }
}
