part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class AppStarted extends AuthEvent {} // For checking existing session

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
