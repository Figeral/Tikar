import 'package:flutter/material.dart';

class LessorDataSource extends DataTableSource {
  List<List<Object>> source;
  LessorDataSource({required this.source});
  @override
  DataRow? getRow(int index) {
    return DataRow(cells: <DataCell>[
      DataCell(Text("${source[index][0]}")),
      DataCell(Text("${source[index][1]}")),
      DataCell(Text("${source[index][2]}")),
      DataCell(Text("${source[index][3]}")),
      DataCell(Text("${source[index][4]}")),
      DataCell(Text("${source[index][5]}")),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => source.length;

  @override
  int get selectedRowCount => 0;
}
