
import 'package:news_app/shared/base/base_response/base_response.dart';

abstract class NewsRepositoryContract {
  Future<BaseResponse> getNewsFromApi();
}