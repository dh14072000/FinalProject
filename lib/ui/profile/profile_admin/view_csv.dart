import 'package:final_project/resource/definition_color.dart';
import 'package:flutter/material.dart';
import 'package:csv/csv.dart';

class ViewCsvPage extends StatefulWidget {
  const ViewCsvPage({super.key});

  @override
  State<ViewCsvPage> createState() => _ViewCsvPageState();
}

class _ViewCsvPageState extends State<ViewCsvPage> {
  List<List<dynamic>>? csvData;

  Future<List<List<dynamic>>> processCsv() async {
    var result = await DefaultAssetBundle.of(context).loadString(
      "images/dataproject.csv",
    );
    return const CsvToListConverter().convert(result, eol: "\n");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueColor,
        title:Text("File báo cáo tháng "'${DateTime.now().month}'),
      ),
      body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: csvData == null
                ? const CircularProgressIndicator()
                : DataTable(
                    columns: csvData![0]
                        .map(
                          (item) => DataColumn(
                            label: Text(
                              item.toString(),
                            ),
                          ),
                        )
                        .toList(),
                    rows: csvData!
                        .map(
                          (csvrow) => DataRow(
                            cells: csvrow
                                .map(
                                  (csvItem) => DataCell(
                                    Text(
                                      csvItem.toString(),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        )
                        .toList(),
                  ),
          )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: whiteColor,
        onPressed: () async {
          csvData = await processCsv();
          setState(() {});
        },
      ),
    );
  }
}
