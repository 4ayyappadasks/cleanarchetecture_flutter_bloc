import 'package:cleanarchetectureflutterguy/Data/homepagetopwidget/datasource.dart';
import 'package:cleanarchetectureflutterguy/Domain/homepagetopwidget/entity.dart';
import 'package:cleanarchetectureflutterguy/Domain/homepagetopwidget/repository.dart';

class TopwidgetRepositoryimpl implements TopwidgetRepository{
  Topwidgetdatasource topwidgetdatasource = Topwidgetdatasourceimpl();
  @override
  Future<Topwidgetentity> functionforusecases() {
    return topwidgetdatasource.apicall();
  }

}