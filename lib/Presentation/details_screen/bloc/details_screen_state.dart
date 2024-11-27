part of 'details_screen_bloc.dart';

@immutable
sealed class DetailsScreenState extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class DetailsScreenInitial extends DetailsScreenState {}

final class DetailsScreenLoading extends DetailsScreenState {}

final class DetailsScreenLoaded extends DetailsScreenState {
  DetailsScreenLoaded({required this.detailsEntity});
  DetailsEntity detailsEntity;
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class DetailsScreenError extends DetailsScreenState {
  DetailsScreenError({required this.ermsg});
  final String ermsg;
  @override
  // TODO: implement props
  List<Object?> get props => [ermsg];
}
