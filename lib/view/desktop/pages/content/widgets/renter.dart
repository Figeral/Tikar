import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:tikar/model/app-model/card_model.dart';

class Renter extends StatefulWidget {
  const Renter({super.key});

  @override
  State<Renter> createState() => _RenterState();
}

class _RenterState extends State<Renter> {
  RenterCardDetails detail =
      RenterCardDetails(value1: 120, value2: 45, value3: 12, value4: 23);
  @override
  Widget build(BuildContext context) {
    final sHeight = MediaQuery.of(context).size.height;
    final sWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 45),
        child: Column(
          children: <Widget>[
            const Text(
              'Management  Locataire',
              style: TextStyle(
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
                  itemBuilder: (context, index) => buildGrid(detail, index),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildGrid(RenterCardDetails detail, int index) {
    return Card(
      //shape: ShapeBorder.lerp(a, b, t),
      // color: Colors.grey.shade100,
      elevation: 5,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            detail.data()[index].icon != null
                ? Icon(
                    detail.data()[index].icon,
                    size: 70,
                  )
                : SvgPicture.asset(
                    detail.data()[index].otherIcon!,
                    width: 70,
                    height: 70,
                  ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                " ${detail.data()[index].value}",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              " ${detail.data()[index].name}",
              style: const TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                  fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }
}

class RenterCardDetails {
  int value1, value2, value3, value4;
  RenterCardDetails(
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
            otherIcon: "assets/images/building.svg",
            name: "Nombre d'immeuble",
            value: value4),
      ];
}
