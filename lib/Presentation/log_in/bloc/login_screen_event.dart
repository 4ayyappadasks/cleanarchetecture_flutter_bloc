part of 'login_screen_bloc.dart';

@immutable
sealed class LoginScreenEvent extends Equatable {
  @override
  List<Object?> get props => [];
}
/// hide password
class HidePasswordEvent extends LoginScreenEvent {}

/// login
class LoginEvent extends LoginScreenEvent {
  final String email;
  final String password;

  LoginEvent({required this.email, required this.password});
}
