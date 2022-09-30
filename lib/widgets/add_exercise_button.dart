import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

import '../screens/add_exercise.dart';

class AddExerciseButton extends StatelessWidget {
  const AddExerciseButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        child: const Text("+ Add Exercise"),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddExercise()));
        },
      ),
    );
  }
}
