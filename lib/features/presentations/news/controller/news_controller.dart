

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/cases/news/domain/entities/news_api_response_entity.dart';
import 'package:news_app/cases/news/domain/use_cases/get_news_usecase.dart';
import 'package:news_app/shared/base/base_models/no_params.dart';
import 'package:news_app/shared/base/base_resources/app_strings.dart';
import 'package:news_app/shared/base/base_response/base_response.dart';
import 'package:news_app/shared/base/base_state/screen_base_state.dart';

class NewsController extends GetxController{

  GetNewsUsecase getNewsUseCase;
  NewsApiResponseEntity newsApiResponseEntity;
  BaseState screenState = BaseState.initState;

  NewsController(this.getNewsUseCase);

  Future<void> startProcess() async {
    await getNewsFromApi();
  }

  Future<void> getNewsFromApi() async {
    updateScreenState(BaseState.loading);
    final response = await getNewsUseCase(NoParams());
    checkBaseResponse(response);
    updateScreenState(BaseState.done);
  }

  void checkBaseResponse(BaseResponse baseResponse) {
    if (baseResponse is SuccessResponse) {
      newsApiResponseEntity = baseResponse.data;
    } else if (baseResponse is FailureResponse) {
      showSnackBar(
          title: AppStrings.errorMessage,
          content: baseResponse.errorMessage,
          backGroundColor: Colors.red
      );
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


  void updateScreenState(BaseState baseScreenState) {
    screenState = baseScreenState;
    update();
  }
}