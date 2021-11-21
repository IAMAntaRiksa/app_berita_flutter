import 'dart:async';

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
    on<getNewsArtikelEvent>(_getMapData);
  }
  FutureOr<void> _getMapData(event, emit) async {
    emit(getNewsArticlesLoading());
    List<NewsItemResponse>? fetchData =
        await apiClientResponse.getNews(page: 2);
    if (fetchData == null) {
      emit(getNewsArticlesError(massage: 'gagal ambil data'));
    } else {
      emit(getNewsArticlesLoaded(itemNewsArticles: fetchData));

      /// logic loadmore perbarui

      // getNewsArticlesLoaded app =
      //     getNewsArticlesLoaded(itemNewsArticles: fetchData);
      // fetchData = await apiClientResponse.getNews();

      // emit(fetchData!.isEmpty
      //     ? app.copyWith(hasReachedMax: true)
      //     : getNewsArticlesLoaded(
      //         itemNewsArticles: app.itemNewsArticles + fetchData,
      //         hasReachedMax: false));
    }
  }
}
