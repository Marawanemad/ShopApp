import 'package:flutter/material.dart';
import 'package:shopapp/modules/Cubit/ShopCubit.dart';
import 'package:shopapp/modules/Cubit/ShopState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Network/modeles/categoriesModel.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ListView.separated(
            itemBuilder: (context, index) => CategoriesItemBuilder(
                ShopCubit.get(context).categoriesmodel!.data!.datamodel[index]),
            separatorBuilder: (context, index) =>
                const Divider(thickness: 1, color: Colors.grey),
            itemCount:
                ShopCubit.get(context).categoriesmodel!.data!.datamodel.length);
      },
    );
  }
}

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
