class CoursesByCategoryId {
  bool? success;
  String? message;
  Data? data;

  CoursesByCategoryId({this.success, this.message, this.data});

  CoursesByCategoryId.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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
  String? categoryName;
  String? imageUrl;
  List<Courses>? courses;

  Data({this.id, this.categoryName, this.imageUrl, this.courses});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['category_name'];
    imageUrl = json['image_url'];
    if (json['Courses'] != null) {
      courses = <Courses>[];
      json['Courses'].forEach((v) {
        courses!.add(Courses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category_name'] = categoryName;
    data['image_url'] = imageUrl;
    if (courses != null) {
      data['Courses'] = courses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Courses {
  int? id;
  int? categoryId;
  String? courseName;
  String? courseLevel;
  int? adminId;
  int? enrollable;
  int? entryExamId;
  int? exam1;
  int? exam2;
  int? exam3;
  int? finalProject;
  String? imageUrl;
  Admin? admin;

  Courses(
      {this.id,
      this.categoryId,
      this.courseName,
      this.courseLevel,
      this.adminId,
      this.enrollable,
      this.entryExamId,
      this.exam1,
      this.exam2,
      this.exam3,
      this.finalProject,
      this.imageUrl,
      this.admin});

  Courses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    courseName = json['course_name'];
    courseLevel = json['course_level'];
    adminId = json['admin_id'];
    enrollable = json['enrollable'];
    entryExamId = json['entryExamId'];
    exam1 = json['exam1'];
    exam2 = json['exam2'];
    exam3 = json['exam3'];
    finalProject = json['finalProject'];
    imageUrl = json['image_url'];
    admin = json['Admin'] != null ? Admin.fromJson(json['Admin']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category_id'] = categoryId;
    data['course_name'] = courseName;
    data['course_level'] = courseLevel;
    data['admin_id'] = adminId;
    data['enrollable'] = enrollable;
    data['entryExamId'] = entryExamId;
    data['exam1'] = exam1;
    data['exam2'] = exam2;
    data['exam3'] = exam3;
    data['finalProject'] = finalProject;
    data['image_url'] = imageUrl;
    if (admin != null) {
      data['Admin'] = admin!.toJson();
    }
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['admin_name'] = adminName;
    data['email'] = email;
    return data;
  }
}
