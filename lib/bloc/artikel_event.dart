part of 'artikel_bloc.dart';

abstract class ArtikelEvent extends Equatable {
  const ArtikelEvent();

  @override
  List<Object> get props => [];
}

class getNewsArtikelEvent extends ArtikelEvent {}

class getLoadMoreRefreshEvent extends ArtikelEvent {}
