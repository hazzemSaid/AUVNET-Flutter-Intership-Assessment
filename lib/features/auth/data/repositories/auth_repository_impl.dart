import 'package:ecommerce/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:ecommerce/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:ecommerce/features/auth/domain/entities/user.dart';
import 'package:ecommerce/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  final AuthRemoteDataSourceImpl remoteDataSourceImpl;
  final AuthLocalDataSourceImpl localDataSourceImpl;

  AuthRepositoryImpl({
    required this.remoteDataSourceImpl,
    required this.localDataSourceImpl,
  });
  Future<User?> getCurrentUser() async {
    return await localDataSourceImpl.getCachedUser();
  }

  @override
  Future<User> login({required String email, required String password}) async {
    final user = await remoteDataSourceImpl.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    await localDataSourceImpl.cacheUser(user);
    return user;
  }

  @override
  Future<void> logout() async {
    await localDataSourceImpl.clearCachedUser();
    return remoteDataSourceImpl.signOut();
  }

  @override
  Future<User> register({
    required String email,
    required String password,
  }) async {
    final user = await remoteDataSourceImpl.signUpWithEmailAndPassword(
      email: email,
      password: password,
    );
    await localDataSourceImpl.cacheUser(user);
    return user;
  }
}
