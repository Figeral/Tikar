import 'dart:typed_data';
import 'package:tikar/constants/utile.dart';
import 'package:json_annotation/json_annotation.dart';

// part lessor_model.g.dart;
// @JsonSerializable(createToJson: true, explicitToJson: true)
class LessorModel {
  int id;
  String fname, lname, gender;
  int tel;
  bool isActive;

  @Uint8ListConverter()
  Uint8List? image;
  LessorModel(
      {required this.id,
      required this.fname,
      required this.lname,
      required this.gender,
      required this.tel,
      required this.isActive,
      required this.image});
  get element => [id, fname, lname, tel, isActive, image];
  factory LessorModel.fromJson(Map<String, dynamic> json) {
    return LessorModel(
      id: json['id'],
      fname: json['fname'],
      lname: json['lname'],
      gender: json['gender'],
      tel: json['tel'],
      image: json['picture'],
      isActive: json['active'],
    );
  }
  // Map<String, dynamic> toJson() => _$toJson(this);
}
