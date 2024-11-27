import 'package:cleanarchetectureflutterguy/Domain/detailsscreen/entity.dart';

abstract class Detailsscreenrepository
{
  Future<DetailsEntity> usecases({required String id});
}