import 'package:ecommerce/features/auth/domain/entities/user.dart';
import 'package:ecommerce/features/auth/domain/repositories/auth_repository.dart';

class SignupUserUsecase {
  final AuthRepository repository;

  SignupUserUsecase(this.repository);

  Future<User> call({required String email, required String password}) {
    return repository.register(email: email, password: password);
  }
}
