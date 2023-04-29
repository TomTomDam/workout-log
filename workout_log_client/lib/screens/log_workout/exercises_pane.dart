import 'package:flutter/material.dart';
import 'package:workout_log/screens/exercise_information/exercise_information.dart';
import '../../widgets/add_exercise_button.dart';
import '../../widgets/table/table_data_cell.dart';
import '../../widgets/table/table_header_cell.dart';

const expansionTileHeaderColour = Colors.black;

class ExercisesPane extends StatelessWidget {
  const ExercisesPane({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> exerciseItems = [const ExerciseItem()];

    return Column(children: [
      (() {
        if (exerciseItems.isNotEmpty) {
          return Column(
            children: [
              ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: exerciseItems),
              const AddExerciseButton(width: double.infinity)
            ],
          );
        }

        return Column(
          children: [
            const EmptyExercisePage(),
            Container(
                margin: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: const AddExerciseButton(width: 150))
          ],
        );
      }())
    ]);
  }
}

class EmptyExercisePage extends StatelessWidget {
  const EmptyExercisePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          margin: const EdgeInsets.fromLTRB(10, 40, 10, 0),
          child: const Icon(Icons.fitness_center, size: 60)),
      Container(
          margin: const EdgeInsets.fromLTRB(10, 20, 10, 0),
          child: const Text("Add an exercise to start your workout"))
    ]);
  }
}

class ExerciseItem extends StatefulWidget {
  const ExerciseItem({Key? key}) : super(key: key);

  @override
  State<ExerciseItem> createState() => _ExerciseItemState();
}

class _ExerciseItemState extends State<ExerciseItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey,
      margin: const EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: ListTileTheme(
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          child: ExpansionTile(
            title: const ExerciseItemHeader(),
            collapsedIconColor: expansionTileHeaderColour,
            iconColor: expansionTileHeaderColour,
            children: [
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black)),
                    child: const PersonalRecord(),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin:
                        const EdgeInsets.only(bottom: 10, left: 5, right: 5),
                    child: const TextField(
                        decoration: InputDecoration(labelText: "Notes")),
                  ),
                  DataTable(
                    columnSpacing: 35,
                    columns: const <DataColumn>[
                      DataColumn(label: TableHeaderCell(value: "Set")),
                      DataColumn(label: TableHeaderCell(value: "Previous")),
                      DataColumn(label: TableHeaderCell(value: "Weight")),
                      DataColumn(label: TableHeaderCell(value: "Reps"))
                    ],
                    rows: <DataRow>[
                      DataRow(cells: <DataCell>[
                        DataCell(Center(
                            child: InkWell(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return const ExerciseSetMenuModal();
                                });
                          },
                          child: const Text("W",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                        ))),
                        const DataCell(TableDataCell(value: "20 x 8")),
                        const DataCell(TableDataCell(value: "20kg")),
                        const DataCell(TableDataCell(value: "8")),
                      ])
                    ],
                  ),
                  const Divider(thickness: 2),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        Expanded(
                            child: Column(
                          children: [
                            Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10),
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
                                    const EdgeInsets.symmetric(vertical: 10),
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
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: const Text("Total reps",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold))),
                            const Text("30")
                          ],
                        )),
                      ],
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 10, bottom: 20),
                      child: Row(children: [
                        Expanded(
                          child: Column(children: [
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              child: const Text(
                                "Total volume (sets x reps x weight)",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            const Text("1680.3")
                          ]),
                        )
                      ]))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ExerciseSetMenuModal extends StatelessWidget {
  const ExerciseSetMenuModal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        InkWell(
          onTap: () {},
          child: const ListTile(
            leading: Icon(Icons.local_fire_department),
            title: Text('Warmup'),
          ),
        ),
        InkWell(
          onTap: () {},
          child: const ListTile(
            leading: Icon(Icons.looks_one),
            title: Text('Normal'),
          ),
        ),
        InkWell(
          onTap: () {},
          child: const ListTile(
            leading: Icon(Icons.warning),
            title: Text('Failure'),
          ),
        ),
        const Divider(),
        InkWell(
          onTap: () {},
          child: const ListTile(
            leading: Icon(Icons.delete),
            title: Text('Remove set'),
          ),
        ),
      ],
    );
  }
}

class PersonalRecord extends StatelessWidget {
  const PersonalRecord({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String text = "Best Set Volume";
    const String weight = "28";
    const String weightUnit = "kg";
    const String reps = "12";

    return Container(
      margin: const EdgeInsets.all(8.0),
      child: Row(children: [
        Container(
            margin: const EdgeInsets.only(right: 8.0),
            child: const Icon(Icons.star, size: 30)),
        Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: const Text(text)),
        Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: Text(
              "$weight$weightUnit x $reps",
              style: TextStyle(color: Colors.grey.shade600),
            ))
      ]),
    );
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
          child: const Icon(
            Icons.fitness_center,
            size: 30,
            color: expansionTileHeaderColour,
          )),
      Text("Pull up",
          style: TextStyle(
              color: expansionTileHeaderColour,
              fontSize: Theme.of(context).textTheme.headline2?.fontSize,
              fontWeight: Theme.of(context).textTheme.headline2?.fontWeight)),
      const Spacer(),
      InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ExerciseInformation(
                        exerciseId: 0,
                      )));
        },
        child: const Icon(
          Icons.help_outline,
          size: 30,
          color: expansionTileHeaderColour,
        ),
      ),
      InkWell(
          onTap: () {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return const ExerciseMenuModal();
                });
          },
          child: const Icon(Icons.more_vert,
              size: 30, color: expansionTileHeaderColour))
    ]);
  }
}

class ExerciseMenuModal extends StatelessWidget {
  const ExerciseMenuModal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const textColour = Colors.black;

    return Wrap(
      children: [
        InkWell(
          onTap: () {},
          child: const ListTile(
            leading: Icon(Icons.electric_bolt),
            title: Text('Change exercise', style: TextStyle(color: textColour)),
          ),
        ),
        InkWell(
          onTap: () {},
          child: const ListTile(
            leading: Icon(Icons.loop),
            title: Text('Reset sets and weight',
                style: TextStyle(color: textColour)),
          ),
        ),
        InkWell(
          onTap: () {},
          child: const ListTile(
            leading: Icon(Icons.menu),
            title:
                Text('Reorder exercise', style: TextStyle(color: textColour)),
          ),
        ),
        InkWell(
          onTap: () {},
          child: const ListTile(
            leading: Icon(Icons.close),
            title: Text('Delete exercise', style: TextStyle(color: textColour)),
          ),
        ),
      ],
    );
  }
}
