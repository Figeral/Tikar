import 'package:flutter/material.dart';

class MyDataSource extends DataTableSource {
  static const List<int> _displayIndexToRawIndex = <int>[1, 2, 3];

  late List<List<Comparable<Object>>> sortedData;
  void setData(List<List<Comparable<Object>>> rawData, int sortColumn,
      bool sortAscending) {
    sortedData = rawData.toList()
      ..sort((List<Comparable<Object>> a, List<Comparable<Object>> b) {
        final Comparable<Object> cellA = a[_displayIndexToRawIndex[sortColumn]];
        final Comparable<Object> cellB = b[_displayIndexToRawIndex[sortColumn]];
        return cellA.compareTo(cellB) * (sortAscending ? 1 : -1);
      });
    notifyListeners();
  }

  @override
  int get rowCount => sortedData.length;

  static DataCell cellFor(Object data) {
    String value;
    if (data is DateTime) {
      value =
          '${data.year}-${data.month.toString().padLeft(2, '0')}-${data.day.toString().padLeft(2, '0')}';
    } else {
      value = data.toString();
    }
    return DataCell(Text(value));
  }

  @override
  DataRow? getRow(int index) {
    return DataRow.byIndex(
      index: sortedData[index][0] as int,
      cells: <DataCell>[
        // cellFor(
        //     'S${sortedData[index][1]}E${sortedData[index][2].toString().padLeft(2, '0')}'),
        // cellFor(sortedData[index][3]),
        cellFor(sortedData[index][1]),
        cellFor(sortedData[index][2]),
        cellFor(sortedData[index][3]),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}

class DataSource extends DataTableSource {
  List<List<Object>> source;
  DataSource({required this.source});
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
