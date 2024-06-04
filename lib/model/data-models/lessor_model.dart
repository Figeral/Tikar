import 'dart:typed_data';
import 'package:json_annotation/json_annotation.dart';


@JsonSerializable()
class LessorModel {
  int id;
  String fname, lname;
  int tel;
  bool isActive;
  Uint8List? image;
  LessorModel(
      {required this.id,
      required this.fname,
      required this.lname,
      required this.tel,
      required this.isActive,
      required this.image});
  get element => [id, fname, lname, tel, isActive, image];
  factory LessorModel.fromJson(Map<String, dynamic> json) {
    return LessorModel(
      id: json['id'],
      fname: json['fname'],
      lname: json['lname'],
      tel: json['tel'],
      image: json['picture'],
      isActive: json['active'],
    );
  }
}
