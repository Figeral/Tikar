import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:tikar/vm/staff_vm.dart';
import '../../../../../constants/app_colors.dart';
import 'package:tikar/model/app-model/card_model.dart';
import 'package:tikar/view/desktop/pages/content/widgets/utils/modals/custom_modals.dart';
import 'package:tikar/view/desktop/pages/content/widgets/utils/data_tables/staff_dataTable.dart';

class Employee extends StatefulWidget {
  const Employee({super.key});

  @override
  State<Employee> createState() => _EmployeeState();
}

class _EmployeeState extends State<Employee> {
  List<List<Object>> emp = [];
  int Et = 0;
  bool _isVisible = false;
  final vm = StaffViewModel();
  TextEditingController searchInputController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  late LessorCardDetails detail;
  @override
  void initState() {
    detail = LessorCardDetails(value1: Et, value2: 21, value3: 12, value4: 23);
    super.initState();
    vm.setStream();
  }

  @override
  void dispose() {
    searchInputController.dispose();
    vm.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sHeight = MediaQuery.of(context).size.height;
    final sWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 45),
          child: Column(
            children: <Widget>[
              const Text(
                'Management  Employées',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.nightBue,
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
                    physics: const ScrollPhysics(),
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
                padding: EdgeInsets.all(sHeight * 0.05),
                child: StreamBuilder(
                    stream: vm.stream,
                    builder: (context, snapshot) {
                      vm.setStream;
                      if (snapshot.hasData) {
                        return StaffPaginatedData(
                          refresh: vm.setStream,
                          swidth: sWidth,
                          formkey: _formKey,
                          controller: searchInputController,
                          comparableData: snapshot.data,
                          col1: "ID",
                          col2: "First Name",
                          col3: "Last Name",
                          col4: "Role",
                          col5: "Post",
                          col6: "Active",
                        );
                      } else {
                        return StaffPaginatedData(
                          refresh: vm.setStream,
                          swidth: sWidth,
                          formkey: _formKey,
                          controller: searchInputController,
                          comparableData: const [],
                          col1: "ID",
                          col2: "First Name",
                          col3: "Last Name",
                          col4: "Role",
                          col5: "Poste",
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

  Widget buildGrid(LessorCardDetails detail, int index) {
    return Tooltip(
      showDuration: const Duration(seconds: 10),
      verticalOffset: 48,
      preferBelow: false,
      message:
          "Nous comptons ${detail.data()[index].value}  ${detail.data()[index].name} ",
      child: Card(
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
                      //  color: AppColors.nightBue,
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
            otherIcon: "assets/images/4.svg",
            name: "Employéé Actif",
            value: value1),
        CardModel(
          otherIcon: "assets/images/6.svg",
          name: "Employéé Total",
          value: value2,
        ),
        CardModel(
            otherIcon: "assets/images/7.svg",
            name: "Employéé Interne",
            value: value3),
        CardModel(
            // otherIcon: "assets/images/building.svg",
            otherIcon: "assets/images/8.svg",
            name: "Employéé Externe",
            value: value4),
      ];
}
