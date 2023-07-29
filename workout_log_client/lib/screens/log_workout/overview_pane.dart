import 'dart:convert';
import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../models/workout_model.dart';
import 'package:http/http.dart' as http;

Future<WorkoutModel> getWorkout(id) async {
  final response = await http.get(Uri.parse("$apiUrl/workouts/$id"));

  if (response.statusCode == 200) {
    return WorkoutModel.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load Workout');
  }
}

class OverviewPane extends StatefulWidget {
  const OverviewPane({Key? key}) : super(key: key);

  @override
  State<OverviewPane> createState() => _OverviewPaneState();
}

class _OverviewPaneState extends State<OverviewPane> {
  late Future<WorkoutModel> futureWorkout;

  @override
  void initState() {
    super.initState();

    int workoutId = 1;
    futureWorkout = getWorkout(workoutId);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Expanded(
          child: Container(
              margin: const EdgeInsets.only(top: 8.0),
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  color: Colors.white,
                  shape: BoxShape.circle),
              child: const Icon(Icons.fitness_center)),
        ),
        Expanded(
          child: Container(
              margin: const EdgeInsets.only(top: 8.0),
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  color: Colors.white,
                  shape: BoxShape.circle),
              child: const Icon(Icons.timer)),
        ),
      ]),
      FutureBuilder<WorkoutModel>(
        future: futureWorkout,
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(top: 8.0),
                        child: Text("${snapshot.data!.totalVolume}kg")),
                  ),
                  Expanded(
                    child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(
                          top: 8.0,
                        ),
                        child: Text("${snapshot.data!.duration} mins")),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(top: 8.0),
                        child: const Text("Total volume",
                            style: TextStyle(fontWeight: FontWeight.bold))),
                  ),
                  Expanded(
                    child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(top: 8.0),
                        child: const Text("Duration",
                            style: TextStyle(fontWeight: FontWeight.bold))),
                  )
                ],
              )
            ]);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          return const SizedBox(
              height: 50,
              width: 50,
              child: Center(child: CircularProgressIndicator()));
        }),
      )
    ]);
  }
}
