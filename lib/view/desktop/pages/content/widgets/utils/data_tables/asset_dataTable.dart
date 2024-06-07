import 'package:flutter/material.dart';
import 'package:tikar/view/desktop/pages/content/widgets/utils/data_sources/asset_ds.dart';

class AssetPaginatedData extends StatefulWidget {
  void Function() refresh;

  String col1, col2, col3, col4, col5, col6;
  double swidth;
  GlobalKey<FormState> formkey;
  TextEditingController controller;

  List<List<Object?>> comparableData;
  AssetPaginatedData({
    super.key,
    required this.refresh,
    required this.swidth,
    required this.formkey,
    required this.controller,
    required this.comparableData,
    required this.col1,
    required this.col2,
    required this.col3,
    required this.col4,
    required this.col5,
    required this.col6,
  });

  @override
  State<AssetPaginatedData> createState() => _AssetPaginatedDataState();
}

class _AssetPaginatedDataState extends State<AssetPaginatedData> {
  bool _isVisible = true;
  @override
  Widget build(BuildContext context) {
    // widget.refresh();
    return PaginatedDataTable(
        header: Padding(
          padding: EdgeInsets.fromLTRB(0, 0, widget.swidth * 0.47, 0),
          child: Form(
            key: widget.formkey,
            child: TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Je recherche ',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              controller: widget.controller,
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
                widget.refresh();
              },
              icon: const Icon(Icons.replay_outlined)),
        ],
        sortColumnIndex: 0,
        sortAscending: false,
        columns: <DataColumn>[
          DataColumn(
            label: Text(
              widget.col1,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            // onSort: _sort,
          ),
          DataColumn(
            label: Text(
              widget.col2,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            // onSort: _sort,
          ),
          DataColumn(
            label: Text(
              widget.col3,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            //onSort: _sort,
          ),
          DataColumn(
            label: Text(
              widget.col4,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            //onSort: _sort,
          ),
          DataColumn(
            label: Text(
              widget.col5,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            //onSort: _sort,
          ),
          DataColumn(
            label: Text(
              widget.col6,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            //onSort: _sort,
          ),
        ],
        source: AssetDataSource(
          source: widget.comparableData,
        ));
  }
}
