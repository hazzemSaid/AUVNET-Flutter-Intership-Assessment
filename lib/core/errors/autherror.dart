// auth_error.dart

class AuthErrorexp {
  final String code;
  final String message;

  AuthErrorexp({required this.code, required this.message});

  factory AuthErrorexp.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return AuthErrorexp(
          code: code,
          message: 'The email address is badly formatted.',
        );
      case 'user-disabled':
        return AuthErrorexp(
          code: code,
          message: 'This user has been disabled.',
        );
      case 'user-not-found':
        return AuthErrorexp(
          code: code,
          message: 'No user found with this email.',
        );
      case 'wrong-password':
        return AuthErrorexp(code: code, message: 'Wrong password provided.');
      case 'email-already-in-use':
        return AuthErrorexp(
          code: code,
          message: 'The account already exists for that email.',
        );
      case 'operation-not-allowed':
        return AuthErrorexp(
          code: code,
          message: 'Operation not allowed. Please contact support.',
        );
      case 'weak-password':
        return AuthErrorexp(
          code: code,
          message: 'The password provided is too weak.',
        );
      default:
        return AuthErrorexp(
          code: code,
          message: 'An unknown error occurred: $code',
        );
    }
  }
}
