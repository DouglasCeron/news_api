import 'package:news_app/cases/news/domain/entities/news_api_response_entity.dart';

import 'article_model.dart';

class NewsApiResponseModel {
  String status;
  int totalResults;
  List<ArticleModel> articles;

  NewsApiResponseModel({this.status, this.totalResults, this.articles});

  NewsApiResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = new List<ArticleModel>();
      json['articles'].forEach((v) {
        articles.add(new ArticleModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['totalResults'] = this.totalResults;
    if (this.articles != null) {
      data['articles'] = this.articles.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

extension ConvertModelToEntity on NewsApiResponseModel {
  NewsApiResponseEntity toEntity() {
    return NewsApiResponseEntity(
      status: this.status,
      totalResults: this.totalResults,
      articles: this.articles.toEntityList(),
    );
  }
}
