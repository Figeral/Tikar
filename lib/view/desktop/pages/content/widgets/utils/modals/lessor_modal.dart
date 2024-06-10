import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class LessorModal extends StatefulWidget {
  final double width, height;
  const LessorModal({super.key, required this.width, required this.height});

  @override
  State<LessorModal> createState() => _LessorModalState();
}

class _LessorModalState extends State<LessorModal> {
  @override
  Widget build(BuildContext context) {
    final height = widget.height;
    final width = widget.width;
    return width > 400 && height > 500
        ? Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              color: Colors.grey.shade100,
            ),
            width: widget.width,
            height: widget.height,
            child: Column(
              children: [
                const Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      Text(
                        "Ajouter un Bailleur",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: SingleChildScrollView(
                    child: Form(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: SizedBox(
                              width: 250,
                              height: 250,
                              child: Stack(
                                children: [
                                  CircleAvatar(
                                    radius: 75,
                                  ),
                                  Positioned(
                                      top: 100,
                                      left: 105,
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.add,
                                          size: 38,
                                        ),
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        : Container(
            color: Colors.grey.shade100,
          );
  }
}
