import 'package:flutter/material.dart';
import 'package:shopapp/addbutton/add.dart';
import 'package:shopapp/model/model.dart';
import 'package:shopapp/Screens/EditScreen.dart';

class EditCard extends StatefulWidget {
  const EditCard({Key? key}) : super(key: key);

  @override
  State<EditCard> createState() => _EditCard();
}

class _EditCard extends State<EditCard> {
  final List<Model> words = [];
  bool isDeleted = false;
  void deleteWord(String id) {
    setState(() {
      words.removeWhere((element) => element.id == id);
    });
  }

  void additem(Model word) {
    setState(() {
      words.add(word);
    });
    Navigator.of(context).pop();
  }

  showBottomSheet() {
    return showModalBottomSheet(
      context: context,
      builder: (context) => Add(additem: additem),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 165, 55, 130),
        title: const Text(
          "My Shop",
          style: TextStyle(color: Colors.white, fontSize: 25),
          textAlign: TextAlign.start,
        ),
        actions: [
          GestureDetector(
            child:
                (const Icon(Icons.card_giftcard_outlined, color: Colors.white)),
            onTap: () {
              Navigator.pushNamed(context, '/Escreen');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemBuilder: ((context, index) => WordTile(
                title: words[index].title,
                description: words[index].description,
                price: words[index].price,
                url: words[index].url,
                trailing: isDeleted
                    ? IconButton(
                        onPressed: () => deleteWord(words[index].id),
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ))
                    : const SizedBox(),
              )),
          itemCount: words.length,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 165, 55, 130),
          onPressed: showBottomSheet,
          child: const Text("add")),
    );
  }
}
