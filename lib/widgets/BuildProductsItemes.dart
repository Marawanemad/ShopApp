import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shopapp/modules/Cubit/ShopCubit.dart';

import '../Network/modeles/HomeModel.dart';
import '../Network/modeles/categoriesModel.dart';

// Widget to build carousel and Grid view to use it in more than place dynamicl
Widget buildProducts(HomeModel Homemodel, CategoriesModel Categoriesmodel,
    BuildContext context) {
  return SingleChildScrollView(
    // to make shape bounce when scroll at the top
    physics: const BouncingScrollPhysics(),
    child: Column(
      children: [
        // libirary use to make auto images show slider
        CarouselSlider(
          // to get list of images from data in api stored in cubit
          items: Homemodel.data!.banners
              .map((e) => Image(
                  image: NetworkImage('${e.image}'),
                  width: double.infinity,
                  fit: BoxFit.contain))
              .toList(),
          options: CarouselOptions(
              height: 190,
              // to start from first page
              initialPage: 0,
              // to make the photo take all screen size
              viewportFraction: 1,
              // to make it run again when reach to the end
              enableInfiniteScroll: true,
              // to make it not scroll from end to start
              reverse: false,
              // to make scroll automatic
              autoPlay: true,
              // to give it time to scroll after it
              autoPlayInterval: const Duration(seconds: 3),
              // to give it time to animation after it
              autoPlayAnimationDuration: const Duration(seconds: 1),
              // to make shape of scroll
              autoPlayCurve: Curves.fastOutSlowIn,
              // to make diriction of the scroll
              scrollDirection: Axis.horizontal),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Categories",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 100,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => buildCatigoriesItem(
                        Categoriesmodel.data!.datamodel[index]),
                    itemCount: Categoriesmodel.data!.datamodel.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 10)),
              ),
              const SizedBox(height: 10),
              const Text(
                "New Products",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        // to make view show 2 items behiend each other
        Container(
          color: Colors.grey[300],
          child: GridView.count(
            // to make grid view scroll with the all singleChildScrollView
            shrinkWrap: true,
            // to make space between grids and the grids above and under it
            mainAxisSpacing: 10,
            // to make space between grids and the grids behind it
            crossAxisSpacing: 10,
            // to make divition hight and width
            childAspectRatio: 1 / 1.71,
            // to stop grid view scroll alone
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            // to generate items take length and make it
            children: List.generate(
              Homemodel.data!.products.length,
              (index) => buildGridViewProducts(
                  Homemodel.data!.products[index], context),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget buildGridViewProducts(ProductModel model, context) {
  return Container(
    color: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            // to make widget on the image
            Stack(
                // to make the widget show in the bottomstart
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  Image(
                    image: NetworkImage(model.image!),
                    width: double.infinity,
                    height: 200,
                  ),
                  if (model.discount != 0)
                    Container(
                      color: Colors.red,
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: const Text(
                        'Discount',
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      ),
                    ),
                ]),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.name!,
                style: const TextStyle(fontSize: 12, height: 1.1),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Row(
                children: [
                  Text(
                    // round to turn it to int if come double
                    '${model.price.round()}',
                    style: const TextStyle(fontSize: 12, color: Colors.blue),
                  ),
                  const SizedBox(width: 5),
                  if (model.discount != 0)
                    Text(
                      // round to turn it to int if come double
                      '${model.oldprice.round()}',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.red,
                        // to make line on the word
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  // to make the button in the end of row
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                        ShopCubit.get(context).ChangeId(model.id!);
                      },
                      icon: CircleAvatar(
                        radius: 15,
                        backgroundColor:
                            ShopCubit.get(context).favorites[model.id]!
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
  );
}

Widget buildCatigoriesItem(DataModel datamodel) {
  return Stack(
    alignment: AlignmentDirectional.bottomCenter,
    children: [
      Image(
        image: NetworkImage(datamodel.image!),
        height: 100,
        width: 100,
        fit: BoxFit.cover,
      ),
      Container(
        // withOpacity to make color degree under control
        color: Colors.black.withOpacity(0.6),
        width: 100,
        child: Text(
          datamodel.name!,
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: Colors.white),
        ),
      ),
    ],
  );
}
