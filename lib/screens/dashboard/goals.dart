import 'package:flutter/material.dart';
import '../../widgets/header/header.dart';

class Goals extends StatelessWidget {
  const Goals({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Header(
                  title: "Goals",
                  navigationButton: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(40, 40), primary: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.navigate_before,
                      color: Colors.black,
                    ),
                  ),
                  secondaryButton: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Wrap(
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: const ListTile(
                                      leading: Icon(Icons.electric_bolt),
                                      title: Text('Add Goal'),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: const ListTile(
                                      leading: Icon(Icons.edit),
                                      title: Text('Edit Goal'),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: const ListTile(
                                      leading: Icon(Icons.close),
                                      title: Text('Delete Goal'),
                                    ),
                                  )
                                ],
                              );
                            });
                      },
                      child: const Icon(Icons.more_vert, color: Colors.black))),
              SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: GridView.count(
                    primary: false,
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(top: 20),
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 30,
                    crossAxisCount: 3,
                    childAspectRatio: 0.95,
                    children: const <Widget>[
                      GoalItem(
                          exercise: "Bench Press",
                          value: "50%",
                          progress: "82.5 to 100 kg"),
                      GoalItem(
                          exercise: "Squat",
                          value: "160kg",
                          progress: "140 to 180 kg"),
                      GoalItem(
                          exercise: "Deadlift",
                          value: "200kg",
                          progress: "180 to 200 kg"),
                      GoalItem(
                          exercise: "Weighted Pull Up",
                          value: "50%",
                          progress: "3x5 to 3x6 at 20 kg")
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class GoalItem extends StatelessWidget {
  const GoalItem(
      {Key? key,
      required this.exercise,
      required this.value,
      required this.progress})
      : super(key: key);
  final String exercise;
  final String value;
  final String progress;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(exercise, style: const TextStyle(fontWeight: FontWeight.bold)),
      Container(
          margin: const EdgeInsets.only(top: 10),
          width: 80,
          height: 80,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              color: Colors.grey,
              shape: BoxShape.circle),
          child: Align(alignment: Alignment.center, child: Text(value))),
      Container(margin: const EdgeInsets.only(top: 10), child: Text(progress))
    ]);
  }
}
