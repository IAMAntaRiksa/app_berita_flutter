import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_api/bloc/artikel_bloc.dart';
import 'package:rest_api/widget/home/componts/home_itemview.dart';

class HomeBuilderWidget extends StatefulWidget {
  const HomeBuilderWidget({Key? key}) : super(key: key);

  @override
  State<HomeBuilderWidget> createState() => _HomeBuilderWidgetState();
}

class _HomeBuilderWidgetState extends State<HomeBuilderWidget> {
  @override
  void initState() {
    super.initState();
    context.read<ArtikelBloc>().add(GetNewsArtikelEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArtikelBloc, ArtikelState>(
      builder: (context, state) {
        if (state is GetNewsArtikelLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetNewsArtikelError) {
          return Column(children: [
            const Text('Error'),
            IconButton(onPressed: () {}, icon: const Icon(Icons.refresh))
          ]);
        } else if (state is GetNewsArticlesLoaded) {
          return HomeItemView(datada: state.data.itemNewsArticles);
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
