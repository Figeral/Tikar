import 'package:flutter/material.dart';

class CardModel {
  IconData? icon;
  String? otherIcon;
  String name;
  int value;
  CardModel(
      {this.icon, this.otherIcon, required this.name, required this.value});
}
