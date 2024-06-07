import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import "package:http/http.dart" as http;
import 'package:tikar/model/server/server_info.dart';
import 'package:tikar/Service/storage/lessor_service.dart';
import 'package:tikar/model/data-models/lessor_model.dart';

class LessorViewModel {
  LessorDbProvider localStorage = LessorDbProvider();
  final _url = ServerData(sourceUrl: "lessors").path;
  get url => _url;
  Future<List<dynamic>> getLessor() async {
    final response = await http.get(Uri.parse(url));
    final result = json.decode(response.body);
    //print(result);
    return result as List;
  }

  final _streamController = StreamController();
  Stream get stream => _streamController.stream;

  void setStream() async {
    List result = await getLessor();
    // await localStorage.saveAll(await getLessor());
    // List result = await localStorage.readAllItems();
    List<LessorModel> data = [];
    for (var element in result) {
      data.add(LessorModel.fromJson(element));
    }
    List<List<Object>> comparableData = [];
    comparableData = data
        .map((model) => [
              model.id,
              model.fname,
              model.lname,
              model.gender,
              model.tel,
              model.isActive,
              model.image ?? Uint8List(0),
            ])
        .toList();
    _streamController.add(comparableData);
    //print(await getLessor());
  }

  void close() => _streamController.close();
}
