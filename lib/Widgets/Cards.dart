import 'package:flutter/material.dart';
import 'package:shopapp/Data/data.dart';

class Cards extends StatelessWidget {
  Cards({
    Key? key,
    required this.add,
  }) : super(key: key);
  final TextEditingController _title = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final TextEditingController _price = TextEditingController();
  final TextEditingController _url = TextEditingController();
  final Function add;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: Colors.grey[400],
        child: Column(
          children: [
            TextFormField(
              controller: _title,
              decoration: const InputDecoration(
                labelText: 'Title',
                labelStyle: TextStyle(color: Color.fromARGB(255, 165, 55, 130)),
                hintText: 'Enter the title',
              ),
            ),
            TextFormField(
              controller: _description,
              decoration: const InputDecoration(
                labelText: 'Description',
                labelStyle: TextStyle(color: Color.fromARGB(255, 165, 55, 130)),
                hintText: 'Enter the description',
              ),
              maxLines: 5,
            ),
            TextFormField(
              controller: _price,
              decoration: const InputDecoration(
                labelText: 'Price',
                labelStyle: TextStyle(color: Color.fromARGB(255, 165, 55, 130)),
                hintText: 'Enter the Price',
              ),
            ),
            TextFormField(
              controller: _url,
              decoration: const InputDecoration(
                labelText: 'URL',
                labelStyle: TextStyle(color: Color.fromARGB(255, 165, 55, 130)),
                hintText: 'Enter the URL',
              ),
              maxLines: 5,
            ),
            FloatingActionButton(
              backgroundColor: const Color.fromARGB(255, 165, 55, 130),
              onPressed: () {
                if (_title.text.isEmpty ||
                    _description.text.isEmpty ||
                    _price.text.isEmpty ||
                    _url.text.isEmpty) return;
                // ignore: void_checks
                return add(Data(
                  id: DateTime.now().toString(),
                  title: _title.text.trim(),
                  description: _description.text.trim(),
                  price: _price.text.trim(),
                  url: _url.text.trim(),
                ));
              },
              child: const Text(
                "Add",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
