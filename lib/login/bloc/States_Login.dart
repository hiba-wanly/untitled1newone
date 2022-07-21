abstract class LoginState{}

class LoginInitState  extends LoginState {}

class LoginLoading extends LoginState {}

class UserLoadingSuccessState extends LoginState {}

class AdminLoadingSucceccState extends LoginState {}

class LoadingErrorState extends LoginState {
  final String message;
  LoadingErrorState({required this.message});
}