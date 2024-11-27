import 'package:cleanarchetectureflutterguy/Data/detailsscreen/datasource.dart';
import 'package:cleanarchetectureflutterguy/Domain/detailsscreen/entity.dart';
import 'package:cleanarchetectureflutterguy/Domain/detailsscreen/repository.dart';

class Detailrepositoryimpl implements Detailsscreenrepository{
  DetailsDatasource detailsDatasource = DetailsDatasiurceimpl();
  @override
  Future<DetailsEntity> usecases({required String id}) {
    return detailsDatasource.Apicall(id: id);
  }
}