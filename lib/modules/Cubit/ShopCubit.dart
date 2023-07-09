import 'package:flutter/material.dart';
import 'package:shopapp/Network/API/DioHelper.dart';
import 'package:shopapp/Network/modeles/ChangeFavoriteModel.dart';
import 'package:shopapp/Network/modeles/FavoriteModelData.dart';
import 'package:shopapp/Network/modeles/HomeModel.dart';
import 'package:shopapp/Network/modeles/categoriesModel.dart';
import 'package:shopapp/Network/modeles/login_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/modules/AppScreens/CategoriesScreen.dart';
import 'package:shopapp/modules/AppScreens/FavoritesScreen.dart';
import 'package:shopapp/modules/AppScreens/ProductsScreen.dart';
import 'package:shopapp/widgets/components.dart';
import '../../Network/EndPoint.dart';

import '../../Network/modeles/SearchModel.dart';
import 'ShopState.dart';

class ShopCubit extends Cubit<ShopStates> {
  // to make intialize super cubit
  ShopCubit() : super(ShopIntialStates());
// to make object from cubit use it in any place
  static ShopCubit get(context) => BlocProvider.of(context);
// make NavigationBar Screens
  int currentIndex = 0;
  List<Widget> navigationScreensList = [
    const ProductsScreen(),
    const CategoriesScreen(),
    const FavoritesScreen(),
  ];
// Function to change Navigation Screens
  void changeNavigationScreen(int index) {
    currentIndex = index;
    emit(ChangeNavigationBarStates());
  }

  HomeModel? homemodel;
  void GetHomedData() {
    // to make load when check data
    emit(ShopLoadingStates());
    // make object from Dio to send data to API
    DioHelper.getData(path: HOME, token: token).then((value) {
      // to get data in this model if status success
      homemodel = HomeModel.fromjson(value.data);
      homemodel?.data?.products.forEach((element) {
        favorites.addAll({
          element.id!: element.infavorites!,
        });
      });
      emit(GetHomeDataSuccessStates());
    }).catchError((onError) {
      print("Error when Get Home Data ${onError.toString()}");
      emit(GetHomeDataErrorStates(onError));
    });
  }

  CategoriesModel? categoriesmodel;
  void GetCatigoriesdData() {
    // to make load when check data
    emit(ShopLoadingStates());
    // make object from Dio to send data to API
    DioHelper.getData(
      path: GET_CATEGORIES,
    ).then((value) {
      // to get data in this model if status success
      categoriesmodel = CategoriesModel.fromjson(value.data);
      emit(GetCatigoriesDataSuccessStates());
    }).catchError((onError) {
      print("Error when Get Catigories Data ${onError.toString()}");
      emit(GetCatigoriesDataErrorStates(onError));
    });
  }

  ChangeFavoriteModel? changefavoritemodel;
  Map<int, bool> favorites = {};
  void ChangeId(int productId) {
    favorites[productId] = !favorites[productId]!;
    emit(ChangeFvoriteButtonColorStates());

    DioHelper.postData(
      url: FAVORITES,
      // to check if id in api remove it from favorites if not found add it
      data: {"product_id": productId},
      token: token,
    ).then((value) {
      // to change color of button when pressed button directly
      changefavoritemodel = ChangeFavoriteModel.fromjson(value.data);
      // to check if error in status
      if (!changefavoritemodel!.status!) {
        favorites[productId] = !favorites[productId]!;
      } else {
        GetFavoritesData();
      }
      emit(ChangeFavoritesSuccessStates(changefavoritemodel!));
    }).catchError((onError) {
      print("Error when Change Favoirtes states ${onError.toString()}");
      emit(ChangeFavoritesErrorStates(onError));
    });
  }

  GetFavoriteDataModel? getFavoriteDataModel;
  void GetFavoritesData() {
    emit(ShopFavoriteLoadingStates());

    // make object from Dio to send data to API
    DioHelper.getData(
      path: FAVORITES,
      token: token,
    ).then((value) {
      // to get data in this model if status success
      getFavoriteDataModel = GetFavoriteDataModel.fromjson(value.data);
      emit(GetFavoritesDataSuccessStates());
    }).catchError((onError) {
      print("Error when Get Favoirtes Data ${onError.toString()}");
      emit(GetFavoritesDataErrorStates(onError));
    });
  }

  ShopLoginModel? userModelData;
  void getUserData() {
    emit(ShopUserLoadingStates());

    DioHelper.getData(
      path: PROFILE,
      token: token,
    ).then((value) {
      // to get data in this model if status success
      userModelData = ShopLoginModel.fromjson(value.data);
      print(userModelData.toString());
      emit(GetShopUserSuccessStates(userModelData!));
    }).catchError((onError) {
      print("Error when Change USer Data ${onError.toString()}");
      emit(GetShopUserErrorStates(onError));
    });
  }

  ShopLoginModel? UpdateserModelData;
  void UpdateUserData(
      {required String name,
      required phone,
      required email,
      required password}) {
    emit(UpdateUserLoadingStates());

    DioHelper.putData(
      url: UPDATE_PROFILE,
      token: token,
      data: {
        'name': name,
        'email': email,
        'phone': phone,
        'password': password,
      },
    ).then((value) {
      // to put data in this model if status success
      UpdateserModelData = ShopLoginModel.fromjson(value.data);
      print(userModelData.toString());
      emit(UpdateShopUserSuccessStates(userModelData!));
    }).catchError((onError) {
      print("Error when Change USer Data ${onError.toString()}");
      emit(UpdateShopUserErrorStates(onError));
    });
  }

  IconData suffixIcon = Icons.visibility_off_rounded;
  bool isPasswordobscure = true;
  void ChangeSuffixIcon() {
    isPasswordobscure = !isPasswordobscure;
    isPasswordobscure == true
        ? suffixIcon = Icons.visibility_off_rounded
        : suffixIcon = Icons.visibility_outlined;
    emit(ChangeUpdateSuffixIconState());
  }

  SearchModel? searchmodel;
  void getSearchData({String? SearchText}) {
    emit(SearchLoadingState());
    DioHelper.postData(
      url: SEARCH,
      token: token,
      data: {"text": SearchText},
    ).then((value) {
      searchmodel = SearchModel.fromjson(value.data);
      emit(SearchSuccessState());
    }).catchError((onError) {
      print("Error when Search ${onError.toString()}");
      emit(SearchErrorState(onError));
    });
  }
}
