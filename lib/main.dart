import 'package:flutter/material.dart';
import 'package:shopapp/Network/API/DioHelper.dart';
import 'package:shopapp/modules/Cubit/ShopCubit.dart';
import 'package:shopapp/modules/Cubit/ShopState.dart';
import 'package:shopapp/widgets/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Network/local/sharedpreferncies.dart';

Future<void> main() async {
  // to check any future line to do it before run app
  WidgetsFlutterBinding.ensureInitialized();
  // to call Dio and create it when app is running
  DioHelper.init();
  // to call sharedPreference and create it when app is running
  await CacheHelper.init();
  // to make variable from getter and send it in main to use in app easely ?? use to check if it =null make it false
  bool? onboarding = CacheHelper.getData(key: "onBoarding") ?? false;
  token = CacheHelper.getData(key: "token") ?? '';

  runApp(MyApp(onboarding!, token!));
}

class MyApp extends StatelessWidget {
  final bool onboarding;
  final String token;
  const MyApp(this.onboarding, this.token, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ShopCubit()
        ..GetHomedData()
        ..GetCatigoriesdData()
        ..GetFavoritesData()
        ..getUserData(),
      child: BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {},
        builder: (context, state) => MaterialApp(
          debugShowCheckedModeBanner: false,
          home: chooseMainScreen(onboarding: onboarding, token: token),
        ),
      ),
    );
  }
}
