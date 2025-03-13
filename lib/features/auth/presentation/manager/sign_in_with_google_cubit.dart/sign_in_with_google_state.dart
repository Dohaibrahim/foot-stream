abstract class SignInWithGoogleState {}

class SignInWithGoogleLoadingState extends SignInWithGoogleState {}

class SignInWithGoogleInitialState extends SignInWithGoogleState {}

class SignInWithGoogleSuccessState extends SignInWithGoogleState {
  final String uid; // Firebase User ID
  final String? email;
  final String? name;

  SignInWithGoogleSuccessState({
    required this.email,
    required this.name,
    required this.uid,
  });
}

class SignInWithGoogleFailureState extends SignInWithGoogleState {
  final String error;
  SignInWithGoogleFailureState(this.error);
}
