import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/cases/login/domain/entities/login_entity.dart';
import 'package:news_app/cases/login/domain/use_cases/login_usecase.dart';
import 'package:news_app/shared/base/base_resources/app_strings.dart';
import 'package:news_app/shared/base/base_response/base_response.dart';
import 'package:news_app/shared/base/base_state/screen_base_state.dart';

class LoginController extends GetxController {
  LoginUseCase _loginUseCase;
  String screenResponseText = '';
  BaseState screenState = BaseState.initState;

  LoginController(this._loginUseCase);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> onLoginButtonPressed() async {
    updateScreenState(BaseState.loading);
    final baseResponse = await _loginUseCase(
      LoginEntity(email: emailController.text, password: passwordController.text),
    );
    checkBaseResponse(baseResponse);
    updateScreenState(BaseState.done);
  }

  void checkBaseResponse(BaseResponse baseResponse) {
    if (baseResponse is SuccessResponse) {
      bool isUserLogged = baseResponse.response;
      if (isUserLogged) {
        screenResponseText = AppStrings.loggedUserMessage;
        showSnackBar(
          title: screenResponseText,
          content: AppStrings.welcomeMessage,
          backGroundColor: Colors.blue
        );
        print('Mensagem de sucesso: $screenResponseText');
      }
    } else if (baseResponse is FailureResponse) {
      screenResponseText = baseResponse.errorMessage;
      showSnackBar(
          title: AppStrings.errorMessage,
          content: screenResponseText,
          backGroundColor: Colors.red
      );
      print('Mensagem de erro: $screenResponseText');
    }
  }

  void showSnackBar({String title, String content, Color backGroundColor}) {
    Get.snackbar(
      title,
      content,
      backgroundColor: backGroundColor,
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.white,
    );
  }

  updateScreenState(BaseState baseScreenState) {
    screenState = baseScreenState;
    update();
  }
}
