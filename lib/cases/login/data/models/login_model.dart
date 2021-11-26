
import 'package:news_app/cases/login/domain/entities/login_entity.dart';

class LoginModel {
  String email;
  String password;

  LoginModel({this.email, this.password});

  LoginModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}

extension ConvertModelToEntity on LoginModel {
  LoginEntity toEntity() => LoginEntity(
    email: this.email,
    password: this.password
  );
}
