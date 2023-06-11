import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:workout_log/enums/muscle_group_enum.dart';
import 'package:workout_log/screens/exercise_detail/exercise_detail.dart';
import '../../constants.dart';
import '../../enums/equipment_enum.dart';
import '../../models/exercise_model.dart';
import '../../widgets/header/header.dart';
import 'create_exercise.dart';
import 'package:http/http.dart' as http;

Future<List<ExerciseModel>> getExercises() async {
  final response = await http.get(Uri.parse("$apiUrl/exercises"));

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((e) => ExerciseModel.fromJson(e)).toList();
  } else {
    throw Exception('Failed to load Exercises');
  }
}

class AddExercises extends StatefulWidget {
  const AddExercises({Key? key}) : super(key: key);

  @override
  State<AddExercises> createState() => _AddExercisesState();
}

class _AddExercisesState extends State<AddExercises> {
  EdgeInsets rowMargin = const EdgeInsets.fromLTRB(20, 20, 20, 0);
  late Future<List<ExerciseModel>> futureExercises;
  List<ExerciseModel> resultsList = [];
  List<ExerciseModel> selectedResults = [];

  @override
  void initState() {
    super.initState();
    futureExercises = getExercises();

    setState(() {
      getExercises().then((result) {
        setState(() {
          resultsList = exerciseList;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isSelected = false;
    setState(() {
      for (var result in selectedResults) {
        if (result.isSelected) {
          isSelected = true;
        }
      }
    });

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Stack(children: [
        Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: SafeArea(
                  child: Column(
                children: [
                  Header(
                    title: "Add Exercises",
                    navigationButton: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(40, 40),
                          primary: Colors.white),
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
                          minimumSize: const Size(40, 40),
                          primary: Colors.white),
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
                  exerciseListView(),
                  SizedBox(
                    height: 100,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        isSelected ? exercisesSelectedText() : Container()
                      ],
                    ),
                  )
                ],
              )),
            )),
      ]),
    );
  }

  Container exerciseListView() {
    return Container(
      height: 350,
      margin: rowMargin,
      child: FutureBuilder<List<ExerciseModel>>(
          future: futureExercises,
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.length,
                  itemBuilder: ((context, index) {
                    return Column(
                      children: [
                        exerciseListViewItem(index, context, snapshot.data),
                        const Divider(thickness: 2)
                      ],
                    );
                  }));
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            return const CircularProgressIndicator();
          })),
    );
  }

  ListTile exerciseListViewItem(
      int index, BuildContext context, List<ExerciseModel>? exerciseList) {
    return ListTile(
        onTap: () {
          setState(() {
            exerciseList?[index].isSelected = !exerciseList[index].isSelected;

            if (exerciseList![index].isSelected) {
              selectedResults.add(exerciseList[index]);
            } else {
              selectedResults.remove(exerciseList[index]);
            }
          });
        },
        leading: Row(mainAxisSize: MainAxisSize.min, children: [
          //TODO Position the Selected bar more to the left
          Container(
              width: 10,
              color: selectedResults.contains(exerciseList?[index])
                  ? Colors.blue
                  : Colors.transparent),
          Container(
            height: 120,
            width: 60,
            decoration: BoxDecoration(
                color: Colors.grey.shade400, shape: BoxShape.circle),
            child:
                const Icon(Icons.fitness_center, color: Colors.black, size: 40),
          ),
        ]),
        trailing: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ExerciseDetail(
                          exerciseId: exerciseList?[index].exerciseId,
                        )));
          },
          child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 2, color: Colors.grey.shade400),
                  shape: BoxShape.circle),
              child:
                  const Icon(Icons.show_chart, color: Colors.grey, size: 25)),
        ),
        title: Text(exerciseList![index].name),
        subtitle: const Text(
            "Muscles worked goes here") //TODO Text(exerciseList[index].musclesWorked),
        );
  }

  Widget exercisesSelectedText() {
    return Container(
      height: 50,
      width: 200,
      decoration: const BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Align(
          alignment: Alignment.center,
          child: Text(
            "${getSelectedExercisesCount()} items selected",
            style: const TextStyle(color: Colors.white, fontSize: 20),
          )),
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
                                            result.primaryMusclesWorkedId != 0)
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
                                            result.primaryMusclesWorkedId ==
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
                                            result.primaryMusclesWorkedId ==
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

  int getSelectedExercisesCount() {
    var count = 0;

    for (var element in resultsList) {
      if (element.isSelected) {
        count += 1;
      }
    }

    return count;
  }

  Future<String> getPrimaryMusclesWorked(int primaryMusclesWorkedId) async {
    //TODO Text(exerciseList[index].musclesWorked),
    final response = await http
        .get(Uri.parse("$apiUrl/muscleGroup/$primaryMusclesWorkedId"));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      var primaryMusclesWorked = ExerciseModel.fromJson(jsonResponse[0]).name;

      return "";
    } else {
      throw Exception('Failed to load Exercises');
    }
  }
}
