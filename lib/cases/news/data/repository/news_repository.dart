
import 'package:news_app/cases/news/data/data_sources/remote/remote_news_datasource.dart';
import 'package:news_app/cases/news/data/models/news_api_response_model.dart';
import 'package:news_app/cases/news/domain/repository/news_repository_contract.dart';
import 'package:news_app/shared/base/base_response/base_response.dart';

class NewsRepository implements NewsRepositoryContract {

  RemoteNewsDatasource remoteNewsDatasource;

  NewsRepository(this.remoteNewsDatasource);

  @override
  Future<BaseResponse> getNewsFromApi() async {
    final response = await remoteNewsDatasource.getNews();
    if(response is SuccessResponse){
      NewsApiResponseModel model = response.data ?? NewsApiResponseModel();
      return SuccessResponse(model.toEntity());
    } else {
      return response;
    }
  }
}