import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_api/bloc/artikel_bloc.dart';
import 'package:rest_api/data/models/news_response.dart';
import 'package:rest_api/widget/home/componts/home_item.dart';

class HomeItemView extends StatefulWidget {
  final List<NewsItemResponse> datada;

  const HomeItemView({
    Key? key,
    required this.datada,
  }) : super(key: key);

  @override
  _HomeItemViewState createState() => _HomeItemViewState();
}

class _HomeItemViewState extends State<HomeItemView> {
  final ScrollController _scrollController = ScrollController();
  _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      context.read<ArtikelBloc>().add(GetLoadMoreData());
    }
  }

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArtikelBloc, ArtikelState>(
      builder: (context, state) {
        return ListView.builder(
          controller: _scrollController,
          itemCount: state.data.isLoadMoreLoading
              ? state.data.itemNewsArticles.length + 1
              : state.data.itemNewsArticles.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (_, index) {
            if (index == state.data.itemNewsArticles.length) {
              return const Center(child: CircularProgressIndicator());
            }
            return HomeItem(dataa: state.data.itemNewsArticles[index]);
          },
        );
      },
    );
  }
}
