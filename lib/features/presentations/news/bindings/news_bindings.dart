

import 'package:get/get.dart';
import 'package:news_app/cases/news/data/data_sources/remote/remote_news_datasource.dart';
import 'package:news_app/cases/news/data/repository/news_repository.dart';
import 'package:news_app/cases/news/domain/repository/news_repository_contract.dart';
import 'package:news_app/cases/news/domain/use_cases/get_news_usecase.dart';
import 'package:news_app/features/presentations/news/controller/news_controller.dart';

class NewsBindings extends Bindings {

  @override
  void dependencies() {
    registerController();
    registerUsecase();
    registerRepository();
    registerDataSource();
  }

  void registerController(){
    Get.lazyPut<NewsController>(() => NewsController(Get.find<GetNewsUsecase>()));
  }

  void registerUsecase(){
    Get.lazyPut<GetNewsUsecase>(() => GetNewsUsecase(Get.find<NewsRepositoryContract>()));

  }

  void registerRepository(){
    Get.lazyPut<NewsRepositoryContract>(() => NewsRepository(Get.find<RemoteNewsDatasource>()));

  }

  void registerDataSource(){
    Get.lazyPut<RemoteNewsDatasource>(() => RemoteNewsDatasource());
  }
}