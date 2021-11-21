part of 'artikel_bloc.dart';

abstract class ArtikelState extends Equatable {
  const ArtikelState();

  @override
  List<Object> get props => [];
}

class ArtikelInitial extends ArtikelState {}

class getNewsArticlesLoading extends ArtikelState {}

class getNewsArticlesLoaded extends ArtikelState {
  List<NewsItemResponse> itemNewsArticles;
  final bool hasReachedMax;

  getNewsArticlesLoaded({
    required this.itemNewsArticles,
    this.hasReachedMax = true,
  });

  getNewsArticlesLoaded copyWith({
    List<NewsItemResponse>? posts,
    bool? hasReachedMax,
  }) {
    return getNewsArticlesLoaded(
      itemNewsArticles: posts ?? itemNewsArticles,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [itemNewsArticles, hasReachedMax];
}

class getNewsArticlesError extends ArtikelState {
  final String massage;

  getNewsArticlesError({
    required this.massage,
  });

  @override
  List<Object> get props => [massage];
}
