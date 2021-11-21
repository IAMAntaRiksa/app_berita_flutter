import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rest_api/data/models/news_response.dart';
import 'package:rest_api/data/remote/api_client_respponse.dart';

part 'artikel_event.dart';
part 'artikel_state.dart';

class ArtikelBloc extends Bloc<ArtikelEvent, ArtikelState> {
  /// step one
  ApiClientResponse apiClientResponse = ApiClientResponse();

  ArtikelBloc() : super(ArtikelInitial()) {
    on<getNewsArtikelEvent>((event, emit) async {
      emit(getNewsArticlesLoading());
      List<NewsItemResponse>? newsarticles = await apiClientResponse.getNews();
      if (newsarticles == null) {
        emit(getNewsArticlesError(massage: 'Failed get artikel'));
      } else {
        emit(getNewsArticlesLoaded(itemNewsArticles: newsarticles));
      }
    });

    on<getLoadMoreEvent>((event, emit) async {
      emit(getNewsArticlesLoading());
      List<NewsItemResponse>? newsarticles = await apiClientResponse.getNews();
      if (newsarticles == null) {
        emit(getNewsArticlesError(massage: 'Failed get artikel'));
      } else {
        emit(getNewsArticlesLoading());
      }
    });
  }
}
