import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../cases/news/domain/entities/news_api_response_entity.dart';
import '../../../../shared/base/base_state/screen_base_state.dart';


class DetailNewsController extends GetxController{
  NewsApiResponseEntity newsApiResponseEntity;
  BaseState screenState = BaseState.initState;
}