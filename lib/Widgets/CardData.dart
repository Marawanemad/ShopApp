import 'package:flutter/material.dart';

class CardData extends StatelessWidget {
  final String id;
  final String title;
  final String description;
  final String price;
  final String url;

  const CardData({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.url,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(image: NetworkImage(url)),
        Text(
          title,
          style: const TextStyle(color: Colors.white),
        )
      ],
    );
  }
}
