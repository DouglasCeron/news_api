

import 'package:news_app/cases/login/data/models/login_model.dart';
import 'package:news_app/shared/base/base_response/base_response.dart';

abstract class LoginRepositoryContract{
  Future<BaseResponse> loginUser(LoginModel login);
}