import 'package:flutter/material.dart';
import '../../widgets/header/header.dart';
import 'create_exercise.dart';

class AddExercises extends StatefulWidget {
  const AddExercises({Key? key}) : super(key: key);

  @override
  State<AddExercises> createState() => _AddExercisesState();
}

class _AddExercisesState extends State<AddExercises> {
  @override
  Widget build(BuildContext context) {
    const EdgeInsets rowMargin =
        EdgeInsets.only(left: 25.0, right: 25.0, top: 15.0);

    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Column(
          children: [
            Header(
              title: "Add Exercises",
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
              secondaryButton: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(40, 40), primary: Colors.white),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CreateExercise()));
                },
                child: const Text(
                  "Create",
                  style: TextStyle(color: Colors.black, fontSize: 12),
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                  margin: rowMargin,
                  padding: const EdgeInsets.all(10.0),
                  height: 50,
                  width: double.infinity,
                  color: Colors.grey.shade400,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: const Text("Search exercise"))
                    ],
                  )),
            ),
            Container(
              margin: rowMargin,
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Wrap(
                                children: [
                                  const ListTile(
                                    title: Center(
                                        child: Text('Filter by equipment',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold))),
                                  ),
                                  const Divider(),
                                  InkWell(
                                    onTap: () {},
                                    child: const ListTile(
                                      title: Text('Dumbbell'),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: const ListTile(
                                      title: Text('Machine'),
                                    ),
                                  ),
                                ],
                              );
                            });
                      },
                      child: Container(
                          margin: const EdgeInsets.only(right: 10.0),
                          padding: const EdgeInsets.all(10.0),
                          height: 50,
                          color: Colors.grey.shade400,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [Text("By equipment")],
                          )),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Wrap(
                                children: [
                                  const ListTile(
                                    title: Center(
                                        child: Text('Filter by muscle group',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold))),
                                  ),
                                  const Divider(),
                                  InkWell(
                                    onTap: () {},
                                    child: const ListTile(
                                      title: Text('Chest'),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: const ListTile(
                                      title: Text('Back'),
                                    ),
                                  ),
                                ],
                              );
                            });
                      },
                      child: Container(
                          margin: const EdgeInsets.only(left: 10.0),
                          padding: const EdgeInsets.all(10.0),
                          height: 50,
                          color: Colors.grey.shade400,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [Text("By muscle group")],
                          )),
                    ),
                  )
                ],
              ),
            )
          ],
        )));
  }
}
