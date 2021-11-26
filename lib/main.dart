import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/structure/routes/routes.dart';
import 'structure/routes/routes_page_list.dart';

void main() {
  runApp(
    GetMaterialApp(
      initialRoute: Routes.loginRoute,
      getPages: RoutesPageList.routes,
      theme: ThemeData(primaryColor: Colors.black),
    ),
  );
}
