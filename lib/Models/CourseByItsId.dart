class CourseByItsIdModel {
  bool? success;
  String? message;
  Data? data;

  CourseByItsIdModel({this.success, this.message, this.data});

  CourseByItsIdModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? courseName;
  String? courseLevel;
  int? enrollable;
  int? entryExamId;
  int? exam1;
  int? exam2;
  int? exam3;
  int? finalProject;
  String? imageUrl;
  String? createdAt;
  Category? category;
  Admin? admin;

  Data(
      {this.id,
      this.courseName,
      this.courseLevel,
      this.enrollable,
      this.entryExamId,
      this.exam1,
      this.exam2,
      this.exam3,
      this.finalProject,
      this.imageUrl,
      this.createdAt,
      this.category,
      this.admin});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    courseName = json['course_name'];
    courseLevel = json['course_level'];
    enrollable = json['enrollable'];
    entryExamId = json['entryExamId'];
    exam1 = json['exam1'];
    exam2 = json['exam2'];
    exam3 = json['exam3'];
    finalProject = json['finalProject'];
    imageUrl = json['image_url'];
    createdAt = json['createdAt'];
    category =
        json['Category'] != null ? Category.fromJson(json['Category']) : null;
    admin = json['Admin'] != null ? Admin.fromJson(json['Admin']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['course_name'] = courseName;
    data['course_level'] = courseLevel;
    data['enrollable'] = enrollable;
    data['entryExamId'] = entryExamId;
    data['exam1'] = exam1;
    data['exam2'] = exam2;
    data['exam3'] = exam3;
    data['finalProject'] = finalProject;
    data['image_url'] = imageUrl;
    data['createdAt'] = createdAt;
    if (category != null) {
      data['Category'] = category!.toJson();
    }
    if (admin != null) {
      data['Admin'] = admin!.toJson();
    }
    return data;
  }
}

class Category {
  int? id;
  String? categoryName;
  String? imageUrl;

  Category({this.id, this.categoryName, this.imageUrl});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['category_name'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['category_name'] = categoryName;
    data['image_url'] = imageUrl;
    return data;
  }
}

class Admin {
  String? adminName;
  String? email;

  Admin({this.adminName, this.email});

  Admin.fromJson(Map<String, dynamic> json) {
    adminName = json['admin_name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['admin_name'] = adminName;
    data['email'] = email;
    return data;
  }
}
