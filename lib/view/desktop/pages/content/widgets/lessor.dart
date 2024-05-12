import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:tikar/model/app-model/card_model.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class Lessor extends StatefulWidget {
  const Lessor({super.key});

  @override
  State<Lessor> createState() => _LessorState();
}

class _LessorState extends State<Lessor> {
  LessorCardDetails detail =
      LessorCardDetails(value1: 16, value2: 37, value3: 12, value4: 23);
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
              'Management  Bailleur',
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
            ),
            DataTable(
                //headingTextStyle: TextStyle(color: Colors.yellow),
                columns: const <DataColumn>[
                  DataColumn(
                      label: Text(
                    "noms",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                  DataColumn(
                      label: Text(
                    "Prenoms",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                  DataColumn(
                      label: Text(
                    "Contact",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                  DataColumn(
                      label: Text(
                    "Bien",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                ],
                rows: <DataRow>[
                  DataRow.byIndex(cells: const [
                    DataCell(Text("Mouliom")),
                    DataCell(Text("Fitzgerald")),
                    DataCell(Text("690462556")),
                    DataCell(Text("Villa brown city")),
                  ]),
                ]),
          ],
        ),
      ),
    );
  }

  Widget buildGrid(LessorCardDetails detail, int index) {
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

class LessorCardDetails {
  int value1, value2, value3, value4;
  LessorCardDetails(
      {required this.value1,
      required this.value2,
      required this.value3,
      required this.value4});
  List<CardModel> data() => <CardModel>[
        CardModel(
            //otherIcon: "assets/images/house_fill.svg",
            icon: Icons.manage_accounts_outlined,
            name: "Bailleur Actif",
            value: value1),
        CardModel(
          icon: Icons.man,
          name: "Bailleur Total",
          value: value2,
        ),
        CardModel(
            otherIcon: "assets/images/1_fill.svg",
            name: "Au Cameroun",
            value: value3),
        CardModel(
            // otherIcon: "assets/images/building.svg",
            icon: Icons.rocket_launch_outlined,
            name: "à l'étranger",
            value: value4),
      ];
}
