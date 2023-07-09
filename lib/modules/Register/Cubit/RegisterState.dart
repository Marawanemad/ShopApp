import 'package:shopapp/Network/modeles/login_model.dart';

abstract class ShopRegisterState {}

class ShopRegisterIntialState extends ShopRegisterState {}

class ShopRegisterLoadingState extends ShopRegisterState {}

class ShopRegisterSuccessState extends ShopRegisterState {
// make it take parameter to listen on it in blocConsumer
  final ShopLoginModel RegisterModel;
  ShopRegisterSuccessState(this.RegisterModel);
}

class ShopRegisterErrorState extends ShopRegisterState {
  final String error;
  ShopRegisterErrorState(this.error);
}

class ChangeRegisterSuffixIconState extends ShopRegisterState {}
