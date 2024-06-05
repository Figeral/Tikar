import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import "package:http/http.dart" as http;
import 'package:tikar/model/server/server_info.dart';
import 'package:tikar/model/data-models/rent_model.dart';

class RentViewModel {
  int len = 0;
  final _url = ServerData(sourceUrl: "rents").path;
  get url => _url;
  Future<List<dynamic>> getRent() async {
    final response = await http.get(Uri.parse(url));
    final result = json.decode(response.body);

    return result as List;
  }

  final _streamController = StreamController();
  Stream get stream => _streamController.stream;

  void setStream() async {
    List result = await getRent();
    List<RentModel> data = [];
    for (var element in result) {
      data.add(RentModel.fromJson(element));
    }
    len = result.length;
    List<List<Object?>> comparableData = [];
    comparableData = data
        .map((model) => [
              //  model.asset?.assetType ?? model.basement!.type,
              model.asset?.assetType,
              model.id,
              model.asset!.addedBy.fname,
              model.asset!.addedBy.lname,
              model.asset!.addedBy.role,
              model.asset!.address,
              model.asset!.ville,
              model.asset!.description,
              model.renter.fname,
              model.renter.lname,
              model.cost,
              model.startAt ?? DateTime.now(),
              model.endAt,
              model.active,
              model.id,
              model.renter.image ?? Uint8List(0),
              model.endAt,
              model.asset!.numberOfHalls ?? 0000,
              model.asset!.type ?? "",
            ])
        .toList();

    _streamController.add(comparableData);
  }

  void close() => _streamController.close();
}
