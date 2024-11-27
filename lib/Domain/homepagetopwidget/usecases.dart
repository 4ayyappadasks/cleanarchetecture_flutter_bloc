import 'package:cleanarchetectureflutterguy/Data/homepagetopwidget/repositoryimpl.dart';
import 'package:cleanarchetectureflutterguy/Domain/homepagetopwidget/entity.dart';
import 'package:cleanarchetectureflutterguy/Domain/homepagetopwidget/repository.dart';

class Topwidgetusecases {
  TopwidgetRepository topwidgetRepository = TopwidgetRepositoryimpl();
  Future<Topwidgetentity> functionforbloc()
  {
    return topwidgetRepository.functionforusecases();
  }
}