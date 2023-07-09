import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/Network/local/sharedpreferncies.dart';
import 'package:shopapp/modules/AppScreens/Shophome.dart';
import 'package:shopapp/modules/Login/Cubit/Logincubit.dart';
import 'package:shopapp/modules/Login/Cubit/Loginstate.dart';
import 'package:shopapp/modules/Register/RegisterScreen.dart';
import 'package:shopapp/widgets/components.dart';
import 'package:shopapp/widgets/formField.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var emilControler = TextEditingController();
    var passwordControler = TextEditingController();
    return BlocProvider(
      create: (context) => ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit, ShopLoginState>(
        listener: ((context, state) {
          if (state is ShopLoginSuccessState) {
            if (state.loginModel.status!) {
              CacheHelper.savedData(
                      key: 'token', value: state.loginModel.data!.token)
                  .then((value) {
                token = state.loginModel.data!.token;
                navigateAndFinish(
                    context: context, pageScreen: const ShopHome());
              });
            } else {
              ShowToast(
                colorstate: toastState.ERROR,
                msg: state.loginModel.message!,
                toasttimelength: toastLengthTime.LONG,
              );
            }
          }
        }),
        builder: ((context, state) {
          return Scaffold(
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('LOGIN',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.w800)),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text('Login now to browse our hot offers',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(
                          height: 30.0,
                        ),
                        // To Make Eamil Field
                        formField(
                            controller: emilControler,
                            labelText: 'Email Address',
                            prefixicon: const Icon(Icons.email_outlined),
                            keyboardtype: TextInputType.emailAddress,
                            validiationMesseage:
                                'Please Enter Your Email Address',
                            text_input_action: TextInputAction.next),
                        const SizedBox(height: 25.0),
                        // To Make Password Field
                        formField(
                          controller: passwordControler,
                          text_input_action: TextInputAction.done,
                          onsubmit: (value) {
                            if (formKey.currentState!.validate()) {
                              ShopLoginCubit.get(context).userLogin(
                                  email: emilControler.text,
                                  password: passwordControler.text);
                            }
                            ;
                          },
                          keyboardtype: TextInputType.visiblePassword,
                          validiationMesseage: 'Password Is Too Short',
                          labelText: 'Password ',
                          obscureText:
                              ShopLoginCubit.get(context).isPasswordobscure,
                          prefixicon: const Icon(Icons.lock),
                          suffixicon: ShopLoginCubit.get(context).suffixIcon,
                          suffixpressed: () {
                            ShopLoginCubit.get(context).ChangeSuffixIcon();
                          },
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        ConditionalBuilder(
                          // ignore: unnecessary_type_check
                          condition: state is! ShopLoginLoadingState,
                          builder: (context) => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.blue[300],
                            ),
                            width: double.infinity,
                            child: MaterialButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  ShopLoginCubit.get(context).userLogin(
                                      email: emilControler.text,
                                      password: passwordControler.text);
                                }
                              },
                              child: const Text(
                                "LOGIN",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          fallback: (context) =>
                              const Center(child: CircularProgressIndicator()),
                        ),
                        const SizedBox(height: 15.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Don\'t have an account?'),
                            TextButton(
                                onPressed: () {
                                  navigate(
                                      context: context,
                                      pageScreen: RegisterScreen());
                                },
                                child: const Text('Register'))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
