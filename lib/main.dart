import 'package:flutter/material.dart';
import 'package:shopapp/Pages/Home.dart';
import 'package:shopapp/Pages/Info.dart';
import 'package:shopapp/Pages/Products.dart';
import 'package:shopapp/Pages/Edit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Home(),
      routes: {
        '/Products': (_) => const Products(),
        '/Info': (_) => const Info(),
        '/Edit': (_) => const Edit(),
      },
    );
  }
}
