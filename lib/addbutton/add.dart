import 'package:flutter/material.dart';
import 'package:shopapp/model/model.dart';
import 'package:shopapp/widgets/editcard.dart';

class Add extends StatelessWidget {
  Add({
    Key? key,
    required this.additem,
  }) : super(key: key);
  final TextEditingController _title = TextEditingController();
  final TextEditingController _disc = TextEditingController();
  final TextEditingController _price = TextEditingController();
  final TextEditingController _url = TextEditingController();

  final Function additem;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                //mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: _title,
                    decoration: const InputDecoration(
                      labelText: 'title',
                      hintText: 'Enter the new title',
                    ),
                  ),
                  TextFormField(
                    controller: _disc,
                    decoration: const InputDecoration(
                      labelText: 'Discription',
                      hintText: 'Enter the new discription',
                    ),
                    maxLines: 5,
                  ),
                  TextFormField(
                    controller: _price,
                    decoration: const InputDecoration(
                      labelText: 'Price',
                      hintText: 'Enter the new price',
                    ),
                  ),
                  TextFormField(
                    controller: _url,
                    decoration: const InputDecoration(
                      labelText: 'URL Image',
                      hintText: 'Enter the new title',
                    ),
                    maxLines: 5,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // ignore: void_checks
                      return additem(
                        Model(
                          id: DateTime.now().toString(),
                          title: _title.text.trim(),
                          description: _disc.text.trim(),
                          price: _price.text.trim(),
                          url: _url.text.trim(),
                        ),
                      );
                    },
                    child: const Text('Add'),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
