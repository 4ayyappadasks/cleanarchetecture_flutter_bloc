import 'package:cleanarchetectureflutterguy/Data/homepage/datasource.dart';
import 'package:cleanarchetectureflutterguy/Domain/homepage/entity.dart';
import 'package:cleanarchetectureflutterguy/Domain/homepage/repository.dart';

class HomepageRepositoryimpl extends HomepageRepository{
  Homepagedatasource homepagedatasource = Homepagedatasourceimpl();
  @override
  Future<Homepageentity> functionforusecases() {
    return homepagedatasource.Apicall();
  }

}