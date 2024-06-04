import 'package:json_annotation/json_annotation.dart';
import 'package:tikar/model/data-models/asset_model.dart';
import 'package:tikar/model/data-models/renter_model.dart';


@JsonSerializable()
class RentModel {
  int id;
  DateTime? startAt, endAt;

  AssetModel? asset;
  // BasementModel? basement;
  RenterModel renter;
  bool active;
  int cost;
  RentModel(
      {required this.id,
      required this.startAt,
      required this.endAt,
      required this.asset,
      // required this.basement,
      required this.renter,
      required this.active,
      required this.cost});

  factory RentModel.fromJson(Map<String, dynamic> json) {
    //print(AssetModel.fromJson(Map.from(json['asset'])).lessor!.fname);
    return RentModel(
      id: json['id'],
      startAt: json['startAt'],
      endAt: json['endAt'],
      asset: AssetModel.fromJson(Map.from(json['asset'])),
      // basement: BasementModel.fromJson(json['asset']),
      renter: RenterModel.fromJson(json['renter']),
      active: json['active'],
      cost: json['cost'],
    );
  }
}
