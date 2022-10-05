import 'package:flutter/material.dart';
import '../../widgets/header.dart';
import '../settings/settings.dart';

class ExerciseInformation extends StatelessWidget {
  const ExerciseInformation({Key? key, required this.exerciseId})
      : super(key: key);
  final int exerciseId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        Header(
          title: "Example Exercise",
          navigationButton: ElevatedButton(
            style: ElevatedButton.styleFrom(
                minimumSize: const Size(40, 40), primary: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.navigate_before,
                color: Colors.black,
              ),
            ),
          ),
          secondaryButton: null,
        ),
      ],
    )));
  }
}
