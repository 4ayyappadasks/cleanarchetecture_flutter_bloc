import 'package:cleanarchetectureflutterguy/Domain/login/entity.dart';

abstract class LoginRepository {
  Future<LoginEntity> functionforusecases({required String email,required String password});
}