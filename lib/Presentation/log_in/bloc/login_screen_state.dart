part of 'login_screen_bloc.dart';

@immutable
sealed class LoginScreenState extends Equatable {
  @override
  List<Object?> get props => [];
}

/// toggle password
final class ShowPasswordState extends LoginScreenState {
  final bool hidePassword;

  ShowPasswordState({required this.hidePassword});

  @override
  List<Object?> get props => [hidePassword];
}

/// login
final class LoginScreenInitial extends LoginScreenState {}

final class LoginScreenLoading extends LoginScreenState {}

final class LoginScreenLoaded extends LoginScreenState {
  LoginScreenLoaded({required this.loginEntity});

  final LoginEntity loginEntity;
}

final class LoginScreenError extends LoginScreenState {
  LoginScreenError({required this.msg});
  final String msg;
}
