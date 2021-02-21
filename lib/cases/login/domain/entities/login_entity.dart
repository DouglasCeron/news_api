

import 'package:news_app/cases/login/data/models/login_model.dart';

class LoginEntity {
  String email;
  String password;

  LoginEntity({this.email, this.password});
}

extension ConvertEntityToModel on LoginEntity {
  LoginModel toModel() => LoginModel(
      email: this.email,
      password: this.password
  );
}