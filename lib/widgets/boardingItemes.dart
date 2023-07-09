import 'package:flutter/material.dart';
import 'package:shopapp/Network/local/sharedpreferncies.dart';
import 'package:shopapp/modules/Login/login_screen.dart';
import 'package:shopapp/widgets/components.dart';

// make onBoarding Items
Widget buildBoardingItem(boarding) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Image(image: AssetImage('${boarding.image}'))),
          const SizedBox(
            height: 30,
          ),
          Text("${boarding.HeadTitle}",
              style:
                  const TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 30,
          ),
          Text(
            '${boarding.BodyTitle}',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ]);

// function to make sharedPreferencies true when end onboarding and navigate to loginScreen
void onBoardingClick({
  required context,
}) {
  CacheHelper.savedData(key: "onBoarding", value: true);
  navigateAndFinish(context: context, pageScreen: LoginScreen());
}
