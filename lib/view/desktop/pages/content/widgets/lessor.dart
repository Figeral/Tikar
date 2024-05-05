import 'package:flutter/material.dart';
import 'package:tikar/constants/app_colors.dart';

class Lessor extends StatefulWidget {
  const Lessor({super.key});

  @override
  State<Lessor> createState() => _LessorState();
}

class _LessorState extends State<Lessor> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.purple,
    );
  }
}
