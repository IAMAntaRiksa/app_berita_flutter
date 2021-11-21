// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:rest_api/bloc/bloc/artikel_bloc.dart';
// import 'package:rest_api/data/models/news_response.dart';
// import 'package:rest_api/home/componts/home_item.dart';

// class HomeItemView extends StatefulWidget {
//   final List<NewsItemResponse> datada;

//   const HomeItemView({
//     Key? key,
//     required this.datada,
//   }) : super(key: key);

//   @override
//   _HomeItemViewState createState() => _HomeItemViewState();
// }

// class _HomeItemViewState extends State<HomeItemView> {
//   final ScrollController _scrollController = ScrollController();
//   ArtikelBloc ada = ArtikelBloc();
//   _scrollListener() {
//     if (_scrollController.position.pixels ==
//         _scrollController.position.maxScrollExtent) {
//       ada.add(_scrollController);
//     }
//   }

//   @override
//   void initState() {
//     _scrollController.addListener(_scrollListener);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       controller: _scrollController,
//       scrollDirection: Axis.vertical,
//       itemCount: widget.datada.length,
//       itemBuilder: (contex, index) => HomeItem(dataa: widget.datada[index]),
//     );
//   }
// }
