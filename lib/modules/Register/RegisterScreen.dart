import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/Network/local/sharedpreferncies.dart';
import 'package:shopapp/modules/AppScreens/Shophome.dart';
import 'package:shopapp/modules/Register/Cubit/RegisterCubit.dart';
import 'package:shopapp/modules/Register/Cubit/RegisterState.dart';
import 'package:shopapp/widgets/components.dart';
import 'package:shopapp/widgets/formField.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var nameControler = TextEditingController();
    var emilControler = TextEditingController();
    var passwordControler = TextEditingController();
    var phoneControler = TextEditingController();
    return BlocProvider(
      create: (context) => ShopRegisterCubit(),
      child: BlocConsumer<ShopRegisterCubit, ShopRegisterState>(
        listener: (context, state) {
          if (state is ShopRegisterSuccessState) {
            if (state.RegisterModel.status!) {
              CacheHelper.savedData(
                      key: 'token', value: state.RegisterModel.data!.token)
                  .then((value) {
                token = state.RegisterModel.data!.token;
                navigateAndFinish(
                    context: context, pageScreen: const ShopHome());
              });
            } else {
              ShowToast(
                  msg: state.RegisterModel.message!,
                  colorstate: toastState.ERROR,
                  toasttimelength: toastLengthTime.LONG);
            }
          }
        },
        builder: (context, stata) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('REGISTER',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.w800)),
                        const SizedBox(height: 15),
                        const Text('Register now to browse our hot offers',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(height: 30.0),
                        // Name Field
                        formField(
                            controller: nameControler,
                            keyboardtype: TextInputType.name,
                            text_input_action: TextInputAction.next,
                            validiationMesseage: 'Please Enter Your Name',
                            labelText: 'User Name',
                            prefixicon: const Icon(Icons.person)),
                        const SizedBox(height: 25.0),
                        //  Email Field
                        formField(
                            controller: emilControler,
                            text_input_action: TextInputAction.next,
                            keyboardtype: TextInputType.emailAddress,
                            validiationMesseage:
                                'Please Enter Your Email Address',
                            labelText: 'Email Address',
                            prefixicon: const Icon(Icons.email_outlined)),

                        const SizedBox(height: 25.0),
                        //  Phone Field
                        formField(
                            controller: phoneControler,
                            keyboardtype: TextInputType.phone,
                            text_input_action: TextInputAction.next,
                            validiationMesseage:
                                'Please Enter Your Phone number',
                            labelText: 'Phone',
                            prefixicon: const Icon(Icons.phone_iphone_sharp)),
                        const SizedBox(height: 25.0),
                        // Password Field
                        formField(
                          controller: passwordControler,
                          text_input_action: TextInputAction.done,
                          onsubmit: (value) {
                            if (formKey.currentState!.validate()) {
                              ShopRegisterCubit.get(context).userRegister(
                                  name: nameControler.text,
                                  phone: phoneControler.text,
                                  email: emilControler.text,
                                  password: passwordControler.text);
                            }
                          },
                          keyboardtype: TextInputType.visiblePassword,
                          validiationMesseage: "Password Is Too Short",
                          labelText: 'Password ',
                          obscureText:
                              ShopRegisterCubit.get(context).isPasswordobscure,
                          prefixicon: const Icon(Icons.lock),
                          suffixicon: ShopRegisterCubit.get(context).suffixIcon,
                          suffixpressed: () {
                            ShopRegisterCubit.get(context).ChangeSuffixIcon();
                          },
                        ),

                        const SizedBox(height: 30.0),
                        ConditionalBuilder(
                          condition: stata is! ShopRegisterLoadingState,
                          builder: (context) => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.blue[300],
                            ),
                            width: double.infinity,
                            child: MaterialButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  ShopRegisterCubit.get(context).userRegister(
                                      name: nameControler.text,
                                      phone: phoneControler.text,
                                      email: emilControler.text,
                                      password: passwordControler.text);
                                }
                              },
                              child: const Text(
                                "Register & Login",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          fallback: (context) =>
                              const Center(child: CircularProgressIndicator()),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
