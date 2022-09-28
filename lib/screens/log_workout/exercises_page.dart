import 'package:flutter/material.dart';

class ExercisesPage extends StatelessWidget {
  const ExercisesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> exerciseItems = [
      const ExerciseItem(
        isCollapsed: true,
      ),
      const ExerciseItem(isCollapsed: false)
    ];

    return ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: exerciseItems);
  }
}

class ExerciseItem extends StatefulWidget {
  const ExerciseItem({Key? key, required this.isCollapsed}) : super(key: key);

  final bool isCollapsed;

  @override
  State<ExerciseItem> createState() => _ExerciseItemState();
}

class _ExerciseItemState extends State<ExerciseItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey,
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTileTheme(
          contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ExpansionTile(
            title: const ExerciseItemHeader(),
            children: [
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black)),
                    child: Container(
                      margin: const EdgeInsets.all(8.0),
                      child: Row(children: [
                        Container(
                            margin: const EdgeInsets.only(right: 8.0),
                            child: const Icon(Icons.star, size: 30)),
                        Container(
                            margin: const EdgeInsets.only(right: 16.0),
                            child: const Text("Best Set Volume")),
                        Container(
                            margin: const EdgeInsets.only(right: 16.0),
                            child: Text(
                              "28kg x 12",
                              style: TextStyle(color: Colors.grey.shade600),
                            ))
                      ]),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(
                        bottom: 8.0, left: 8.0, right: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: const EdgeInsets.symmetric(vertical: 4.0),
                            child: const Text("Notes",
                                style: TextStyle(color: Colors.white))),
                        Container(
                            margin: const EdgeInsets.only(bottom: 4.0),
                            child: const Text("Lightweight baby!"))
                      ],
                    ),
                  ),
                  DataTable(
                    columnSpacing: 35,
                    columns: const <DataColumn>[
                      DataColumn(label: LogTableHeaderCell(value: "Set")),
                      DataColumn(label: LogTableHeaderCell(value: "Previous")),
                      DataColumn(label: LogTableHeaderCell(value: "Weight")),
                      DataColumn(label: LogTableHeaderCell(value: "Reps")),
                    ],
                    rows: const <DataRow>[
                      DataRow(cells: <DataCell>[
                        DataCell(Center(
                            child: Text("W",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20)))),
                        DataCell(LogTableDataCell(value: "20 x 8")),
                        DataCell(LogTableDataCell(value: "20kg")),
                        DataCell(LogTableDataCell(value: "8")),
                      ])
                    ],
                  ),
                  const Divider(thickness: 2),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                            child: Column(
                          children: [
                            Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: const Text(
                                  "Total sets",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )),
                            const Text("8")
                          ],
                        )),
                        Expanded(
                            child: Column(
                          children: [
                            Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: const Text("Average weight",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold))),
                            const Text("18.67kg")
                          ],
                        )),
                        Expanded(
                            child: Column(
                          children: [
                            Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: const Text("Total reps",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold))),
                            const Text("30")
                          ],
                        )),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LogTableHeaderCell extends StatelessWidget {
  const LogTableHeaderCell({Key? key, required this.value}) : super(key: key);
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Text(
      value.toUpperCase(),
      style: TextStyle(color: Colors.grey.shade700),
    ));
  }
}

class LogTableDataCell extends StatelessWidget {
  const LogTableDataCell({Key? key, required this.value}) : super(key: key);
  final String value;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(value));
  }
}

class ExerciseItemHeader extends StatefulWidget {
  const ExerciseItemHeader({Key? key}) : super(key: key);

  @override
  State<ExerciseItemHeader> createState() => _ExerciseItemHeaderState();
}

class _ExerciseItemHeaderState extends State<ExerciseItemHeader> {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
          margin: const EdgeInsets.only(right: 8.0),
          child: const Icon(Icons.fitness_center, size: 30)),
      Text(
        "Pull up",
        style: TextStyle(
            fontSize: Theme.of(context).textTheme.headline2?.fontSize,
            fontWeight: Theme.of(context).textTheme.headline2?.fontWeight),
      ),
      const Spacer(),
      InkWell(
        onTap: () {},
        child: const Icon(
          Icons.help_outline,
          size: 30,
        ),
      ),
      InkWell(onTap: () {}, child: const Icon(Icons.more_vert, size: 30))
    ]);
  }
}
