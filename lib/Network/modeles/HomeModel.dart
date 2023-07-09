class HomeModel {
  bool? status;
  HomeDataModel? data;
  // named constractor
  HomeModel.fromjson(Map<String, dynamic> json) {
    status = json['status'];
    // parse data from another class to use it
    data = HomeDataModel.fromjson(json['data']);
  }
}

//we make class for it because data store as a map we want to take data from it
class HomeDataModel {
  List<BannerModel> banners = [];
  List<ProductModel> products = [];

  // named constractor
  HomeDataModel.fromjson(Map<String, dynamic> json) {
    // to get data in banner from api we make class for it and list with forEach because it's store in list

    json['banners'].forEach((element) {
      banners.add(BannerModel.fromjson(element));
    });
    // to get data in product from api we make class for it and list with forEach because it's store in list
    json['products'].forEach((element) {
      products.add(ProductModel.fromjson(element));
    });
  }
}

//we make class for it because data in banner store as a map we want to take data from it
class BannerModel {
  // choose data you want from Api
  int? id;
  String? image;
  // named constractor
  BannerModel.fromjson(Map<String, dynamic> json) {
    // store this data to use it if data map or list we make new class to store it
    id = json['id'];
    image = json['image'];
  }
}

//we make class for it because data in product store as a map we want to take data from it
class ProductModel {
  int? id;
  dynamic price;
  dynamic oldprice;
  dynamic discount;
  String? image;
  String? name;
  bool? infavorites;
  bool? incart;
  // named constractor
  ProductModel.fromjson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldprice = json['old_price'];
    discount = json['discount'];
    name = json['name'];
    image = json['image'];
    infavorites = json['in_favorites'];
    incart = json['in_cart'];
  }
}
