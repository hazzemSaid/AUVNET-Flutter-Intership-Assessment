part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class AppStarted extends AuthEvent {}

class LoggedIn extends AuthEvent {
  final String uid;
  LoggedIn(this.uid);
}

class LoggedOut extends AuthEvent {}

class LoginRequested extends AuthEvent {
  final String email;
  final String password;

  LoginRequested({required this.email, required this.password});
}

class SignupRequested extends AuthEvent {
  final String email;
  final String password;
  final String confirmPassword;

  SignupRequested({
    required this.email,
    required this.password,
    required this.confirmPassword,
  });
}
