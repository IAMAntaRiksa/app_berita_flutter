import 'package:dio/dio.dart';
import 'package:rest_api/data/dio_logging.dart';
import 'package:rest_api/data/models/list_response.dart';
import 'package:rest_api/data/models/news_response.dart';

const String BASEURL = 'https://newsapi.org/v2';
const String APIKEY = 'e22d8c27023d4cfea836274267573914';
const String SOURCES = 'bbc-news';

class ApiClientResponse {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: BASEURL,
      connectTimeout: 40000,
      sendTimeout: 50000,
    ),
  )..interceptors.add(Logging());

  Future<List<NewsItemResponse>?>? getNews(
      {int page = 0, int pageSize = 10}) async {
    List<NewsItemResponse>? newsData;
    try {
      Response response = await _dio.get(
        'https://newsapi.org/v2/everything?q=bitcoin=id&page=$page&apiKey=$APIKEY',
        queryParameters: {
          'apiKey': APIKEY,
          'page': page,
          'pageSize': pageSize,
        },
      );

      NewListResponse<NewsItemResponse> news =
          NewListResponse<NewsItemResponse>.fromJson(
        response.data,
        (json) => NewsItemResponse.fromJson(json as Map<String, dynamic>),
      );

      return newsData = news.articles;
    } on DioError catch (e) {
      print('Error: (getNews)');
    }
    return newsData;
  }
}
