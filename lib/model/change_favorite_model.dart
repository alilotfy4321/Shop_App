class ChangeFavoratesModel {
  bool? status;
  String? message;
  ChangeFavoratesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }
}
