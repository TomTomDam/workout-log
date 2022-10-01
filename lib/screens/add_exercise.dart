import 'package:flutter/material.dart';

import '../widgets/header.dart';

class AddExercise extends StatefulWidget {
  const AddExercise({Key? key}) : super(key: key);

  @override
  State<AddExercise> createState() => _AddExerciseState();
}

class _AddExerciseState extends State<AddExercise> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Column(
          children: [
            Header(
              title: "Add Exercise",
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
                onPressed: () {},
                child: const Text(
                  "Add",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        )));
  }
}
