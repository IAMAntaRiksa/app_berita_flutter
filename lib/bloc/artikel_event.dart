part of 'artikel_bloc.dart';

abstract class ArtikelEvent extends Equatable {
  const ArtikelEvent();

  @override
  List<Object> get props => [];
}

class GetNewsArtikelEvent extends ArtikelEvent {}

class GetLoadMoreData extends ArtikelEvent {}

class GetLoadMoreRefreshEvent extends ArtikelEvent {}
