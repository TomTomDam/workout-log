import 'package:flutter/material.dart';
import 'package:workout_log/widgets/header/header.dart';
import 'package:workout_log/widgets/header/navigate_before_button.dart';

class ExerciseTypeDetail extends StatelessWidget {
  const ExerciseTypeDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: const [
            Header(
                title: "Exercise Type",
                navigationButton: NavigateBeforeButton(),
                secondaryButton: null),
            SizedBox(height: 15),
            ExerciseTypeItem(
                title: "Weight and Reps",
                exampleExercise: "Bench Press",
                isSelected: false),
            ExerciseTypeItem(
                title: "Bodyweight and Reps",
                exampleExercise: "Pull Up",
                isSelected: false),
            ExerciseTypeItem(
                title: "Duration", exampleExercise: "Planks", isSelected: false)
          ],
        ),
      ),
    );
  }
}

class ExerciseTypeItem extends StatelessWidget {
  const ExerciseTypeItem(
      {Key? key,
      required this.title,
      required this.exampleExercise,
      required this.isSelected})
      : super(key: key);
  final String title;
  final String exampleExercise;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    const EdgeInsets rowMargin = EdgeInsets.only(left: 25.0, right: 25.0);

    return Container(
      margin: rowMargin,
      child: Wrap(children: [
        Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 5),
                  child: Text(
                    title,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                Text("E.g. $exampleExercise",
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 16))
              ],
            ),
            const Spacer(),
            isSelected ? const Icon(Icons.check) : Container(child: null),
          ],
        ),
        const Divider(thickness: 2)
      ]),
    );
  }
}
