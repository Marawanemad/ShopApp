import 'package:flutter/material.dart';
import 'package:shopapp/Data/data.dart';
import 'package:shopapp/Widgets/CardData.dart';
import 'package:shopapp/Widgets/Cards.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Data> words = [];

  void add(Data word) {
    setState(() {
      words.add(word);
    });
    Navigator.of(context).pop();
  }

  showBottomSheet() {
    return showModalBottomSheet(
      context: context,
      builder: (context) => Cards(add: add),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 165, 55, 130),
        title: const Text(
          "MyShop",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
        actions: [
          GestureDetector(
            child:
                (const Icon(Icons.card_giftcard_outlined, color: Colors.white)),
            onTap: () {
              Navigator.pushNamed(context, '/Products');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemBuilder: ((context, index) => CardData(
                id: words[index].id,
                title: words[index].title,
                description: words[index].description,
                price: words[index].price,
                url: words[index].url,
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
