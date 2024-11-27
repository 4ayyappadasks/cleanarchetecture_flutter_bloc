import 'package:cleanarchetectureflutterguy/Data/homepage/repositoryimpl.dart';
import 'package:cleanarchetectureflutterguy/Domain/homepage/entity.dart';
import 'package:cleanarchetectureflutterguy/Domain/homepage/repository.dart';

class Homepageusecases {
  HomepageRepository homepageRepository = HomepageRepositoryimpl();
  Future<Homepageentity> functionforentity () async{
   return homepageRepository.functionforusecases();
}
}