import 'package:bloc/bloc.dart';
import 'package:cleanarchetectureflutterguy/Domain/homepagetopwidget/entity.dart';
import 'package:cleanarchetectureflutterguy/Domain/homepagetopwidget/usecases.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'topwidgets_event.dart';
part 'topwidgets_state.dart';

class TopwidgetsBloc extends Bloc<TopwidgetsEvent, TopwidgetsState> {
  TopwidgetsBloc() : super(TopwidgetsInitial()) {
    on<TopwidgetEvents>((event, emit) async{
      emit(TopwidgetsInitial());
      print("bloc is initialized");
      emit(TopwidgetsLoading());
      print("bloc is loading");
      try{
        final data = await Topwidgetusecases().functionforbloc();
        emit(TopwidgetsLoaded(topwidgetentity: data));
      }
          catch(e){
        emit(TopwidgetsError(ermsg: e.toString()));
          }
    });
  }
}
