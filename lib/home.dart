import 'package:flutter/material.dart';
import 'package:tikar/view/phone/phone.dart';
import 'package:tikar/view/desktop/desktop.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: ((context, constraints) =>
            constraints.maxWidth > 450 ? const Desktop() : const Phone()));
  }
}
