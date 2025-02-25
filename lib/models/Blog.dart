class Blog {
  Blog({
      this.status, 
      this.data, 
      this.message,});

  Blog.fromJson(dynamic json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }
  bool? status;
  Data? data;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['message'] = message;
    return map;
  }

}

class Data {
  Data({
      this.subTitle, 
      this.body2, 
      this.images, 
      this.deletedAt, 
      this.isDeleted, 
      this.body1, 
      this.id, 
      this.title, 
      this.body3, 
      this.createdAt, 
      this.updatedAt,});

  Data.fromJson(dynamic json) {
    subTitle = json['sub_title'] != null ? json['sub_title'].cast<String>() : [];
    body2 = json['body2'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    deletedAt = json['deleted_at'];
    isDeleted = json['is_deleted'];
    body1 = json['body1'];
    id = json['id'];
    title = json['title'];
    body3 = json['body3'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  List<String>? subTitle;
  String? body2;
  List<String>? images;
  dynamic deletedAt;
  bool? isDeleted;
  String? body1;
  int? id;
  String? title;
  String? body3;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sub_title'] = subTitle;
    map['body2'] = body2;
    map['images'] = images;
    map['deleted_at'] = deletedAt;
    map['is_deleted'] = isDeleted;
    map['body1'] = body1;
    map['id'] = id;
    map['title'] = title;
    map['body3'] = body3;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}