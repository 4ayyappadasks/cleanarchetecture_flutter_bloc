part of 'passwordfiels_bloc.dart';

@immutable
sealed class PasswordfielsState {
  PasswordfielsState({required this.hide});
  final bool hide;
}

final class PasswordfielsInitial extends PasswordfielsState {
  PasswordfielsInitial():super(hide: false);
}

final class Passwordfielsshow extends PasswordfielsState {
  Passwordfielsshow():super(hide: true);
}

final class Passwordfielshide extends PasswordfielsState {
  Passwordfielshide():super(hide: false);
}
