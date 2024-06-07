import 'package:flutter/material.dart';

class CustomModelWidget extends StatefulWidget {
  const CustomModelWidget({super.key});
  @override
  _CustomModelWidgetState createState() => _CustomModelWidgetState();
}

class _CustomModelWidgetState extends State<CustomModelWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 250,
      top: 50,
      child: SizedBox(
        width: 700,
        height: 800,
        child: Card(
          color: Colors.grey.shade300,
          child: Center(
              child: InkWell(
                  onTap: () {}, child: const Text("hello bro , custom modal"))),
        ),
      ),
    );
  }
}
