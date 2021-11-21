import 'package:json_annotation/json_annotation.dart';

part 'list_response.g.dart';

@JsonSerializable(
  genericArgumentFactories: true,
)
class NewListResponse<T> {
  @JsonKey(name: 'articles')
  final List<T> articles;
  NewListResponse({
    required this.articles,
  });

  factory NewListResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$NewListResponseFromJson(json, fromJsonT);
}
