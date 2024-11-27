import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable {
  String accessToken;
  String refreshToken;
  int id;
  String username;
  String email;
  String firstName;
  String lastName;
  String gender;
  String image;

  LoginEntity({
    required this.accessToken,
    required this.refreshToken,
    required this.id,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.image,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        accessToken,
        refreshToken,
        id,
        username,
        email,
        firstName,
        lastName,
        gender,
        image,
      ];
}
