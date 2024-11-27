import 'package:cleanarchetectureflutterguy/Data/login/datasource.dart';
import 'package:cleanarchetectureflutterguy/Domain/login/entity.dart';
import 'package:cleanarchetectureflutterguy/Domain/login/repository.dart';

class LoginRepositoryimpl implements LoginRepository{
  LogindataSource logindataSource = LogindataSourceimpl();
  @override
  Future<LoginEntity> functionforusecases({required String email, required String  password}) async{
    final data = logindataSource.apicall(email: email, password: password);
    return data;
  }
}