import 'package:news_app/cases/news/domain/entities/article_entity.dart';

import 'source_model.dart';

class ArticleModel {
  SourceModel source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

  ArticleModel({this.source, this.author, this.title, this.description, this.url, this.urlToImage, this.publishedAt, this.content});

  ArticleModel.fromJson(Map<String, dynamic> json) {
    source = json['source'] != null ? new SourceModel.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.source != null) {
      data['source'] = this.source.toJson();
    }
    data['author'] = this.author;
    data['title'] = this.title;
    data['description'] = this.description;
    data['url'] = this.url;
    data['urlToImage'] = this.urlToImage;
    data['publishedAt'] = this.publishedAt;
    data['content'] = this.content;
    return data;
  }
}

extension ConvertModelToEntity on ArticleModel {
  ArticleEntity toEntity() {
    return ArticleEntity(
        source: this.source.toEntity(),
        author: this.author,
        title: this.title,
        description: this.description,
        url: this.url,
        urlToImage: this.urlToImage,
        publishedAt: this.publishedAt,
        content: this.content);
  }
}

extension ConvertListModelToEntity on List<ArticleModel> {
  List<ArticleEntity> toEntityList() {
    List<ArticleEntity> newEntityList = [];
    this.forEach((article) {
        newEntityList.add(article.toEntity());
      },
    );
    return newEntityList;
  }
}
