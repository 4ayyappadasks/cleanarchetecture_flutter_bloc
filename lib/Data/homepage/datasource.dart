import 'dart:convert';
import 'dart:developer';

import 'package:cleanarchetectureflutterguy/Data/homepage/model.dart';
import 'package:cleanarchetectureflutterguy/Domain/homepage/entity.dart';
import "package:http/http.dart" as http;

abstract class Homepagedatasource {
  Future<Homepageentity> Apicall();
}

class Homepagedatasourceimpl extends Homepagedatasource {
  @override
  Future<Homepageentity> Apicall() async {
    try {
      final response = await http.get(Uri.parse(
          "https://dummyjson.com/products?limit=20&skip=10&select=title,price,category,thumbnail,images"),
      headers: {
        "Content-Type":"application/json"
      });
      if(response.statusCode==200)
        {
          log("response body ${response.body} , response status code : ${response.statusCode}");
          return Homepagemodel.fromJson(json.decode(response.body));
        }
      else{
        log("error response body ${response.body} , response status code : ${response.statusCode}");
        throw Exception(response.body);
      }
    }
    catch (e) {
      throw Exception("error in apicall $e");
    }
  }

}