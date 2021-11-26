
import 'package:news_app/cases/news/domain/repository/news_repository_contract.dart';
import 'package:news_app/shared/base/base_models/no_params.dart';
import 'package:news_app/shared/base/base_response/base_response.dart';
import 'package:news_app/shared/base/base_usecase/base_usecase.dart';

class GetNewsUsecase extends FutureBaseUseCase<NoParams, BaseResponse> {

  NewsRepositoryContract newsRepositoryContract;

  GetNewsUsecase(this.newsRepositoryContract);

  @override
  Future<BaseResponse> call(NoParams param) async => await newsRepositoryContract.getNewsFromApi();
}