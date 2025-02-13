import 'package:e_commerce/domain/entities/RegisterResponseEntity.dart';

/// message : "success"
/// user : {"name":"Amira Abd Al-Muti","email":"maimoussa@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3YTY4OWE5ZmE3ODk1ZTgxZjE5MDhiZCIsIm5hbWUiOiJBbWlyYSBBYmQgQWwtTXV0aSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzM4OTY3NDY1LCJleHAiOjE3NDY3NDM0NjV9.Yg5TP1hSuk3XSzFKWruwhaIH-DZj7Zdbikqy10MW-No"

class RegisterResponseDm extends RegisterResponseEntity{
  RegisterResponseDm({
      super.message,
      super.user,
      super.token,
    super.statusMsg
  });

  RegisterResponseDm.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    user = json['user'] != null ? RegisterUserDM.fromJson(json['user']) : null;
    token = json['token'];
  }

}

/// name : "Amira Abd Al-Muti"
/// email : "maimoussa@gmail.com"
/// role : "user"

class RegisterUserDM extends RegisterUserEntity {
  RegisterUserDM({
      super.name,
      super.email,
      super.role,});

  RegisterUserDM.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }



}