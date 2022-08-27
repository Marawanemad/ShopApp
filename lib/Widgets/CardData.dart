import 'package:flutter/material.dart';

class CardData extends StatefulWidget {
  const CardData(
      {Key? key,
      required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.url})
      : super(key: key);

  final String id;
  final String title;
  final String description;
  final String price;
  final String url;
  @override
  State<CardData> createState() => _CardData();
}

class _CardData extends State<CardData> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        color: Colors.grey[700],
        child: Column(
          children: [
            Image(image: NetworkImage(widget.url, scale: 10)),
            Text(
              widget.title,
              style: const TextStyle(color: Colors.white, fontSize: 25),
            )
          ],
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, '/Info');
      },
    );
  }
}
