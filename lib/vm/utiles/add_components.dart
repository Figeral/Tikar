import 'dart:convert';
import "package:http/http.dart" as http;
import 'package:tikar/model/server/server_info.dart';

Future<int> addComponent(String path, Map<dynamic, dynamic> json) async {
  final url = ServerData(sourceUrl: path).path;

  final ur = Uri.parse(url);
  final response = await http.post(
    ur,
    body: jsonEncode(json),
    headers: {"Content-Type": "application/json"},
  );
  return response.statusCode;
}
