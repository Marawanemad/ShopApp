class GetFavoriteDataModel {
  bool? status;
  String? message;
  FavoriteDataModel? favoritedata;

  GetFavoriteDataModel.fromjson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    favoritedata = FavoriteDataModel.fromjson(json['data']);
  }
}

class FavoriteDataModel {
  int? currentPage;
  List<FavoriteData>? data = [];
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  dynamic nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  FavoriteDataModel.fromjson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
    json['data'].forEach((element) {
      data!.add(FavoriteData.fromjson(element));
    });
  }
}

class FavoriteData {
  int? id;
  Product? product;

  FavoriteData.fromjson(Map<String, dynamic> json) {
    id = json['id'];
    product = Product.fromjson(json['product']);
  }
}

class Product {
  int? id;
  dynamic price;
  dynamic oldPrice;
  int? discount;
  String? image;
  String? name;
  String? description;

  Product.fromjson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
  }
}
