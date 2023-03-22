class SignUpWithEmailAndPasswordFailure {
  final String message;

  const SignUpWithEmailAndPasswordFailure(
      [this.message = "An Unknown error occured"]);

  factory SignUpWithEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'weak-password':
        return const SignUpWithEmailAndPasswordFailure(
            'Please enter a stronger password.');
      case 'invalid-email':
        return const SignUpWithEmailAndPasswordFailure(
            'Email is not valid or badly formatted.');
      case 'email-already-in-use':
        return const SignUpWithEmailAndPasswordFailure(
            'An account already exist with this email.');
      case 'operation-not-allowed':
        return const SignUpWithEmailAndPasswordFailure(
            'Operation not allowed. Please contact support.');
      case 'user-disabled':
        return const SignUpWithEmailAndPasswordFailure(
            'This user has been disabled. Please contact support.');
      case 'user-not-found':
        return const SignUpWithEmailAndPasswordFailure('User not found.');
      case 'wrong-password':
        return const SignUpWithEmailAndPasswordFailure('Wrong Credentials.');
      default:
        return const SignUpWithEmailAndPasswordFailure(
            "An Unknown error occured");
    }
  }
}
