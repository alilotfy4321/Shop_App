class ShopHomeModel {
  bool? status;
  String? message;
  ShopHomeData? data;

  ShopHomeModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json['message'];
    data = json['data'] != null ? ShopHomeData.fromJson(json["data"]) : null;
  }
}

class ShopHomeData {
  List<Banners>? banners = [];
  List<Products>? products = [];
  String? ad;
  ShopHomeData.fromJson(Map<String, dynamic> json) {
    if (json['banners'] != null) {
      json['banners'].forEach((element) {
        banners!.add(Banners.fromJson(element));
      });
    }
    if (json['products'] != null) {
      json['products'].forEach((element) {
        products!.add(Products.fromJson(element));
      });
    }

    ad = json['ad'];
  }
}

class Banners {
  num? id;
  String? image;
  Category? category;
  String? product;

  Banners.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    category = json['category'] !=null ?Category.fromJson(json['category']):null;
    product = json['product'];
  }
}

class Category {
  num? id;
  String? image;
  String? name;

  Category({this.id, this.image, this.name});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    name = json['name'];
  }
}

class Products {
  num? id;
  num? price;
  num? oldPrice;
  num? discount;
  String? image;
  String? name;
  String? description;
  List<String>? images = [];
  bool? inFavorites;
  bool? inCart;

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
    json['images'].forEach((image) {
      images?.add(image);
    });
    inFavorites = json['in_favorites'];
    inCart = json['in_cart'];
  }
}
