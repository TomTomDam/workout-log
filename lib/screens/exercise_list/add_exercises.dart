import 'package:flutter/material.dart';
import '../../models/exercise_model.dart';
import '../../widgets/header/header.dart';
import '../exercise_information/exercise_information.dart';
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

    List<ExerciseModel> exerciseList = [
      ExerciseModel("Arnold Press", "Front Delts, Triceps"),
      ExerciseModel("Ab Wheel", "Abdominals"),
      ExerciseModel("Bench Press (Barbell)", "Chest, Front Delts, Triceps")
    ];
    List<ExerciseModel> resultsList = exerciseList;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: SafeArea(
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
                      alignment: Alignment.center,
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
                              alignment: Alignment.center,
                              width: 280,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: TextField(
                                  onChanged: (query) {
                                    final searchResults =
                                        exerciseList.where((exercise) {
                                      final exerciseName =
                                          exercise.name.toLowerCase();
                                      final searchInput = query.toLowerCase();

                                      return exerciseName.contains(searchInput);
                                    }).toList();

                                    setState(() => resultsList = searchResults);

                                    print(resultsList.length.toString());
                                  },
                                  decoration: const InputDecoration(
                                      labelText: "Search exercises",
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.never)))
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
                                                    fontWeight:
                                                        FontWeight.bold))),
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
                                            child: Text(
                                                'Filter by muscle group',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold))),
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
                ),
                Container(
                  height: 500,
                  margin: rowMargin,
                  child: ListView.builder(
                      itemCount: resultsList.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            ListTile(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ExerciseInformation(
                                            exerciseId: 0,
                                          ))),
                              title: Text(resultsList[index].name),
                              subtitle: Text(resultsList[index].muscleWorked),
                            ),
                            const Divider(thickness: 2)
                          ],
                        );
                      }),
                )
              ],
            )),
          )),
    );
  }
}
