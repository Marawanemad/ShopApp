import 'package:flutter/material.dart';

import '../Network/modeles/categoriesModel.dart';

Widget CategoriesItemBuilder(DataModel datamodel) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: [
        Image(
          image: NetworkImage(datamodel.image!),
          height: 100,
          width: 100,
          fit: BoxFit.cover,
        ),
        const SizedBox(width: 10),
        Text(
          datamodel.name!,
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        const Icon(Icons.arrow_forward_ios_rounded)
      ],
    ),
  );
}
