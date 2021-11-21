import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_api/bloc/artikel_bloc.dart';
import 'package:rest_api/widget/home/home_body.dart';

void main() {
  runApp(const MyApp());

  Bloc.observer = BlocObserver();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ArtikelBloc>(
          create: (context) => ArtikelBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeBody(),
      ),
    );
  }
}
