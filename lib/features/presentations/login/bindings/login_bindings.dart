import 'package:get/get.dart';
import 'package:news_app/cases/login/data/data_sources/local_datasource/login_local_datasource.dart';
import 'package:news_app/cases/login/data/data_sources/remote_datasource/login_remote_datasource.dart';
import 'package:news_app/cases/login/data/repository/login_repository.dart';
import 'package:news_app/cases/login/domain/repository/login_repository_contract.dart';
import 'package:news_app/cases/login/domain/use_cases/login_usecase.dart';
import 'package:news_app/features/presentations/login/controller/login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    registerController();
    registerUseCases();
    registerRepositories();
    registerDataSources();
  }

  registerController() {
    Get.lazyPut(() => LoginController(Get.find<LoginUseCase>()));
  }

  registerUseCases() {
    Get.lazyPut<LoginUseCase>(
      () => LoginUseCase(
        Get.find<LoginRepositoryContract>(),
      ),
    );
  }

  registerRepositories() {
    Get.lazyPut<LoginRepositoryContract>(
      () => LoginRepository(
        Get.find<LoginRemoteDataSource>(),
        Get.find<LoginLocalDataSource>(),
      ),
    );
  }

  registerDataSources() {
    Get.lazyPut(() => LoginRemoteDataSource());
    Get.lazyPut(() => LoginLocalDataSource());
  }
}
