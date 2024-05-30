import 'dart:ffi';
import 'dart:typed_data';

class RenterModel {
  int id;
  String fname, lname;
  int tel;
  bool isActive;
  Uint8List? image;
  RenterModel(
      {required this.id,
      required this.fname,
      required this.lname,
      required this.tel,
      required this.isActive,
      required this.image});
  get element => [id, fname, lname, tel, isActive, image];
  factory RenterModel.fromJson(Map<String, dynamic> json) {
    return RenterModel(
      id: json['id'],
      fname: json['fname'],
      lname: json['lname'],
      tel: json['tel'],
      image: json['picture'],
      isActive: json['active'],
    );
  }
}
