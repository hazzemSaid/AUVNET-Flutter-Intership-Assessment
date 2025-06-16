import 'package:ecommerce/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:ecommerce/features/auth/domain/entities/user.dart';
import 'package:ecommerce/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  final AuthRemoteDataSourceImpl remoteDataSourceImpl;
  AuthRepositoryImpl({required this.remoteDataSourceImpl});
  Future<User?> getCurrentUser() {
    return remoteDataSourceImpl.getCurrentUser();
  }

  @override
  Future<User> login({required String email, required String password}) {
    return remoteDataSourceImpl.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> logout() {
    return remoteDataSourceImpl.signOut();
  }

  @override
  Future<User> register({required String email, required String password}) {
    return remoteDataSourceImpl.signUpWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
