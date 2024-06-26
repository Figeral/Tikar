import 'dart:math' as math;
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:tikar/vm/asset_vm.dart';
import 'package:tikar/constants/app_colors.dart';
import 'package:tikar/model/app-model/card_model.dart';
import 'package:tikar/view/desktop/pages/content/widgets/utils/modals/asset_modal.dart';
import 'package:tikar/view/desktop/pages/content/widgets/utils/data_tables/asset_dataTable.dart';

class Assets extends StatefulWidget {
  const Assets({super.key});

  @override
  State<Assets> createState() => _AssetsState();
}

class _AssetsState extends State<Assets> with SingleTickerProviderStateMixin {
  bool _isVisible = false;
  final vm = AssetViewModel();
  TextEditingController searchInputController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  AssetCardDetails? detail;
  @override
  void initState() {
    super.initState();
    vm.setStream();
    detail = AssetCardDetails(value1: 2, value2: 2, value3: 1, value4: 1);
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
  }

  @override
  void dispose() {
    _controller.dispose();
    searchInputController.dispose();
    vm.close();
    super.dispose();
  }

  void toggle() {
    _controller.isDismissed ? _controller.forward() : _controller.reverse();
    setState(() {
      _isVisible = !_isVisible;
    });
  }

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
                      child: Transform.translate(
                        offset: Offset(
                            dx * -_controller.value, dy * -_controller.value),
                        child: AssetModal(
                          width: 680 * _controller.value,
                          height: 780 * _controller.value,
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
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 45),
              child: Column(
                children: <Widget>[
                  const Text(
                    'Management  Immobilier',
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
                        itemBuilder: (context, index) =>
                            buildGrid(detail!, index),
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                    padding: EdgeInsets.all(sHeight * 0.05),
                    child: StreamBuilder(
                        stream: vm.stream,
                        builder: (context, snapshot) {
                          vm.setStream;
                          if (snapshot.hasData) {
                            print((snapshot.data as List<dynamic>).length);
                            return AssetPaginatedData(
                              refresh: vm.setStream,
                              swidth: sWidth,
                              formkey: _formKey,
                              controller: searchInputController,
                              // isVisible: _isVisible,
                              comparableData: snapshot.data,
                              col1: "Type",
                              col2: "Lessor",
                              col3: "Surface Area /M²",
                              col4: "Estimated Value /Millions",
                              col5: "Matricule",
                              col6: "Active",
                            );
                          } else {
                            return AssetPaginatedData(
                              refresh: vm.setStream,
                              swidth: sWidth,
                              formkey: _formKey,
                              controller: searchInputController,
                              // isVisible: _isVisible,
                              comparableData: const [],
                              col1: "Type",
                              col2: "Lessor",
                              col3: "Surface Area /M²",
                              col4: "Estimated Value /Millions",
                              col5: "Matricule",
                              col6: "Active",
                            );
                          }
                        }),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: _isVisible,
              child: GestureDetector(
                onTap: toggle,
                child: Container(
                  width: sWidth,
                  height: sHeight + sHeight / 2,
                  color: Color.fromARGB(112, 12, 12, 12),
                ),
              ),
            )
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
            name: "Biens Actif",
            value: value1),
        CardModel(
          icon: Icons.home_work,
          name: "Bien Total",
          value: value2,
        ),
        CardModel(
            otherIcon: "assets/images/residence.svg",
            name: "Nombre de Residence",
            value: value3),
        CardModel(
            otherIcon: "assets/images/building.svg",
            name: "Nombre d'immeuble",
            value: value4),
      ];
}
