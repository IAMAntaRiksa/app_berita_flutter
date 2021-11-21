import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_api/bloc/artikel_bloc.dart';
import 'package:rest_api/widget/home/componts/home_item.dart';

class HomeBuilderWidget extends StatefulWidget {
  const HomeBuilderWidget({Key? key}) : super(key: key);

  @override
  State<HomeBuilderWidget> createState() => _HomeBuilderWidgetState();
}

class _HomeBuilderWidgetState extends State<HomeBuilderWidget> {
  final ScrollController _scrollController = ScrollController();
  ArtikelBloc dat = ArtikelBloc();
  _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      dat.apiClientResponse.getNews();
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    context.read<ArtikelBloc>().add(getNewsArtikelEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArtikelBloc, ArtikelState>(
      buildWhen: (_, nextState) {
        return nextState is getNewsArticlesLoaded ||
            nextState is getNewsArticlesError ||
            nextState is getNewsArticlesLoading;
      },
      builder: (context, state) {
        if (state is getNewsArticlesLoaded) {
          return ListView.builder(
            controller: _scrollController,
            itemCount: state.itemNewsArticles.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (_, index) =>
                HomeItem(dataa: state.itemNewsArticles[index]),
          );
        }

        if (state is getNewsArticlesError) {
          return Column(children: [
            const Text('No Artikel'),
            IconButton(onPressed: () {}, icon: const Icon(Icons.refresh))
          ]);
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
