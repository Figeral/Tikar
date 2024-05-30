import 'dart:ffi';
import 'dart:typed_data';

class StaffModel {
  int id;
  String fname, lname;
  int tel;
  bool isActive;
  Uint8List? image;
  String role;
  StaffModel(
      {required this.id,
      required this.fname,
      required this.lname,
      required this.tel,
      required this.isActive,
      required this.image,
      required this.role});
  get element => [id, fname, lname, tel, isActive, image];
  factory StaffModel.fromJson(Map<String, dynamic> json) {
    return StaffModel(
      id: json['id'],
      fname: json['fname'],
      lname: json['lname'],
      isActive: json['active'],
      role: json['role'],
      tel: json['tel'],
      image: json['picture'],
    );
  }
}
