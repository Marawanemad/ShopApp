import 'package:flutter/material.dart';
import 'package:shopapp/modules/Cubit/ShopCubit.dart';
import 'package:shopapp/modules/Cubit/ShopState.dart';
import 'package:shopapp/widgets/formField.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import '../../widgets/components.dart';
import '../Search/SearchScreen.dart';

// ignore: must_be_immutable
class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        // to show data in the api in text form field
        var cubit = ShopCubit.get(context);
        nameController.text = cubit.userModelData?.data?.name ?? '';
        emailController.text = cubit.userModelData?.data?.email ?? '';
        phoneController.text = cubit.userModelData?.data?.phone ?? '';
        return Scaffold(
          appBar: AppBar(
              // to change arrow back button shape
              leading: IconButton(
                color: Colors.black,
                icon: const Icon(
                  Icons.arrow_back_ios_rounded,
                  size: 25,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: const Text(
                "Shop APP",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: IconButton(
                    iconSize: 30,
                    icon: const Icon(
                      Icons.search_rounded,
                      color: Colors.black,
                    ),
                    onPressed: () => navigate(
                        context: context, pageScreen: const SearchScreen()),
                  ),
                ),
              ],
              backgroundColor: Colors.white,
              elevation: 0),
          body: Center(
            child: ConditionalBuilder(
              // ignore: unnecessary_null_comparison
              condition: cubit.userModelData != null,
              builder: (BuildContext context) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: formkey,
                      child: Column(children: [
                        // to make shape loading when click update button
                        if (state is UpdateUserLoadingStates)
                          const LinearProgressIndicator(),
                        const SizedBox(height: 20),
                        //  to make name field
                        formField(
                            controller: nameController,
                            text_input_action: TextInputAction.next,
                            labelText: "Name",
                            prefixicon: const Icon(Icons.person),
                            keyboardtype: TextInputType.name,
                            validiationMesseage: "Name must not be Empty"),
                        const SizedBox(height: 20),
                        //  to make Email field
                        formField(
                            controller: emailController,
                            text_input_action: TextInputAction.next,
                            labelText: "Email Address",
                            prefixicon: const Icon(Icons.email),
                            keyboardtype: TextInputType.emailAddress,
                            validiationMesseage: "Email must not be Empty"),
                        const SizedBox(height: 20),
                        //  to make Phone field
                        formField(
                            controller: phoneController,
                            text_input_action: TextInputAction.next,
                            labelText: "Phone",
                            prefixicon:
                                const Icon(Icons.phone_android_outlined),
                            keyboardtype: TextInputType.phone,
                            validiationMesseage: "Phone must not be Empty"),
                        const SizedBox(height: 20),
                        //  to make Password field
                        formField(
                          controller: passwordController,
                          text_input_action: TextInputAction.done,
                          prefixicon: const Icon(Icons.lock_outline_rounded),
                          onsubmit: (value) {
                            if (formkey.currentState!.validate()) {
                              cubit.UpdateUserData(
                                  name: nameController.text,
                                  email: emailController.text,
                                  phone: phoneController.text,
                                  password: passwordController.text);
                            }
                          },
                          obscureText: cubit.isPasswordobscure,
                          suffixpressed: cubit.ChangeSuffixIcon,
                          suffixicon: cubit.suffixIcon,
                          labelText: 'Password',
                          hentText: 'Write your Password',
                          keyboardtype: TextInputType.visiblePassword,
                        ),
                        const SizedBox(height: 20),

                        // Update Data button
                        MaterialButton(
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.blue[400],
                                borderRadius: BorderRadius.circular(50)),
                            height: 45,
                            child: const Text(
                              "UPDATE",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          // to Make SignOut button use to remove token from SharedPreferenceis to make app open on login Screen until make Success login and save new token and navigate to login Screen
                          onPressed: () {
                            if (formkey.currentState!.validate()) {
                              cubit.UpdateUserData(
                                  name: nameController.text,
                                  email: emailController.text,
                                  phone: phoneController.text,
                                  password: passwordController.text);
                            }
                          },
                        ),
                        const SizedBox(height: 20),
                        // log out button
                        MaterialButton(
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.blue[400],
                                borderRadius: BorderRadius.circular(50)),
                            height: 45,
                            child: const Text(
                              "LOG OUT",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          // to Make SignOut button use to remove token from SharedPreferenceis to make app open on login Screen until make Success login and save new token and navigate to login Screen
                          onPressed: () {
                            SignOut(context: context);
                          },
                        ),
                      ]),
                    ),
                  ),
                );
              },
              fallback: (context) {
                return const CircularProgressIndicator();
              },
            ),
          ),
        );
      },
    );
  }
}
