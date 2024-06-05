import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import "package:http/http.dart" as http;
import 'package:tikar/model/server/server_info.dart';
import 'package:tikar/Service/storage/asset_service.dart';
import 'package:tikar/model/data-models/asset_model.dart';

class AssetViewModel {
  AssetDbProvider localStorage = AssetDbProvider();
  int len = 0;
  final _url = ServerData(sourceUrl: "assets/parent").path;
  get url => _url;
  Future<List<dynamic>> getAsset() async {
    final response = await http.get(Uri.parse(url));
    final result = json.decode(response.body);
    print(result);
    return result as List;
  }

  final _streamController = StreamController();
  Stream get stream => _streamController.stream;

  void setStream() async {
    List result = await getAsset();
    // await localStorage.saveAll(await getAsset());
    // List result = await localStorage.readAllItems();
    print("result from asset local storage : $result");
    List<AssetModel> data = [];
    for (var element in result) {
      data.add(AssetModel.fromJson(element));
    }
    len = result.length;
    List<List<Object?>> comparableData = [];
    comparableData = data
        .map((model) => [
              model.assetType,
              model.id,
              model.addedBy.id,
              model.addedBy.fname,
              model.addedBy.lname,
              model.addedBy.role,
              model.addedBy.isActive,
              model.lessor!.id,
              model.lessor!.fname,
              model.lessor!.lname,
              model.surfaceArea,
              model.estimatedValue,
              model.matricule,
              model.isActive,
              model.name,
              model.ville,
              model.image ?? Uint8List(0),
              model.description,
              model.type ?? "",
              model.numberOfHalls ?? 0000,
              model.numberOfFloors ?? 0000,
            ])
        .toList();

    _streamController.add(comparableData);
  }

  void close() => _streamController.close();
}
