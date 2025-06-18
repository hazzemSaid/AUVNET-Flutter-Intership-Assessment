import 'package:bloc/bloc.dart';
import 'package:ecommerce/core/errors/autherror.dart';
import 'package:ecommerce/features/auth/domain/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc(this.authRepository) : super(AuthInitial()) {
    on<AppStarted>(_onAppStarted);
    on<LoggedIn>(_onLoggedIn);
    on<LoggedOut>(_onLoggedOut);
    on<LoginRequested>(_onLoginRequested);
    on<SignupRequested>(_onSignUpRequested);
  }
  void _onAppStarted(AppStarted event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final user = await authRepository.getCurrentUser();
      if (user != null) {
        emit(AuthAuthenticated(user.uid));
      } else {
        emit(AuthUnauthenticated());
      }
    } on FirebaseAuthException catch (e) {
      final error = AuthErrorexp.fromCode(e.code);
      emit(AuthError(error.message));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  void _onLoggedIn(LoggedIn event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final user = await authRepository.login(
        email: event.uid,
        password: event.uid,
      );
      emit(AuthAuthenticated(user.uid));
    } on FirebaseAuthException catch (e) {
      final error = AuthErrorexp.fromCode(e.code);
      emit(AuthError(error.message));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  void _onLoggedOut(LoggedOut event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await authRepository.logout();
      emit(AuthUnauthenticated());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  void _onLoginRequested(LoginRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final user = await authRepository.login(
        email: event.email,
        password: event.password,
      );
      emit(AuthAuthenticated(user.uid));
    } on FirebaseAuthException catch (e) {
      final error = AuthErrorexp.fromCode(e.code);
      emit(AuthError(error.message));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  void _onSignUpRequested(
    SignupRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final user = await authRepository.register(
        email: event.email,
        password: event.password,
      );
      emit(AuthAuthenticated(user.uid));
    } on FirebaseAuthException catch (e) {
      final error = AuthErrorexp.fromCode(e.code);
      emit(AuthError(error.message));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
