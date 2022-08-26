import 'package:flutter/material.dart';

class WordTile extends StatelessWidget {
  final String title;
  final String description;
  final String price;
  final String url;
  final Widget trailing;

  const WordTile({
    required this.title,
    required this.description,
    required this.price,
    required this.url,
    required this.trailing,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ListTile(
          leading: Image(image: NetworkImage(url)),
          title: Text(title),
          isThreeLine: true,
          trailing: trailing,
        ),
      ],
    );
  }
}
