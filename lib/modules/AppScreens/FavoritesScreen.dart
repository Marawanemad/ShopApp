import 'package:flutter/material.dart';
import 'package:shopapp/Network/modeles/FavoriteModelData.dart';
import 'package:shopapp/modules/Cubit/ShopCubit.dart';
import 'package:shopapp/modules/Cubit/ShopState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import '../../widgets/components.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(listener: (context, state) {
      if (state is ChangeFavoritesSuccessStates) {
        if (!state.model.status!) {
          ShowToast(
              msg: state.model.message!,
              colorstate: toastState.ERROR,
              toasttimelength: toastLengthTime.LONG);
        }
      }
    }, builder: (context, state) {
      int itemCount = ShopCubit.get(context)
              .getFavoriteDataModel
              ?.favoritedata
              ?.data
              ?.length ??
          0;
      FavoriteDataModel favoriteData =
          ShopCubit.get(context).getFavoriteDataModel!.favoritedata!;
      return ConditionalBuilder(
        condition: state != ShopFavoriteLoadingStates(),
        builder: (context) => (itemCount != 0)
            ? ListView.separated(
                itemBuilder: (context, index) => BuildProductsItemes(
                  ProductData: favoriteData.data![index].product!,
                  context: context,
                ),
                separatorBuilder: (context, index) => const Divider(
                  color: Colors.grey,
                ),
                itemCount: itemCount,
              )
            : const Padding(
                padding: EdgeInsets.all(20.0),
                child: Center(
                  child: Expanded(
                      child: Text(
                    "You Don't Have any Favoritess Add one",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        height: 1.5,
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  )),
                ),
              ),
        fallback: (context) => const Center(child: CircularProgressIndicator()),
      );
    });
  }
}
