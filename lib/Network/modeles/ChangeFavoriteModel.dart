class ChangeFavoriteModel {
  bool? status;
  String? message;
  ChangeFavoriteModel.fromjson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }
}
