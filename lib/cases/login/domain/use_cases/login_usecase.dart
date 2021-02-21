

import 'package:news_app/cases/login/domain/entities/login_entity.dart';
import 'package:news_app/cases/login/domain/repository/login_repository_contract.dart';
import 'package:news_app/shared/base/base_response/base_response.dart';
import 'package:news_app/shared/base/base_usecase/base_usecase.dart';

class LoginUseCase extends FutureBaseUseCase<LoginEntity, BaseResponse> {

  LoginRepositoryContract _loginRepositoryContract;

  LoginUseCase(this._loginRepositoryContract);

  @override
  Future<BaseResponse> call(LoginEntity param) async {
    final response = await _loginRepositoryContract.loginUser(param.toModel());
    return response;
  }
}