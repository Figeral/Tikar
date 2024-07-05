import 'dart:typed_data';
import 'package:json_annotation/json_annotation.dart';
import 'package:tikar/model/data-models/staff_model.dart';
import 'package:tikar/model/data-models/lessor_model.dart';

// @JsonSerializable()
class AssetModel {
  int id;
  LessorModel? lessor;
  StaffModel addedBy;
  // List<BasementModel>? basements;
  int? numberOfFloors, numberOfHalls;
  int surfaceArea, estimatedValue;
  int? matricule;
  String? name, address, ville, description;
  String assetType;

  Uint8List? image;
  bool isActive;

  String? type;
  AssetModel({
    required this.id,
    required this.lessor,
    required this.addedBy,
    // required this.basements,
    required this.matricule,
    required this.surfaceArea,
    required this.estimatedValue,
    required this.numberOfFloors,
    this.numberOfHalls,
    required this.name,
    required this.address,
    required this.ville,
    required this.description,
    required this.assetType,
    required this.type,
    required this.image,
    required this.isActive,
  });
  factory AssetModel.fromJson(Map<String, dynamic> json) {
    return AssetModel(
      id: json['id'],
      lessor:
          json["lessor"] != null ? LessorModel.fromJson(json['lessor']) : null,
      addedBy: StaffModel.fromJson(json['addedBy']),
      // basements: (json['basements'] as List<dynamic>?)
      //     ?.map((e) => BasementModel.fromJson(e))
      //     .toList(),
      matricule: json['matricule'],
      surfaceArea: json['surfaceArea'],
      estimatedValue: json['estimatedValue'],
      numberOfFloors: json['numberOfFloors'],
      numberOfHalls: json['numberOfHalls'],
      name: json['name'],
      address: json['address'],
      ville: json['ville'],
      description: json['description'],
      assetType: json['assetType'],
      type: json['type'],
      image: json['image'],
      isActive: json['active'],
    );
  }
}

class BasementModel {
  int id;
  // LessorModel? lessor;
  StaffModel addedBy;
  AssetModel building;
  String? description;
  int surfaceArea;
  int estimatedValue;
  Uint8List? image;
  String? assetType;
  int numberOfHalls;
  String? type;
  bool active;
  BasementModel(
      {required this.id,
      required this.addedBy,
      required this.building,
      // required this.lessor,
      required this.description,
      required this.surfaceArea,
      required this.estimatedValue,
      required this.image,
      required this.assetType,
      required this.numberOfHalls,
      required this.type,
      required this.active});
  factory BasementModel.fromJson(Map<String, dynamic> json) {
    return BasementModel(
        id: json['id'],
        addedBy: StaffModel.fromJson(json["addedBy"]),
        building: AssetModel.fromJson(json['building']),
        //lessor: LessorModel.fromJson(json['lessor']),
        description: json['description'],
        surfaceArea: json["surfaceArea"],
        estimatedValue: json["estimatedValue"],
        image: json['image'],
        assetType: json['assetType'],
        numberOfHalls: json['numberOfHalls'],
        type: json['type'],
        active: json['active']);
  }
}
