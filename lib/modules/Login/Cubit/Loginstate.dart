import 'package:shopapp/Network/modeles/login_model.dart';

abstract class ShopLoginState {}

class ShopLoginIntialState extends ShopLoginState {}

class ShopLoginLoadingState extends ShopLoginState {}

class ShopLoginSuccessState extends ShopLoginState {
// make it take parameter to listen on it in blocConsumer
  final ShopLoginModel loginModel;
  ShopLoginSuccessState(this.loginModel);
}

class ShopLoginErrorState extends ShopLoginState {
  final String error;
  ShopLoginErrorState(this.error);
}

class ChangeSuffixIconState extends ShopLoginState {}
