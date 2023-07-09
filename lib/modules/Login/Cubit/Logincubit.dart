import 'package:flutter/material.dart';
import 'package:shopapp/Network/API/DioHelper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/Network/EndPoint.dart';
import 'package:shopapp/Network/modeles/login_model.dart';

import 'Loginstate.dart';

class ShopLoginCubit extends Cubit<ShopLoginState> {
// to make intialize super cubit
  ShopLoginCubit() : super(ShopLoginIntialState());
// to make object from cubit use it in any place
  static ShopLoginCubit get(context) => BlocProvider.of(context);

  ShopLoginModel? loginModel;
  void userLogin({required String email, required String password}) {
    // to make load when check data
    emit(ShopLoginLoadingState());
    // make object from Dio to send data to API
    DioHelper.postData(
      url: LOGIN,
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      // to get data in this model if status success
      loginModel = ShopLoginModel.fromjson(value.data);

      emit(ShopLoginSuccessState(loginModel!));
    }).catchError((onError) {
      print("Error when Shop Login ${onError.toString()}");
      emit(ShopLoginErrorState(onError.toString()));
    });
  }

  IconData suffixIcon = Icons.visibility_off_rounded;
  bool isPasswordobscure = true;
  void ChangeSuffixIcon() {
    isPasswordobscure = !isPasswordobscure;
    isPasswordobscure == true
        ? suffixIcon = Icons.visibility_off_rounded
        : suffixIcon = Icons.visibility_outlined;
    emit(ChangeSuffixIconState());
  }
}
