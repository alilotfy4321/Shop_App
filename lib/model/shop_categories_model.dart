class ShopCategoriesModel {
  bool? status;
  String? message;
  CategoriesData? data;
  ShopCategoriesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data=json['data']!=null?CategoriesData.fromJson(json['data']):null;
  }
}

class CategoriesData {
  int? currentPage;
  List<Data> data = [];
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  String? nextPageURL;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  CategoriesData.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    json['data'].forEach((item) {
      data.add(Data.fromJson(item));
    });
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    nextPageURL = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }
}

class Data {
  int? id;
  String? name;
  String? image;
  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
}
