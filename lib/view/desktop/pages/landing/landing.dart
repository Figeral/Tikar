import 'package:flutter/material.dart';

class Landing extends StatelessWidget {
  const Landing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            alignment: const Alignment(0, -1),
            child: const SizedBox(
              height: 290,
              width: 400,
              child: Image(image: AssetImage("assets/images/tikar.png")),
            ),
          ),
          Container(
            alignment: const Alignment(0, -0.0),
            child: const SizedBox(
              // height: 900,
              // width: 900,
              child: Image(
                image: AssetImage("assets/images/management.png"),
              ),
            ),
          ),
          Container(
            alignment: const Alignment(0, 0.5),
            child: const Text(
              "Votre Application de Gestion Locatif",
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
