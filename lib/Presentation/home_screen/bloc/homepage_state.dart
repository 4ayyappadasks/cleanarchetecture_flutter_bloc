part of 'homepage_bloc.dart';

@immutable
sealed class HomepageState extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class HomepageInitial extends HomepageState {}
final class HomepageLoading extends HomepageState {}
final class HomepageLoaded extends HomepageState {
  HomepageLoaded({required this.homepageentity});
  Homepageentity homepageentity;
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
final class HomepageError extends HomepageState {
  HomepageError({required this.errormsg});
  final String errormsg;
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
