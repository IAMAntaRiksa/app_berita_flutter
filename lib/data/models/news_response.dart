import 'package:json_annotation/json_annotation.dart';
part 'news_response.g.dart';

@JsonSerializable()
class NewsItemResponse {
  @JsonKey(name: 'sources')
  final SourceModel? sources;

  @JsonKey(name: 'author')
  final String? author;

  @JsonKey(name: 'title')
  final String? title;

  @JsonKey(name: 'description')
  final String? description;

  @JsonKey(name: 'urlToImage')
  final String? imagesUrl;

  NewsItemResponse({
    this.sources,
    this.author,
    this.title,
    this.description,
    this.imagesUrl,
  });

  factory NewsItemResponse.fromJson(Map<String, dynamic> jsons) =>
      _$NewsItemResponseFromJson(jsons);
}

@JsonSerializable()
class SourceModel {
  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(name: 'name')
  final String? name;

  SourceModel({
    this.id,
    this.name,
  });
  factory SourceModel.fromJson(Map<String, dynamic> json) =>
      _$SourceModelFromJson(json);
}
