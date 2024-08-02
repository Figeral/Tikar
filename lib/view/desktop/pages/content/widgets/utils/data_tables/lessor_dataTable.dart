import 'package:flutter/material.dart';
import 'package:tikar/view/desktop/pages/content/widgets/utils/data_sources/lessor_ds.dart';

class LessorPaginatedData extends StatelessWidget {
  void Function() refresh;

  String col1, col2, col3, col4, col5, col6;
  double swidth;
  GlobalKey<FormState> formkey;
  TextEditingController controller;

  List<List<Object>> comparableData;
  LessorPaginatedData({
    super.key,
    required this.refresh,
    required this.swidth,
    required this.formkey,
    required this.controller,
    //  required this.isVisible,
    required this.comparableData,
    required this.col1,
    required this.col2,
    required this.col3,
    required this.col4,
    required this.col5,
    required this.col6,
  });

  final bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    // widget.refresh();
    return tableMaker();
  }

  PaginatedDataTable tableMaker() {
    return PaginatedDataTable(
      header: Padding(
        padding: EdgeInsets.fromLTRB(0, 0, swidth * 0.47, 0),
        child: Form(
          key: formkey,
          child: TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: 'Je recherche ',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            controller: controller,
            validator: (value) {
              if (value!.contains("@") || value.contains("\$")) {
                return "caractère speciaux interdit";
              }
              return null;
            },
          ),
        ),
      ),
      actions: [
        IconButton(
            tooltip: "press here to open and close",
            onPressed: () {},
            icon: const Icon(Icons.add)),
        IconButton(
            tooltip: "press here to refresh",
            onPressed: () {
              refresh();
            },
            icon: const Icon(Icons.replay_outlined)),
      ],
      sortColumnIndex: 0,
      sortAscending: false,
      columns: <DataColumn>[
        DataColumn(
          label: Text(
            col1,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          // onSort: _sort,
        ),
        DataColumn(
          label: Text(
            col2,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          // onSort: _sort,
        ),
        DataColumn(
          label: Text(
            col3,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          //onSort: _sort,
        ),
        DataColumn(
          label: Text(
            col4,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          //onSort: _sort,
        ),
        DataColumn(
          label: Text(
            col5,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          //onSort: _sort,
        ),
        DataColumn(
          label: Text(
            col6,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          //onSort: _sort,
        ),
      ],
      source: LessorDataSource(
        source: comparableData,
      ),
    );
  }
}
