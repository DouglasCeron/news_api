import 'package:news_app/cases/news/domain/entities/source_entity.dart';

class SourceModel {
  String id;
  String name;

  SourceModel({this.id, this.name});

  SourceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? '';
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

extension ConvertModelToEntity on SourceModel {
  SourceEntity toEntity(){
    return SourceEntity(
      id: this.id,
      name: this.name
    );
  }
}