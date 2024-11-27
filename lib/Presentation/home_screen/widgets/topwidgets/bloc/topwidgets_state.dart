part of 'topwidgets_bloc.dart';

@immutable
sealed class TopwidgetsState extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class TopwidgetsInitial extends TopwidgetsState {}

final class TopwidgetsLoading extends TopwidgetsState {}

final class TopwidgetsLoaded extends TopwidgetsState {
  TopwidgetsLoaded({required this.topwidgetentity});
  Topwidgetentity topwidgetentity;
  @override
  // TODO: implement props
  List<Object?> get props => [topwidgetentity];
}

final class TopwidgetsError extends TopwidgetsState {
  TopwidgetsError({required this.ermsg});
  String ermsg;
  @override
  // TODO: implement props
  List<Object?> get props => [ermsg];
}
