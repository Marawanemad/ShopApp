import 'package:flutter/material.dart';
import 'package:shopapp/Network/API/DioHelper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/Network/EndPoint.dart';
import 'package:shopapp/Network/modeles/login_model.dart';
import 'package:shopapp/modules/Register/Cubit/RegisterState.dart';

class ShopRegisterCubit extends Cubit<ShopRegisterState> {
// to make intialize super cubit
  ShopRegisterCubit() : super(ShopRegisterIntialState());
// to make object from cubit use it in any place
  static ShopRegisterCubit get(context) => BlocProvider.of(context);

  ShopLoginModel? RegisterModel;
  void userRegister(
      {required String email,
      required String password,
      required String name,
      required String phone}) {
    // to make load when check data
    emit(ShopRegisterLoadingState());
    // make object from Dio to send data to API
    DioHelper.postData(
      url: REGISTER,
      data: {
        'name': name,
        'email': email,
        'phone': phone,
        'password': password,
      },
    ).then((value) {
      // to get data in this model if status success
      RegisterModel = ShopLoginModel.fromjson(value.data);

      emit(ShopRegisterSuccessState(RegisterModel!));
    }).catchError((onError) {
      print("Error when Shop Register ${onError.toString()}");
      emit(ShopRegisterErrorState(onError.toString()));
    });
  }

  IconData suffixIcon = Icons.visibility_off_rounded;
  bool isPasswordobscure = true;
  void ChangeSuffixIcon() {
    isPasswordobscure = !isPasswordobscure;
    isPasswordobscure == true
        ? suffixIcon = Icons.visibility_off_rounded
        : suffixIcon = Icons.visibility_outlined;
    emit(ChangeRegisterSuffixIconState());
  }
}
