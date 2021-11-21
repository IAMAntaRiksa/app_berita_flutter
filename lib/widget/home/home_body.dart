import 'package:flutter/material.dart';
import 'package:rest_api/home/componts/home_builder.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TEST CODING'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: BodyHome(),
    );
  }
}

Widget BodyHome() {
  return const HomeBuilderWidget();
}
