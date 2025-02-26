import 'dart:io';

class RegisterDto {
  String name;
  String email;
  String password;
  File? image;
  RegisterDto(this.name, this.email, this.password, this.image);
}
