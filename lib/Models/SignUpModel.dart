// To parse this JSON data, do
//
//     final signUpModel = signUpModelFromJson(jsonString);

import 'dart:convert';

SignUpModel signUpModelFromJson(String str) =>
    SignUpModel.fromJson(json.decode(str));

String signUpModelToJson(SignUpModel data) => json.encode(data.toJson());

class SignUpModel {
  SignUpModel({
    this.success,
    this.message,
    this.data,
  });

  bool? success;
  String? message;
  Data? data;

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
        success: json["success"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.student,
    this.accessToken,
    this.refreshToken,
  });

  Student? student;
  String? accessToken;
  String? refreshToken;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        student: Student.fromJson(json["student"]),
        accessToken: json["access_token"],
        refreshToken: json["refresh_token"],
      );

  Map<String, dynamic> toJson() => {
        "student": student!.toJson(),
        "access_token": accessToken,
        "refresh_token": refreshToken,
      };
}

class Student {
  Student({
    this.id,
    this.studentName,
    this.email,
    this.studentPhone,
    this.studentAddress,
  });

  int? id;
  String? studentName;
  String? email;
  String? passwordHash;
  String? studentPhone;
  String? studentAddress;

  factory Student.fromJson(Map<String, dynamic> json) => Student(
        id: json["id"],
        studentName: json["student_name"],
        email: json["email"],
        studentPhone: json["student_phone"],
        studentAddress: json["student_address"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "student_name": studentName,
        "email": email,
        "student_phone": studentPhone,
        "student_address": studentAddress,
      };
}
