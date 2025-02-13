import 'package:e_commerce/domain/entities/LoginResponseEntity.dart';

/// message : "success"
/// user : {"name":"Amira Abd Al-Muti","email":"maimoussa@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3YTY4OWE5ZmE3ODk1ZTgxZjE5MDhiZCIsIm5hbWUiOiJBbWlyYSBBYmQgQWwtTXV0aSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzM4OTY3NDY1LCJleHAiOjE3NDY3NDM0NjV9.Yg5TP1hSuk3XSzFKWruwhaIH-DZj7Zdbikqy10MW-No"

class LoginResponseDm extends LoginResponseEntity{
  LoginResponseDm({
      super.message,
      super.user,
      super.token,
    super.statusMsg
  });

  LoginResponseDm.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    user = json['user'] != null ? LoginUserDM.fromJson(json['user']) : null;
    token = json['token'];
  }

}

/// name : "Amira Abd Al-Muti"
/// email : "maimoussa@gmail.com"
/// role : "user"

class LoginUserDM extends LoginUserEntity {
  LoginUserDM({
      super.name,
      super.email,
      super.role,});

  LoginUserDM.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }



}