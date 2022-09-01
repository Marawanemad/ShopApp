import 'package:flutter/material.dart';
import 'package:shopapp/Data/Data.dart';

class Edit extends StatelessWidget {
  const Edit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var arg = ModalRoute.of(context)!.settings.arguments as Map;
    String id = arg["id"];
    String title = arg['title'];
    String description = arg['description'];
    String price = arg['price'];
    String url = arg['url'];

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
            onTap: () {
              Data(
                  id: id,
                  title: title,
                  description: description,
                  price: price,
                  url: url);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Title',
              labelStyle: const TextStyle(color: Colors.grey),
              hintStyle: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
              hintText: title,
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Description',
              labelStyle: const TextStyle(color: Colors.grey),
              hintStyle: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
              hintText: description,
            ),
            maxLines: 5,
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Price',
              labelStyle: const TextStyle(color: Colors.grey),
              hintStyle: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
              hintText: price,
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'URL Image',
              labelStyle: const TextStyle(color: Colors.grey),
              hintStyle: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
              hintText: url,
            ),
            maxLines: 5,
          ),
        ],
      ),
    );
  }
}
