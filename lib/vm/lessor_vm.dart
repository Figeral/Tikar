import 'dart:async';
import 'dart:convert';
import "package:http/http.dart" as http;
import 'package:tikar/model/server/server_info.dart';
import 'package:tikar/model/data-models/lessor_model.dart';

class LessorViewModel {
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
    List<LessorModel> data = [];
    result.forEach((element) {
      data.add(LessorModel.fromJson(element));
    });
    List<List<Object>> comparableData = [];
    comparableData = data
        .map((model) => [
              model.id,
              model.fname,
              model.lname,
              model.tel,
              model.isActive ?? false,
              //  model.image ?? Uint8List(0),
            ])
        .toList();
    _streamController.add(comparableData);
    //print(await getLessor());
  }
}
