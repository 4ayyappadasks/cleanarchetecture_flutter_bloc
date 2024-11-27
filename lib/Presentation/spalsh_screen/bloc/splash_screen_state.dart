part of 'splash_screen_bloc.dart';

@immutable
sealed class SplashScreenState extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class SplashScreenInitial extends SplashScreenState {}
final class SplashScreenLoading extends SplashScreenState {}
final class SplashScreenLoaded extends SplashScreenState {}
final class SplashScreenError extends SplashScreenState {
  SplashScreenError({required String errormsg});
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
