import 'dart:typed_data';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class RenterModel {
  int id;
  String fname, lname, gender;
  int tel;

  bool isActive;

  Uint8List? image;
  RenterModel(
      {required this.id,
      required this.fname,
      required this.lname,
      required this.gender,
      required this.tel,
      required this.isActive,
      required this.image});
  get element => [id, fname, lname, tel, isActive, image];
  factory RenterModel.fromJson(Map<String, dynamic> json) {
    return RenterModel(
      id: json['id'],
      fname: json['fname'],
      lname: json['lname'],
      gender: json['gender'],
      tel: json['tel'],
      image: json['picture'],
      isActive: json['active'],
    );
  }
}
