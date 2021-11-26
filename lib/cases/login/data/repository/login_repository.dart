

import 'package:news_app/cases/login/data/data_sources/local_datasource/login_local_datasource.dart';
import 'package:news_app/cases/login/data/data_sources/remote_datasource/login_remote_datasource.dart';
import 'package:news_app/cases/login/data/models/login_model.dart';
import 'package:news_app/cases/login/domain/repository/login_repository_contract.dart';
import 'package:news_app/shared/base/base_response/base_response.dart';

class LoginRepository implements LoginRepositoryContract {

  LoginLocalDataSource _loginLocalDataSource;
  LoginRemoteDataSource _loginRemoteDataSource;

  LoginRepository(this._loginRemoteDataSource, this._loginLocalDataSource);

  @override
  Future<BaseResponse> loginUser(LoginModel loginModel) async {
    final response = await _loginLocalDataSource.loginUserLocally(loginModel);
    return response;
  }
}