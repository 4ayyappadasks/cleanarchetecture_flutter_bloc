import 'dart:convert';
import 'dart:developer';

import 'package:cleanarchetectureflutterguy/Data/login/model.dart';
import 'package:cleanarchetectureflutterguy/Domain/login/entity.dart';
import "package:http/http.dart" as http;

abstract class LogindataSource {
  Future<Loginmodel> apicall({required String email, required String password});
}

class LogindataSourceimpl implements LogindataSource {

  @override
  Future<Loginmodel> apicall({required String email, required String password}) async {
    print("email :$email,password : $password");
    try {
      var response =
          await http.post(Uri.parse("https://dummyjson.com/auth/login"),
              headers: {"Content-Type": "application/json"},
              body: jsonEncode({
                "username": email,
                "password": password,
                "expiresInMins": 30,
              }));
      if(response.statusCode==200)
        {
          log("success response status code : ${response.statusCode} , with response : ${response.body}");
          return Loginmodel.fromJson(json.decode(response.body));
        }
      {
        log("error response status code : ${response.statusCode} , with response : ${response.body}");
        throw Exception(response.body);
      }
    } catch (e) {
      log("error in api call : ${e.toString()}");
      throw Exception("error in api call : ${e.toString()}");
    }
  }
}
