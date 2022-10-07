import 'package:flutter/material.dart';
import '../screens/exercise_list/add_exercises.dart';

class AddExerciseButton extends StatelessWidget {
  const AddExerciseButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        child: const Text("+ Add Exercise"),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddExercises()));
        },
      ),
    );
  }
}
