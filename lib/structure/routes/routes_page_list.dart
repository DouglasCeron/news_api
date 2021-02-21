import 'package:get/get.dart';
import 'package:news_app/features/presentations/login/bindings/login_bindings.dart';
import 'package:news_app/features/presentations/login/page/login_page.dart';
import 'package:news_app/features/presentations/news/bindings/news_bindings.dart';
import 'package:news_app/features/presentations/news/page/news_page.dart';
import 'package:news_app/structure/routes/routes.dart';

mixin RoutesPageList {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.loginRoute,
      page: () => LoginPage(),
      bindings: [
        LoginBinding()
      ],
    ),
    GetPage(
      name: Routes.newsRoute,
      page: () => NewsPage(),
      bindings: [
        NewsBindings()
      ],
    ),
  ];
}