class UserProfileModel {
  bool? success;
  String? message;
  Data? data;

  UserProfileModel({this.success, this.message, this.data});

  UserProfileModel.fromJson(Map<String, dynamic> json) {
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
  Student? student;

  Data({
    this.student,
  });

  Data.fromJson(Map<String, dynamic> json) {
    student =
        json['student'] != null ? Student.fromJson(json['student']) : null;
    if (json['achievements'] != null) {}
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (student != null) {
      data['student'] = student!.toJson();
    }

    return data;
  }
}

class Student {
  int? id;
  String? studentName;
  String? email;
  String? studentPhone;
  String? studentAddress;
  String? createdAt;
  String? updatedAt;

  Student({
    this.id,
    this.studentName,
    this.email,
    this.studentPhone,
    this.studentAddress,
    this.createdAt,
    this.updatedAt,
  });

  Student.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    studentName = json['student_name'];
    email = json['email'];
    studentPhone = json['student_phone'];
    studentAddress = json['student_address'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['student_name'] = studentName;
    data['email'] = email;
    data['student_phone'] = studentPhone;
    data['student_address'] = studentAddress;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;

    return data;
  }
}
