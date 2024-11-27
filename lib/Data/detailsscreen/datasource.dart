import 'dart:convert';
import 'dart:developer';

import 'package:cleanarchetectureflutterguy/Data/detailsscreen/model.dart';
import 'package:cleanarchetectureflutterguy/Domain/detailsscreen/entity.dart';
import "package:http/http.dart" as http;

abstract class DetailsDatasource {
  Future<DetailsEntity> Apicall({required String id});
}
class DetailsDatasiurceimpl extends DetailsDatasource{
  @override
  Future<DetailsEntity> Apicall({required String id}) async{
    try{
      final response = await http.get(Uri.parse("https://dummyjson.com/products/$id"),
      headers: {
        "Content-Type":"application/json"
      });
      if(response.statusCode==200)
        {
          log("response of details screen : ${response.body}");
          return DetailsModel.fromJson(json.decode(response.body));
        }
      else
        {
          log("error response of details screen : ${response.body}");
          throw Exception(response.body);
        }
    }
        catch(e)
    {
      throw Exception(e);
    }
  }
}