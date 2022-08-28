import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);
  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 165, 55, 130),
        title: const Text(
          "Your Products",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
        actions: [
          GestureDetector(
            child: (const Icon(Icons.edit, color: Colors.white)),
            onTap: () {
              Navigator.pushNamed(context, '/Edit');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: const []),
      ),
    );
  }
}
