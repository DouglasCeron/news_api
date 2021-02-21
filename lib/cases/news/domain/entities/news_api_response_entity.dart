import 'article_entity.dart';

class NewsApiResponseEntity {
  String status;
  int totalResults;
  List<ArticleEntity> articles;

  NewsApiResponseEntity({
    this.status,
    this.totalResults,
    this.articles,
  });
}
