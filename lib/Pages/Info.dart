import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  const Info({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var arg = ModalRoute.of(context)!.settings.arguments as Map;
    String title = arg['title'];
    String description = arg['description'];
    String price = arg['price'];
    String url = arg['url'];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 165, 55, 130),
        title: Text(
          title,
          // ignore: prefer_const_constructors
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Card(
                color: Colors.grey,
                child: Image(image: NetworkImage(url)),
              ),
              Card(
                color: Colors.grey,
                child: Text(
                  price,
                  style: const TextStyle(fontSize: 50),
                ),
              ),
              Card(
                color: Colors.grey,
                child: Text(
                  description,
                  style: const TextStyle(fontSize: 50),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
