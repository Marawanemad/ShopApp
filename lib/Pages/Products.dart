import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  const Products({
    Key? key,
  }) : super(key: key);

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    var arg = ModalRoute.of(context)!.settings.arguments as Map;
    List words = arg['words'];
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
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Column(children: [
            Card(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 50,
                  child: Image(image: NetworkImage(words[index].url)),
                ),
                Text(
                  words[index].title,
                  style: const TextStyle(color: Colors.black, fontSize: 20),
                ),
                GestureDetector(
                  child: (const Icon(Icons.edit, color: Colors.grey)),
                  onTap: () {
                    Navigator.pushNamed(context, '/Edit', arguments: {
                      "title": words[index].title,
                      "id": words[index].id,
                      "description": words[index].description,
                      "price": words[index].price,
                      "url": words[index].url,
                    });
                  },
                ),
                GestureDetector(
                  child: (const Icon(Icons.delete, color: Colors.red)),
                  onTap: () {
                    setState(() {
                      words.removeWhere(
                          (element) => element.id == words[index].id);
                    });
                  },
                ),
              ],
            ))
          ]);
        },
        itemCount: words.length,
      ),
    );
  }
}
