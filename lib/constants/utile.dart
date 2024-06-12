import 'dart:convert';
import 'dart:typed_data';
import 'package:json_annotation/json_annotation.dart';

enum Gender { male, female, other }

class Uint8ListConverter implements JsonConverter<Uint8List, String> {
  const Uint8ListConverter();

  @override
  Uint8List fromJson(String json) {
    return base64.decode(json);
  }

  @override
  String toJson(Uint8List object) {
    return base64.encode(object);
  }
}
