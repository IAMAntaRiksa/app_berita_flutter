// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsItemResponse _$NewsItemResponseFromJson(Map<String, dynamic> json) =>
    NewsItemResponse(
      sources: json['sources'] == null
          ? null
          : SourceModel.fromJson(json['sources'] as Map<String, dynamic>),
      author: json['author'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      imagesUrl: json['urlToImage'] as String?,
    );

Map<String, dynamic> _$NewsItemResponseToJson(NewsItemResponse instance) =>
    <String, dynamic>{
      'sources': instance.sources,
      'author': instance.author,
      'title': instance.title,
      'description': instance.description,
      'urlToImage': instance.imagesUrl,
    };

SourceModel _$SourceModelFromJson(Map<String, dynamic> json) => SourceModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$SourceModelToJson(SourceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
