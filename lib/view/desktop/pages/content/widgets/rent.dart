import 'dart:math' as math;
import 'package:flutter_svg/svg.dart';
import 'package:tikar/vm/rent_vm.dart';
import 'package:flutter/material.dart';
import '../../../../../constants/app_colors.dart';
import 'package:tikar/model/app-model/card_model.dart';
import 'package:tikar/view/desktop/pages/content/widgets/utils/data_tables/rent_dataTable.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

int tR = 0;

class _LocationState extends State<Location>
    with SingleTickerProviderStateMixin {
  bool _isVisible = false;
  final vm = RentViewModel();
  TextEditingController searchInputController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  RentCardDetails detail =
      RentCardDetails(value1: 16, value2: tR, value3: 12, value4: 23);
  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));

    super.initState();
    vm.setStream();
  }

  @override
  void dispose() {
    _controller.dispose();
    searchInputController.dispose();
    vm.close();
    super.dispose();
  }

  void toggle() =>
      _controller.isDismissed ? _controller.forward() : _controller.reverse();
  late AnimationController _controller;
  @override
  Widget build(BuildContext context) {
    final sHeight = MediaQuery.of(context).size.height;
    final sWidth = MediaQuery.of(context).size.width;
    double dividor = 1;
    final miniSize = 70;
    final miniOpacity = 0.5;
    final macroOpacity = 0;
    double dx = 50;
    double dy = 100;

    return Scaffold(
      floatingActionButton: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          dividor = _controller.value * 2;
          print(dividor);
          final size = miniSize + (_controller.value * 30);
          final opacity = miniOpacity + (_controller.value * miniOpacity);
          final mO = _controller.value * 1;

          return Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              dividor != 0
                  ? Opacity(
                      opacity: mO,
                      child: Transform.rotate(
                        angle: (math.pi * 2) / dividor,
                        child: Transform.translate(
                          offset: Offset(
                              dx * _controller.value, dy * _controller.value),
                          child: Container(
                            width: 680 * _controller.value,
                            height: 780 * _controller.value,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    )
                  : Opacity(
                      opacity: 0,
                      child: Container(),
                    ),
              SizedBox(
                width: size,
                height: size,
                child: FittedBox(
                  child: Opacity(
                    opacity: opacity,
                    child: FloatingActionButton(
                      backgroundColor: AppColors.golden,
                      tooltip: "add Lessor",
                      onPressed: toggle,
                      child: dividor != 0
                          ? Transform.rotate(
                              angle: (math.pi / 2) / dividor,
                              child: Icon(
                                Icons.add,
                                size: size / 2,
                              ),
                            )
                          : Icon(
                              Icons.add,
                              size: size / 2,
                            ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 45),
          child: Column(
            children: <Widget>[
              const Text(
                'Management  Locations',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: AppColors.golden,
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
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12),
                    itemBuilder: (context, index) => buildGrid(detail, index),
                  ),
                ),
              ),
              SizedBox(
                height: sHeight * 0.07,
              ),
              Container(
                width: sWidth * 0.70,
                height: sHeight * 0.82,
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    border: Border.all(
                      color: Colors.grey.shade600,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                padding: EdgeInsets.all(sHeight * 0.04),
                child: StreamBuilder(
                    stream: vm.stream,
                    builder: (context, snapshot) {
                      vm.setStream;
                      if (snapshot.hasData) {
                        return RentPaginatedData(
                          refresh: vm.setStream,
                          swidth: sWidth,
                          formkey: _formKey,
                          controller: searchInputController,
                          comparableData: snapshot.data,
                          col1: "Type",
                          col2: "Renter",
                          col3: "Cost / fcfa",
                          col4: "StartAt",
                          col5: "EndAt",
                          col6: "Active",
                        );
                      } else {
                        return RentPaginatedData(
                          refresh: vm.setStream,
                          swidth: sWidth,
                          formkey: _formKey,
                          controller: searchInputController,
                          comparableData: const [],
                          col1: "Type",
                          col2: "Renter",
                          col3: "Cost",
                          col4: "StartAt",
                          col5: "EndAt",
                          col6: "Active",
                        );
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildGrid(RentCardDetails detail, int index) {
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
                style: const TextStyle(
                    fontSize: 18,
                    color: AppColors.golden,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              " ${detail.data()[index].name}",
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}

class RentCardDetails {
  int value1, value2, value3, value4;
  RentCardDetails(
      {required this.value1,
      required this.value2,
      required this.value3,
      required this.value4});
  List<CardModel> data() => <CardModel>[
        CardModel(
            //otherIcon: "assets/images/house_fill.svg",
            icon: Icons.manage_accounts_outlined,
            name: "Location en cour",
            value: value1),
        CardModel(
          icon: Icons.man,
          name: "Location Total",
          value: value2,
        ),
        CardModel(
            otherIcon: "assets/images/1_fill.svg",
            name: "D'appartent et Autre",
            value: value3),
        CardModel(
            // otherIcon: "assets/images/building.svg",
            icon: Icons.rocket_launch_outlined,
            name: "De Résidence et Maison",
            value: value4),
      ];
}
