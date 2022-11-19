import 'package:flutter/material.dart';
import '../screens/exercise_list/add_exercises.dart';

class AddExerciseButton extends StatelessWidget {
  const AddExerciseButton({Key? key, required this.width}) : super(key: key);
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        child: const Text("+ Add Exercise", textAlign: TextAlign.center),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddExercises()));
        },
      ),
    );
  }
}
