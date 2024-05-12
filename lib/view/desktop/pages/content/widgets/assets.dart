import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:tikar/model/app-model/card_model.dart';
import 'package:tikar/view/desktop/pages/content/widgets/lessor.dart';

class Assets extends StatefulWidget {
  const Assets({super.key});

  @override
  State<Assets> createState() => _AssetsState();
}

class _AssetsState extends State<Assets> {
  AssetCardDetails detail =
      AssetCardDetails(value1: 22, value2: 95, value3: 12, value4: 23);
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
              'Management  Immobilier',
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
            DataTable(columns: const <DataColumn>[
              DataColumn(
                  label: Text(
                "noms",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
              DataColumn(
                  label: Text(
                "Propriétaire",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
              DataColumn(
                  label: Text(
                "Superficie /M2",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
              DataColumn(
                  label: Text(
                "value estime /Million",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
            ], rows: const <DataRow>[
              DataRow(cells: [
                DataCell(Text("Brown town")),
                DataCell(Text("Mouliom_Fitzgerald")),
                DataCell(Text("1200")),
                DataCell(Text("60000000")),
              ])
            ]),
          ],
        ),
      ),
    );
  }

  Widget buildGrid(AssetCardDetails detail, int index) {
    return Card(
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
            otherIcon: "assets/images/building.svg",
            name: "Nombre de Residence",
            value: value3),
        CardModel(
            //otherIcon: "assets/images/building.svg",
            icon: Icons.business,
            name: "Nombre d'immeuble",
            value: value4),
      ];
}
