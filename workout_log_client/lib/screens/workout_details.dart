import 'package:flutter/material.dart';
import 'package:workout_log/widgets/header/navigate_before_button.dart';
import '../widgets/header/header.dart';
import '../widgets/table/table_data_cell.dart';
import '../widgets/table/table_header_cell.dart';

class WorkoutDetails extends StatelessWidget {
  const WorkoutDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> resultsList = ["Pull up"];

    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            const Header(
                title: "Workout details",
                navigationButton: NavigateBeforeButton(),
                secondaryButton: null),
            const SizedBox(height: 20),
            SizedBox(
              height: 500,
              child: ListView.builder(
                  itemCount: resultsList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ListTile(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const WorkoutDetails())),
                            leading: Container(
                              margin: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade400,
                                  shape: BoxShape.circle),
                              child: const Icon(Icons.fitness_center,
                                  color: Colors.black, size: 25),
                            ),
                            title: Text(resultsList[index],
                                style: Theme.of(context).textTheme.headline2)),
                        Container(
                            margin: const EdgeInsets.fromLTRB(20, 15, 20, 0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("This is a note",
                                  style:
                                      TextStyle(color: Colors.grey.shade600)),
                            )),
                        DataTable(
                          columnSpacing: 50,
                          columns: const <DataColumn>[
                            DataColumn(label: TableHeaderCell(value: "Set")),
                            DataColumn(label: TableHeaderCell(value: "Reps")),
                            DataColumn(label: TableHeaderCell(value: "Weight")),
                            DataColumn(label: TableHeaderCell(value: "RPE"))
                          ],
                          rows: const <DataRow>[
                            DataRow(cells: <DataCell>[
                              DataCell(
                                TableDataCell(value: "1"),
                              ),
                              DataCell(TableDataCell(value: "10")),
                              DataCell(TableDataCell(value: "BW")),
                              DataCell(TableDataCell(value: "7")),
                            ]),
                            DataRow(cells: <DataCell>[
                              DataCell(
                                TableDataCell(value: "2"),
                              ),
                              DataCell(TableDataCell(value: "10")),
                              DataCell(TableDataCell(value: "BW")),
                              DataCell(TableDataCell(value: "8")),
                            ]),
                            DataRow(cells: <DataCell>[
                              DataCell(
                                TableDataCell(value: "3"),
                              ),
                              DataCell(TableDataCell(value: "10")),
                              DataCell(TableDataCell(value: "BW")),
                              DataCell(TableDataCell(value: "9")),
                            ])
                          ],
                        )
                      ],
                    );
                  }),
            )
          ],
        ),
      ),
    ));
  }
}
