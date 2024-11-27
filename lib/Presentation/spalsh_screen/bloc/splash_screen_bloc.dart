import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

part 'splash_screen_event.dart';
part 'splash_screen_state.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  SplashScreenBloc() : super(SplashScreenInitial()) {
    on<SplashScreenEvent>((event, emit) async{
      emit(SplashScreenInitial());
      if (kDebugMode) {
        print("splash bloc is waiting");
      }
      emit(SplashScreenLoading());
      if (kDebugMode) {
        print("splash bloc is loading");
      }
      try{
       await Future.delayed(const Duration(seconds: 3),
              () {
          emit(SplashScreenLoaded());
          },);
        if (kDebugMode) {
          print("splash bloc is loaded");
        }
      }catch(e)
      {
        emit(SplashScreenError(errormsg: e.toString()));
        if (kDebugMode) {
          print("splash bloc is error");
        }
      }
    });
  }
}
