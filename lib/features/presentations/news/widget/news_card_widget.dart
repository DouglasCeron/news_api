import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/cases/news/domain/entities/article_entity.dart';
import 'package:news_app/features/presentations/detail_news/page/detail_news.dart';
import '../../../../structure/routes/routes.dart';

class NewsCardWidget extends StatelessWidget {
  final ArticleEntity articleEntity;
  final int index;

  NewsCardWidget({this.articleEntity, this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Toque na tela no artigo de index: $index');
        //Get.to(DetailNews(articleEntity, index));
        Get.toNamed(Routes.detailNews, arguments: [articleEntity, index]);
      },
      child: Container(
        margin: EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 200,
              foregroundDecoration: BoxDecoration(
                border: Border.all(
                  color: Colors.transparent,
                ),
                borderRadius: BorderRadius.circular(8),
                // use instead of BorderRadius.all(Radius.circular(20))
                image: DecorationImage(
                  image: NetworkImage(articleEntity.urlToImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    child: Text(
                      '$index.',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.blue),
                    ),
                    alignment: Alignment.topCenter,
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(bottom: 10),
                            child: Text(
                              articleEntity.author ?? 'Autor Indefinido',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w800),
                            ),
                          ),
                          Container(
                            child: Text(
                              articleEntity.title ?? 'Sem título',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  articleEntity.publishedAt != null
                                      ? 'Publicado em: '
                                      : 'Sem data de publicação.',
                                  style: TextStyle(fontWeight: FontWeight.w800),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                alignment: Alignment.centerLeft,
                                child: Text(articleEntity.publishedAt) ?? '',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: Divider(
                thickness: 2,
              ),
            )
          ],
        ),
      ),
    );
  }
}
