part of 'homepage_bloc.dart';

@immutable
sealed class HomepageEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Loadhomedata extends HomepageEvent {}
