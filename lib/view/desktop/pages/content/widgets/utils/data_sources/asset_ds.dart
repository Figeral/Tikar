import 'package:flutter/material.dart';

class AssetDataSource extends DataTableSource {
  static DataCell cellFor(Object? data) {
    String value;
    if (data is DateTime) {
      value =
          '${data.year}-${data.month.toString().padLeft(2, '0')}-${data.day.toString().padLeft(2, '0')}';
    } else {
      value = data.toString();
    }
    return DataCell(Text(value));
  }

  List<List<Object?>> source;
  AssetDataSource({required this.source});
  @override
  DataRow? getRow(int index) {
    return DataRow(cells: <DataCell>[
      DataCell(Text("${source[index][0]!} ${source[index][18]} ")),
      DataCell(Text("${source[index][8]!} ${source[index][9]!}")),
      DataCell(Text("${source[index][10]!}")),
      cellFor(source[index][11]),
      cellFor(source[index][12] ?? "undefine"),
      DataCell(Text("${source[index][13]!}")),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => source.length;

  @override
  int get selectedRowCount => 0;
}
