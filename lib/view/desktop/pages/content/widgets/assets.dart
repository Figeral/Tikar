import 'package:flutter/material.dart';
import 'package:tikar/model/app-model/card_model.dart';

class Assets extends StatefulWidget {
  const Assets({super.key});

  @override
  State<Assets> createState() => _AssetsState();
}

class _AssetsState extends State<Assets> {
  AssetCardDetails data =
      AssetCardDetails(value1: 120, value2: 45, value3: 12, value4: 23);
  @override
  Widget build(BuildContext context) {
    final sHeight = MediaQuery.of(context).size.height;
    final sWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 45),
      child: Column(
        children: <Widget>[
          Text(
            'Management  Immobilier  "height : $sHeight and width : $sWidth',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          const SizedBox(
            height: 45,
          ),
          Center(
            child: Container(
              //color: Colors.grey.shade200,
              constraints: const BoxConstraints(
                  maxHeight: 450, maxWidth: 1900, minWidth: 880),
              width: sWidth * 0.7,
              height: sHeight * 0.35,
              child: GridView.builder(
                itemCount: 4,
                padding: const EdgeInsets.all(20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12),
                itemBuilder: (context, index) => buildGrid(data, index),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildGrid(AssetCardDetails data, int index) {
    return Card(
        //shape: ShapeBorder.lerp(a, b, t),
        // color: Colors.grey.shade100,
        );
  }
}

class AssetCardDetails {
  int value1, value2, value3, value4;
  AssetCardDetails(
      {required this.value1,
      required this.value2,
      required this.value3,
      required this.value4});
  List<CardModel> data() => <CardModel>[
        CardModel(
            otherIcon: "assets/images/house_fill.svg",
            name: "Bien Actif",
            value: value1),
        CardModel(
          icon: Icons.home_work,
          name: "Bien Total",
          value: value2,
        ),
        CardModel(
            otherIcon: "assets/images/1_fill.svg",
            name: "Nombre de Residence",
            value: value3),
        CardModel(
            otherIcon: "assets/images/immeuble.png",
            name: "Nombre d'immeuble",
            value: value4),
      ];
}
