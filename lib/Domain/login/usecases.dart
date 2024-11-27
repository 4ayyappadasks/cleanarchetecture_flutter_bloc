import 'package:cleanarchetectureflutterguy/Data/login/repositoryimpl.dart';
import 'package:cleanarchetectureflutterguy/Domain/login/entity.dart';
import 'package:cleanarchetectureflutterguy/Domain/login/repository.dart';

class LoginUsecases {
  LoginRepository loginRepository = LoginRepositoryimpl();
  Future<LoginEntity> datasourcefunction ({required String email, required String password})
  {
    final data = loginRepository.functionforusecases(email:email, password:password);
    return data;
  }
}