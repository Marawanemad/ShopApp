import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/modules/Cubit/ShopCubit.dart';
import 'package:shopapp/modules/Cubit/ShopState.dart';
import 'package:shopapp/widgets/components.dart';

import '../../widgets/BuildProductsItemes.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (BuildContext context, Object? state) {
        if (state is ChangeFavoritesSuccessStates) {
          if (!state.model.status!) {
            ShowToast(
                msg: state.model.message!,
                colorstate: toastState.ERROR,
                toasttimelength: toastLengthTime.LONG);
          }
          ShowToast(
              msg: state.model.message!,
              colorstate: toastState.SUCCESS,
              toasttimelength: toastLengthTime.SHORT);
        }
      },
      builder: (BuildContext context, state) {
        return buildProducts(ShopCubit.get(context).homemodel!,
            ShopCubit.get(context).categoriesmodel!, context);
      },
    );
  }
}
