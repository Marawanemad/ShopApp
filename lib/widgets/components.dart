import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shopapp/modules/Cubit/ShopCubit.dart';
import 'package:shopapp/modules/Login/login_screen.dart';

import '../Network/local/sharedpreferncies.dart';
import '../modules/AppScreens/Shophome.dart';
import '../modules/onboardingScreen.dart';

// to use it in any place
String? token = '';
// to make navigator with replacment can not return back
void navigateAndFinish({required context, required pageScreen}) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => pageScreen,
    ),
    (route) => false,
  );
}

// to make navigator without replacment can return back
void navigate({required context, required pageScreen}) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => pageScreen,
      ));
}

// to show alert messeage
void ShowToast(
    {required String msg,
    required toastState colorstate,
    required toastLengthTime toasttimelength}) {
  Fluttertoast.showToast(
    msg: msg,
    // to show the time of messeage in android long =5sec , short=1sec
    toastLength: chooseToastLength(toasttimelength),
    // to show the time of messeage in web and IOS
    timeInSecForIosWeb: 1,
    backgroundColor: chooseToastColor(colorstate),
    fontSize: 15,
    textColor: Colors.white,
  );
}

// enum to choose from multiple state
enum toastState { SUCCESS, ERROR, WARNING }

enum toastLengthTime { LONG, SHORT }

// to choose Time depending on toastLengthTime
chooseToastLength(toastLengthTime state) {
  switch (state) {
    case toastLengthTime.LONG:
      return Toast.LENGTH_LONG;
    case toastLengthTime.SHORT:
      return Toast.LENGTH_SHORT;
  }
}

// to choose color depending on colorstate
Color chooseToastColor(toastState colorstate) {
  switch (colorstate) {
    case toastState.SUCCESS:
      return Colors.green;
    case toastState.ERROR:
      return Colors.red;
    case toastState.WARNING:
      return Colors.amber;
  }
}

// to choose the Main Screen Depending on onBoarding and Token Saved in SharedPreferencies
Widget chooseMainScreen({required bool onboarding, required String token}) {
  if (onboarding == true) {
    return token != '' ? const ShopHome() : LoginScreen();
  } else {
    return const onboardingscreen();
  }
}

// to Make SignOut button use to remove token from SharedPreferenceis to make app open on login Screen until make Success login and save new token and navigate to login Screen
void SignOut({required context}) {
  CacheHelper.removeData(key: 'token').then((value) {
    if (value) {
      navigateAndFinish(context: context, pageScreen: LoginScreen());
    }
  });
}

// Build itemes use in Favorite
Widget BuildProductsItemes(
    {required ProductData, required context, oldPrice = true}) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: SizedBox(
      height: 120,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            // to make the widget show in the bottomstart
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Image(
                image: NetworkImage(ProductData.image!),
                width: 120,
                height: 120,
                fit: BoxFit.contain,
              ),
              if (ProductData.discount != 0 && oldPrice)
                Container(
                    color: Colors.red,
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: const Text(
                      'Discount',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                      ),
                    )),
            ],
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ProductData.name!,
                  style: const TextStyle(fontSize: 14, height: 1.3),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                const Spacer(),
                Row(
                  children: [
                    Text(
                      // round to turn it to int if come double
                      '${ProductData.price}',
                      style: const TextStyle(fontSize: 12, color: Colors.blue),
                    ),
                    const SizedBox(width: 5),
                    if (ProductData.discount != 0 && oldPrice)
                      Text(
                        // round to turn it to int if come double
                        '${ProductData.oldPrice}',
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.red,
                          // to make line on the word
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    // to make the button in the end of row
                    const Spacer(),
                    IconButton(
                        onPressed: () =>
                            ShopCubit.get(context).ChangeId(ProductData.id),
                        icon: CircleAvatar(
                          radius: 15,
                          backgroundColor:
                              ShopCubit.get(context).favorites[ProductData.id]!
                                  ? Colors.red
                                  : Colors.grey[400],
                          child: const Icon(
                            Icons.favorite_rounded,
                            color: Colors.white,
                            size: 15,
                          ),
                        ))
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
