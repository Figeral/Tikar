import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import "package:http/http.dart" as http;
import 'package:tikar/model/server/server_info.dart';
import 'package:tikar/model/data-models/staff_model.dart';

class StaffViewModel {
  final _url = ServerData(sourceUrl: "staffs").path;
  get url => _url;
  Future<List<dynamic>> getRenters() async {
    final response = await http.get(Uri.parse(url));
    final result = json.decode(response.body);
    //print(result);
    return result as List;
  }

  final _streamController = StreamController();
  Stream get stream => _streamController.stream;

  void setStream() async {
    List result = await getRenters();
    List<StaffModel> data = [];
    for (var element in result) {
      data.add(StaffModel.fromJson(element));
    }
    List<List<Object>> comparableData = [];
    comparableData = data
        .map((model) => [
              model.id,
              model.fname,
              model.lname,
              model.role,
              model.post,
              model.isActive,
              model.image ?? Uint8List(0),
            ])
        .toList();
    _streamController.add(comparableData);
    //print(await getRenters());
  }

  void close() => _streamController.close();
}
