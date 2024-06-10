import 'dart:math' as math;
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'utils/modals/lessor_modal.dart';
import 'package:tikar/vm/lessor_vm.dart';
import '../../../../../constants/app_colors.dart';
import 'package:tikar/model/app-model/card_model.dart';
import 'package:tikar/view/desktop/pages/content/widgets/utils/data_tables/lessor_dataTable.dart';

class Lessor extends StatefulWidget {
  const Lessor({super.key});

  @override
  State<Lessor> createState() => _LessorState();
}

class _LessorState extends State<Lessor> with SingleTickerProviderStateMixin {
  bool _isVisible = false;
  final vm = LessorViewModel();
  TextEditingController searchInputController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  LessorCardDetails detail =
      LessorCardDetails(value1: 16, value2: 37, value3: 12, value4: 23);
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));

    //_controller.forward();

    vm.setStream();
  }

  @override
  void dispose() {
    _controller.dispose();
    vm.close();
    searchInputController.dispose();
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
                      child: Transform.translate(
                        offset: Offset(
                            dx * -_controller.value, dy * -_controller.value),
                        child: LessorModal(
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
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                crossAxisSpacing: 12,
                                mainAxisSpacing: 12),
                        itemBuilder: (context, index) =>
                            buildGrid(detail, index),
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
                            return LessorPaginatedData(
                              refresh: vm.setStream,
                              swidth: sWidth,
                              formkey: _formKey,
                              controller: searchInputController,
                              comparableData: snapshot.data,
                              col1: "ID",
                              col2: "First Name",
                              col3: "Last Name",
                              col4: "Gender",
                              col5: "Telephone",
                              col6: "Active",
                            );
                          } else {
                            return LessorPaginatedData(
                              refresh: vm.setStream,
                              swidth: sWidth,
                              formkey: _formKey,
                              controller: searchInputController,
                              comparableData: const [],
                              col1: "ID",
                              col2: "First Name",
                              col3: "Last Name",
                              col4: "Gender",
                              col5: "Telephone",
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
              child: Container(
                width: sWidth,
                height: sHeight + sHeight / 2,
                color: Color.fromARGB(112, 12, 12, 12),
              ),
            )
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
                  fontWeight: FontWeight.w600),
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
            otherIcon: "assets/images/1.svg",
            name: "Au Cameroun",
            value: value3),
        CardModel(
            // otherIcon: "assets/images/building.svg",
            icon: Icons.rocket_launch_outlined,
            name: "à l'étranger",
            value: value4),
      ];
}
