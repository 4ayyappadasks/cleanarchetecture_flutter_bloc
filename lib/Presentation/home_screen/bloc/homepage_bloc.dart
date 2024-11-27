import 'package:bloc/bloc.dart';
import 'package:cleanarchetectureflutterguy/Domain/homepage/entity.dart';
import 'package:cleanarchetectureflutterguy/Domain/homepage/usecases.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'homepage_event.dart';
part 'homepage_state.dart';

class HomepageBloc extends Bloc<HomepageEvent, HomepageState> {
  HomepageBloc() : super(HomepageInitial()) {
    on<Loadhomedata>((event, emit) async{
      emit(HomepageInitial());
      print("bloc is initialized");
      emit(HomepageLoading());
      print("bloc is loading");
      try{
        final data = await Homepageusecases().functionforentity();
        emit(HomepageLoaded(homepageentity: data));
      }
          catch(e){
        emit(HomepageError(errormsg: "${e.toString()}"));
          }
    });
  }
}
