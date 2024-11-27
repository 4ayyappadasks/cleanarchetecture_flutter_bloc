import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cleanarchetectureflutterguy/Domain/detailsscreen/entity.dart';
import 'package:cleanarchetectureflutterguy/Domain/detailsscreen/usecases.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'details_screen_event.dart';
part 'details_screen_state.dart';

class DetailsScreenBloc extends Bloc<DetailsScreenEvent, DetailsScreenState> {
  DetailsScreenBloc() : super(DetailsScreenInitial()) {
    on<Detailsscreenloadevent>((event, emit) async{
      emit(DetailsScreenInitial());
      print("details screen initialized");
      emit(DetailsScreenLoading());
      print("details screen initialized");
      try{
        final data = await DetailsUsecase().functionforpage(id: event.id);
        emit(DetailsScreenLoaded(detailsEntity: data));
      }
          catch(e)
      {
        log("error in delivery page : ${e}");
        emit(DetailsScreenError(ermsg: e.toString()));
      }
    });
  }
}
