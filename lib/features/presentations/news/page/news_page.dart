import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/features/presentations/news/controller/news_controller.dart';
import 'package:news_app/features/presentations/news/widget/news_card_widget.dart';
import 'package:news_app/shared/base/base_state/screen_base_state.dart';

class NewsPage extends GetWidget<NewsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('News App',
        style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
      ),
      body: GetBuilder<NewsController>(
        initState: (_) {
          controller.startProcess();
        },
        builder: (_) => controller.screenState == BaseState.loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                child: ListView.builder(
                  itemCount: controller.newsApiResponseEntity.articles.length,
                  itemBuilder: (context, index) {
                    return NewsCardWidget(
                      articleEntity: controller.newsApiResponseEntity.articles[index],
                      index: index + 1,
                    );
                  },
                ),
              ),
      ),
    );
  }
}
