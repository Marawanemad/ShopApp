import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  const Info({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 165, 55, 130),
        title: const Text(
          "title",
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
            children: const [
              Card(
                color: Colors.grey,
                child: Image(image: NetworkImage("url")),
              ),
              Card(
                color: Colors.grey,
                child: Text(
                  'price',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Card(
                color: Colors.grey,
                child: Text(
                  'description',
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
