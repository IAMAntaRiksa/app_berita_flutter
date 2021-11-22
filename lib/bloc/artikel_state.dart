part of 'artikel_bloc.dart';

class ArtikelState extends Equatable {
  final ArtikelDataState data;
  const ArtikelState({required this.data});

  @override
  List<Object> get props => [data];
}

class ArtikelInitial extends ArtikelState {
  const ArtikelInitial()
      : super(
          data: const ArtikelDataState(
            itemNewsArticles: [],
            hasReachedMax: false,
            page: 1,
            isLoadMoreLoading: false,
          ),
        );
}

class GetNewsArtikelLoading extends ArtikelState {
  const GetNewsArtikelLoading({required ArtikelDataState data})
      : super(data: data);
}

class GetNewsArticlesLoaded extends ArtikelState {
  const GetNewsArticlesLoaded({required ArtikelDataState data})
      : super(data: data);
}

class ArtikelDataState {
  final List<NewsItemResponse> itemNewsArticles;
  final bool hasReachedMax;
  final int page;
  final bool isLoadMoreLoading;

  const ArtikelDataState({
    required this.itemNewsArticles,
    required this.hasReachedMax,
    required this.page,
    required this.isLoadMoreLoading,
  });

  ArtikelDataState copyWith({
    List<NewsItemResponse>? itemNewsArticles,
    bool? hasReachedMax,
    int? page,
    bool? isLoadMoreLoading,
  }) {
    return ArtikelDataState(
        itemNewsArticles: itemNewsArticles ?? this.itemNewsArticles,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
        page: page ?? this.page,
        isLoadMoreLoading: isLoadMoreLoading ?? this.isLoadMoreLoading);
  }

  List<Object> get props =>
      [isLoadMoreLoading, hasReachedMax, page, itemNewsArticles];
}

class GetNewsArtikelError {
  final String message;

  const GetNewsArtikelError({
    required this.message,
  });

  List<Object> get props => [message];
}
