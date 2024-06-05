import 'package:flutter/material.dart';

class StaffDataSource extends DataTableSource {
  List<List<Object>> source;
  StaffDataSource({required this.source});
  @override
  DataRow? getRow(int index) {
    return DataRow(cells: <DataCell>[
      DataCell(Text("${source[index][0]}")),
      DataCell(Text("${source[index][1]}")),
      DataCell(Text("${source[index][2]}")),
      DataCell(Text("${source[index][3]}")),
      DataCell(Text("${source[index][4]}")),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => source.length;

  @override
  int get selectedRowCount => 0;
}
