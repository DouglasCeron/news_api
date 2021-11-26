import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:news_app/cases/news/data/models/news_api_response_model.dart';
import 'package:news_app/shared/base/base_resources/app_strings.dart';
import 'package:news_app/shared/base/base_response/base_response.dart';

class RemoteNewsDatasource {
  Dio api = Dio();

  Future<BaseResponse> getNews() async {
    try {
      final response = await api.get(
        '${AppStrings.baseUrl}${EndPoints.topHeadLines}',
        queryParameters: {
          'country': EndPoints.brazilSymbol,
          'apiKey': EndPoints.apiKey,
        },
      );
      if (response.statusCode == 200) {
        return SuccessResponse(NewsApiResponseModel.fromJson(response.data));
      }
      return FailureResponse('Erro genérico!\nErro ao tentar fazer a requisição dos artigos.');
    } on DioError catch (error) {
      if (error.response.statusCode == 400) {
        return FailureResponse('Falha de requisição! Bad Request!');
      } else if (error.response.statusCode == 401) {
        return FailureResponse('Sem autorização! Verifique com a empresa desenvolvedora!');
      } else if (error.response.statusCode == 404) {
        return FailureResponse('Não foi encontrado os dados para esta requisição.');
      }
      print('Erro na requisição: ${error.message}\nStatus code: ${error.response.statusCode}');
      return FailureResponse('Falha na requisição');
    }
  }
}
