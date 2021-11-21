// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewListResponse<T> _$NewListResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    NewListResponse<T>(
      articles: (json['articles'] as List<dynamic>).map(fromJsonT).toList(),
    );

Map<String, dynamic> _$NewListResponseToJson<T>(
  NewListResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'articles': instance.articles.map(toJsonT).toList(),
    };
