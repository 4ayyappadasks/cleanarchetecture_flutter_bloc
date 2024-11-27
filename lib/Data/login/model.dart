import 'package:cleanarchetectureflutterguy/Domain/login/entity.dart';

class Loginmodel extends LoginEntity {
  Loginmodel({
    required accessToken,
    required refreshToken,
    required id,
    required username,
    required email,
    required firstName,
    required lastName,
    required gender,
    required image,
  }) : super(
          accessToken: accessToken,
          refreshToken: refreshToken,
          id: id,
          username: username,
          email: email,
          firstName: firstName,
          lastName: firstName,
          gender: gender,
          image: image,
        );
  factory Loginmodel.fromJson(Map<String, dynamic> json) => Loginmodel(
    accessToken: json["accessToken"],
    refreshToken: json["refreshToken"],
    id: json["id"],
    username: json["username"],
    email: json["email"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    gender: json["gender"],
    image: json["image"],
  );
}
