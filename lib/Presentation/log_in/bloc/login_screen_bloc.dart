import 'package:bloc/bloc.dart';
import 'package:cleanarchetectureflutterguy/Data/login/model.dart';
import 'package:cleanarchetectureflutterguy/Domain/login/entity.dart';
import 'package:cleanarchetectureflutterguy/Domain/login/usecases.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'login_screen_event.dart';

part 'login_screen_state.dart';

class LoginScreenBloc extends Bloc<LoginScreenEvent, LoginScreenState> {
  LoginScreenBloc() : super(ShowPasswordState(hidePassword: true)) {
    /// toggle password
    on<HidePasswordEvent>((event, emit) {
      if (state is ShowPasswordState) {
        final currentState = state as ShowPasswordState;
        print("currentState : $currentState");
        emit(ShowPasswordState(hidePassword: !currentState.hidePassword));
      }
    });

    /// log in api
    on<LoginEvent>((event, emit) async {
      emit(LoginScreenInitial());
      print("login bloc waiting");
      emit(LoginScreenLoading());
      print("login bloc loading");
      try {
        final data = await LoginUsecases()
            .datasourcefunction(email: event.email, password: event.password);
        emit(LoginScreenLoaded(loginEntity: data));
      } catch (e) {
        print("eeeror : $e");
        emit(LoginScreenError(msg: e.toString()));
      }
    });
  }
}
