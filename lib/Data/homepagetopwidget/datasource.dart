import 'dart:convert';
import 'dart:developer';

import 'package:cleanarchetectureflutterguy/Data/homepagetopwidget/model.dart';
import 'package:cleanarchetectureflutterguy/Domain/homepagetopwidget/entity.dart';
import "package:http/http.dart" as http;

abstract class Topwidgetdatasource {
  Future<Topwidgetentity> apicall();
}

class Topwidgetdatasourceimpl implements Topwidgetdatasource {
  @override
  Future<Topwidgetentity> apicall() async {
    try {
      final response = await http.get(
          Uri.parse(
              "https://dummyjson.com/products/category/smartphones?select=title,images"),
          headers: {"Content-Type": "application/json"});
      if (response.statusCode == 200) {
        log("response = ${response.statusCode} ,, response ${response.body}");
        return Topwidgetmodel.fromJson(json.decode(response.body));
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
