import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'passwordfiels_event.dart';

part 'passwordfiels_state.dart';

class PasswordfielsBloc extends Bloc<PasswordfielsEvent, PasswordfielsState> {
  PasswordfielsBloc() : super(PasswordfielsInitial()) {
    on<Showpasswordevent>((event, emit) {
      if (state.hide) {
        emit(Passwordfielshide());
      } else {
        emit(Passwordfielsshow());
      }
    });
  }
}
