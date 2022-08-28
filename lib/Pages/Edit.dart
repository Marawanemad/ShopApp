import 'package:flutter/material.dart';

class Edit extends StatelessWidget {
  const Edit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 165, 55, 130),
        title: const Text(
          "Edit Products",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
        actions: [
          GestureDetector(
            child: (const Icon(Icons.save, color: Colors.white)),
            onTap: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Title',
              labelStyle: TextStyle(color: Color.fromARGB(255, 165, 55, 130)),
              hintText: 'Enter the title',
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Description',
              labelStyle: TextStyle(color: Color.fromARGB(255, 165, 55, 130)),
              hintText: 'Enter the description',
            ),
            maxLines: 5,
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Price',
              labelStyle: TextStyle(color: Color.fromARGB(255, 165, 55, 130)),
              hintText: 'Enter the Price',
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'URL',
              labelStyle: TextStyle(color: Color.fromARGB(255, 165, 55, 130)),
              hintText: 'Enter the URL',
            ),
            maxLines: 5,
          ),
        ],
      ),
    );
  }
}
