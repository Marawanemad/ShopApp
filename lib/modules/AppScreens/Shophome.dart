import 'package:flutter/material.dart';
import 'package:shopapp/modules/Cubit/ShopCubit.dart';
import 'package:shopapp/modules/Cubit/ShopState.dart';
import 'package:shopapp/modules/Search/SearchScreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import '../../widgets/components.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

import 'SettingsScreen.dart';

// ignore: must_be_immutable
class ShopHome extends StatelessWidget {
  const ShopHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ShopCubit()
        ..GetHomedData()
        ..GetCatigoriesdData()
        ..GetFavoritesData(),
      child: BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ShopCubit.get(context);
          return ConditionalBuilder(
            condition: cubit.homemodel != null && cubit.categoriesmodel != null,
            builder: (BuildContext context) => Scaffold(
              // use to remove background color of any widget on scaffold like color of gap in AnimatedBottomNavigationBar and floating actionButton
              extendBody: true,
              appBar: AppBar(
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
              body: cubit.navigationScreensList[cubit.currentIndex],
              floatingActionButton: FloatingActionButton(
                splashColor: Colors.white,
                backgroundColor: Colors.blue[200],
                onPressed: () => navigate(
                  context: context,
                  pageScreen: SettingsScreen(),
                ),
                child: const Icon(Icons.settings),
              ),
              // to make button in the Center of the screen
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.endDocked,
              // make animation action Bar
              bottomNavigationBar: AnimatedBottomNavigationBar(
                  backgroundColor: Colors.blue[200],
                  icons: const [
                    Icons.home,
                    Icons.apps,
                    Icons.favorite,
                  ],
                  // to make time of inimation
                  splashSpeedInMilliseconds: 300,
                  activeIndex: cubit.currentIndex,
                  // to make bar hight
                  height: 60,
                  // to make icons size
                  iconSize: 30,
                  // to make radius of the splash when click on icon
                  splashRadius: 30,
                  // to make color of the splash when click on icon
                  splashColor: Colors.white,
                  // to make edges of curves
                  notchSmoothness: NotchSmoothness.verySmoothEdge,
                  // to make gap of button in the center
                  gapLocation: GapLocation.end,
                  activeColor: Colors.white,
                  inactiveColor: Colors.grey[600],
                  onTap: (index) {
                    cubit.changeNavigationScreen(index);
                  }),
            ),
            fallback: (BuildContext context) => Scaffold(
              // use to remove background color of any widget on scaffold like color of gap in AnimatedBottomNavigationBar and floating actionButton
              extendBody: true,
              appBar: AppBar(
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
              body: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        },
      ),
    );
  }
}
