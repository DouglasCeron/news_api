import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../../cases/news/domain/entities/article_entity.dart';
import '../../../../shared/base/base_resources/app_strings.dart';
import '../../news/controller/news_controller.dart';

class NewSelectPage extends GetWidget<NewsController> {
  final ArticleEntity articleEntity;
  final int index;

  NewSelectPage(this.articleEntity, this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Noticias do ${articleEntity.author}',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            foregroundDecoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(articleEntity.urlToImage),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, top: 10, right: 10),
            color: Colors.green[50],
            child: Column(
              children: [
                Container(
                  child: Text(
                    '${articleEntity.title}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        articleEntity.publishedAt != null
                            ? 'Publicado em: '
                            : ' Sem data de publish',
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      alignment: Alignment.centerLeft,
                      child: Text(articleEntity.publishedAt ?? ''),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(top: 10),
                  alignment: Alignment.centerLeft,
                  child: Text(articleEntity.author ?? 'Sem autor',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                    ),
                  ),

                ),
                Container(
                  padding: EdgeInsets.only(top: 10),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Conteudo',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
