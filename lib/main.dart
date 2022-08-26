import 'package:flutter/material.dart';
import 'package:shopapp/widgets/EditCard.dart';
import 'package:shopapp/Screens/Escreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const EditCard(),
      routes: {
        '/Escreen': (_) => const Escreen(),
      },
    );
  }
}
