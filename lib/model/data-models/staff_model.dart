import 'dart:typed_data';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class StaffModel {
  int id;
  String fname, lname;
  int tel;
  bool isActive;

  Uint8List? image;
  String role;
  String post;
  StaffModel(
      {required this.id,
      required this.fname,
      required this.lname,
      required this.tel,
      required this.isActive,
      required this.image,
      required this.role,
      required this.post});
  get element => [id, fname, lname, tel, isActive, image];
  factory StaffModel.fromJson(Map<String, dynamic> json) {
    return StaffModel(
      id: json['id'],
      fname: json['fname'],
      lname: json['lname'],
      isActive: json['active'],
      role: json['role'],
      post: json['post'],
      tel: json['tel'],
      image: json['picture'],
    );
  }
}
