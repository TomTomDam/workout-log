import 'package:flutter/material.dart';
import 'package:workout_log/enums/muscle_group_enum.dart';
import '../../enums/equipment_enum.dart';
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
  EdgeInsets rowMargin = const EdgeInsets.fromLTRB(20, 20, 20, 0);
  List<ExerciseModel> resultsList = exerciseList;

  @override
  Widget build(BuildContext context) {
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
                searchExercisesBar(),
                filterRow(context),
                exercisesList()
              ],
            )),
          )),
    );
  }

  Container exercisesList() {
    return Container(
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
                          builder: (context) => ExerciseInformation(
                                exerciseId: resultsList[index].exerciseId,
                              ))),
                  leading: Container(
                    margin: const EdgeInsets.all(5.0),
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade400, shape: BoxShape.circle),
                    child: const Icon(Icons.fitness_center,
                        color: Colors.black, size: 25),
                  ),
                  title: Text(resultsList[index].name),
                  subtitle: Text(resultsList[index].musclesWorked),
                ),
                const Divider(thickness: 2)
              ],
            );
          }),
    );
  }

  Container filterRow(BuildContext context) {
    return Container(
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
                            onTap: () {
                              setState(() => {
                                    resultsList = exerciseList
                                        .where(
                                            (result) => result.equipmentId != 0)
                                        .toList()
                                  });
                            },
                            child: const ListTile(
                              title: Text('Any equipment'),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() => {
                                    resultsList = exerciseList
                                        .where((result) =>
                                            result.equipmentId ==
                                            EquipmentEnum.dumbbell.index)
                                        .toList()
                                  });
                            },
                            child: const ListTile(
                              title: Text('Dumbbell'),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() => {
                                    resultsList = exerciseList
                                        .where((result) =>
                                            result.equipmentId ==
                                            EquipmentEnum.other.index)
                                        .toList()
                                  });
                            },
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
                            onTap: () {
                              setState(() => {
                                    resultsList = exerciseList
                                        .where((result) =>
                                            result.muscleGroupWorked != 0)
                                        .toList()
                                  });
                            },
                            child: const ListTile(
                              title: Text('All muscles'),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() => {
                                    resultsList = exerciseList
                                        .where((result) =>
                                            result.muscleGroupWorked ==
                                            MuscleGroupEnum.chest.index)
                                        .toList()
                                  });
                            },
                            child: const ListTile(
                              title: Text('Chest'),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() => {
                                    resultsList = exerciseList
                                        .where((result) =>
                                            result.muscleGroupWorked ==
                                            MuscleGroupEnum.back.index)
                                        .toList()
                                  });
                            },
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
    );
  }

  InkWell searchExercisesBar() {
    return InkWell(
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
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: TextField(
                      onChanged: searchExercise,
                      decoration: const InputDecoration(
                          labelText: "Search exercises",
                          floatingLabelBehavior: FloatingLabelBehavior.never)))
            ],
          )),
    );
  }

  void searchExercise(String query) {
    final searchResults = exerciseList.where((exercise) {
      final exerciseName = exercise.name.toLowerCase();
      final searchInput = query.toLowerCase();

      return exerciseName.contains(searchInput);
    }).toList();

    setState(() => resultsList = searchResults);
  }
}
