/// message : "success"
/// user : {"name":"Amira Abd Al-Muti","email":"maimoussa@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3YTY4OWE5ZmE3ODk1ZTgxZjE5MDhiZCIsIm5hbWUiOiJBbWlyYSBBYmQgQWwtTXV0aSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzM4OTY3NDY1LCJleHAiOjE3NDY3NDM0NjV9.Yg5TP1hSuk3XSzFKWruwhaIH-DZj7Zdbikqy10MW-No"

class RegisterResponseEntity {
  RegisterResponseEntity({
      this.message, 
      this.user,
    this.statusMsg,
      this.token,});

  String? message;
  String? statusMsg;
  UserEntity? user;
  String? token;


}

/// name : "Amira Abd Al-Muti"
/// email : "maimoussa@gmail.com"
/// role : "user"

class UserEntity {
  UserEntity({
      this.name, 
      this.email, 
      this.role,});

  String? name;
  String? email;
  String? role;


}