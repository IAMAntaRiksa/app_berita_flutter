import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rest_api/data/models/news_response.dart';
import 'package:rest_api/data/remote/api_client_respponse.dart';

part 'artikel_event.dart';
part 'artikel_state.dart';

class ArtikelBloc extends Bloc<ArtikelEvent, ArtikelState> {
  ApiClientResponse apiClientResponse = ApiClientResponse();

  ArtikelBloc() : super(const ArtikelInitial()) {
    on<GetNewsArtikelEvent>(_getMapData);
    on<GetLoadMoreData>(_getLoadMoreData);
  }
  FutureOr<void> _getMapData(event, emit) async {
    emit(GetNewsArtikelLoading(data: state.data));
    try {
      List<NewsItemResponse>? fetchData =
          await apiClientResponse.getNews(page: 1);
      emit(GetNewsArticlesLoaded(
          data: state.data.copyWith(itemNewsArticles: fetchData)));
    } catch (e) {
      emit(const GetNewsArtikelError(message: 'Gagal Ambil Data'));
    }
  }

  FutureOr<void> _getLoadMoreData(event, emit) async {
    emit(GetNewsArticlesLoaded(
        data: state.data.copyWith(isLoadMoreLoading: true)));
    try {
      List<NewsItemResponse>? fetchData =
          await apiClientResponse.getNews(page: state.data.page + 1);
      emit(
        GetNewsArticlesLoaded(
          data: state.data.copyWith(
              itemNewsArticles: state.data.itemNewsArticles + fetchData!,
              isLoadMoreLoading: false,
              page: state.data.page + 1,
              hasReachedMax: fetchData.length < 10),
        ),
      );
    } catch (e) {
      emit(const GetNewsArtikelError(message: 'Gagal Ambil Data'));
    }
  }
}
