import 'package:cleanarchetectureflutterguy/Domain/detailsscreen/entity.dart';
import 'package:cleanarchetectureflutterguy/Domain/detailsscreen/repository.dart';

import '../../Data/detailsscreen/repositoryimpl.dart';

class DetailsUsecase {
  Detailsscreenrepository detailsscreenrepository = Detailrepositoryimpl();
  Future<DetailsEntity> functionforpage({required String id}){
    return detailsscreenrepository.usecases(id:id);
  }
}