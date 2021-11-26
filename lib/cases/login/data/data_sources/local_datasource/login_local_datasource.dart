import 'dart:async';

import 'package:news_app/cases/login/data/models/login_model.dart';
import 'package:news_app/shared/base/base_response/base_response.dart';

class LoginLocalDataSource {
  String savedEmail = 'diego.pontes@newsapp.com.br';
  String savedPassword = '123456';

  Future<BaseResponse> loginUserLocally(LoginModel loginModel) async {
    //await Future.delayed(Duration(seconds: 5));
    BaseResponse localResponse = checkCredentials(loginModel);
    return localResponse;
  }

  BaseResponse checkCredentials(LoginModel loginModel) {
    if ((loginModel.email == null || loginModel.email.isEmpty) ||
        (loginModel.password == null || loginModel.password.isEmpty)) {
      return FailureResponse('Os campos de credenciais não podem ser vazios.');
    } else if (loginModel.email == savedEmail && loginModel.password == savedPassword) {
      return SuccessResponse(true);
    } else if (loginModel.email != savedEmail) {
      return FailureResponse('E-mail incorreto. Verifique e tente novamente.');
    } else {
      return FailureResponse('Senha incorreta. Verifique e tente novamente.');
    }
  }
}
