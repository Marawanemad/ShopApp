import 'package:shopapp/Network/modeles/ChangeFavoriteModel.dart';
import 'package:shopapp/Network/modeles/login_model.dart';

abstract class ShopStates {}

class ShopIntialStates extends ShopStates {}

class ChangeNavigationBarStates extends ShopStates {}

class ShopSuccessStates extends ShopStates {}

class ShopLoadingStates extends ShopStates {}

class ShopErrorStates extends ShopStates {
  final String error;
  ShopErrorStates(this.error);
}

class GetHomeDataSuccessStates extends ShopStates {}

class GetHomeDataErrorStates extends ShopStates {
  final String error;
  GetHomeDataErrorStates(this.error);
}

class GetCatigoriesDataSuccessStates extends ShopStates {}

class GetCatigoriesDataErrorStates extends ShopStates {
  final String error;
  GetCatigoriesDataErrorStates(this.error);
}

class ChangeFavoritesSuccessStates extends ShopStates {
  // to listen on it in listnter
  final ChangeFavoriteModel model;
  ChangeFavoritesSuccessStates(this.model);
}

class ChangeFvoriteButtonColorStates extends ShopStates {}

class ChangeFavoritesErrorStates extends ShopStates {
  final String error;
  ChangeFavoritesErrorStates(this.error);
}

class ShopFavoriteLoadingStates extends ShopStates {}

class GetFavoritesDataSuccessStates extends ShopStates {}

class GetFavoritesDataErrorStates extends ShopStates {
  final String error;
  GetFavoritesDataErrorStates(this.error);
}

class ShopUserLoadingStates extends ShopStates {}

class GetShopUserSuccessStates extends ShopStates {
  // to listen on it in listnter
  final ShopLoginModel userModelData;
  GetShopUserSuccessStates(this.userModelData);
}

class GetShopUserErrorStates extends ShopStates {
  final String error;
  GetShopUserErrorStates(this.error);
}

class SignOutSuccessStates extends ShopStates {}

class SignOutErrorStates extends ShopStates {
  final String error;
  SignOutErrorStates(this.error);
}

class UpdateUserLoadingStates extends ShopStates {}

class UpdateShopUserSuccessStates extends ShopStates {
  // to listen on it in listnter
  final ShopLoginModel userModelData;
  UpdateShopUserSuccessStates(this.userModelData);
}

class UpdateShopUserErrorStates extends ShopStates {
  final String error;
  UpdateShopUserErrorStates(this.error);
}

class ChangeUpdateSuffixIconState extends ShopStates {}

class SearchLoadingState extends ShopStates {}

class SearchSuccessState extends ShopStates {}

class SearchErrorState extends ShopStates {
  final String Error;
  SearchErrorState(this.Error);
}
