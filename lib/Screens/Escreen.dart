import 'package:flutter/material.dart';

class Escreen extends StatelessWidget {
  const Escreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 165, 55, 130),
        title: const Text(
          "Your Products",
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
    );
  }
}
