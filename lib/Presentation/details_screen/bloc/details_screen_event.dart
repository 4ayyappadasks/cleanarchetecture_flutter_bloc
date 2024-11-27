part of 'details_screen_bloc.dart';

@immutable
sealed class DetailsScreenEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Detailsscreenloadevent extends DetailsScreenEvent{
  Detailsscreenloadevent({required this.id});
  final String id;
  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
