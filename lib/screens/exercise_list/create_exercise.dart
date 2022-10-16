import 'package:flutter/material.dart';
import '../../widgets/header/header.dart';
import '../../widgets/header/navigate_before_button.dart';
import '../exercise_type/exercise_type_detail.dart';

class CreateExercise extends StatelessWidget {
  const CreateExercise({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Column(
          children: [
            Header(
              title: "Create Exercise",
              navigationButton: const NavigateBeforeButton(),
              secondaryButton: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(40, 40), primary: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Save",
                      style: TextStyle(color: Colors.black))),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 15.0),
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.grey.shade400, shape: BoxShape.circle),
                child:
                    const Icon(Icons.camera_alt, color: Colors.black, size: 50),
              ),
            ),
            const Text("Add image"),
            Container(
              margin: const EdgeInsets.only(top: 25, left: 25, right: 25),
              child: const TextField(
                  decoration: InputDecoration(labelText: "Name of Exercise")),
            ),
            const ExerciseDetail(title: "Exercise Type"),
            const ExerciseDetail(title: "Equipment"),
            const ExerciseDetail(title: "Primary Muscle Group"),
            const ExerciseDetail(title: "Other Muscles"),
          ],
        )));
  }
}

class ExerciseDetail extends StatelessWidget {
  const ExerciseDetail({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 25, left: 25, right: 25),
      child: Row(
        children: [
          Text(title),
          const Spacer(),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ExerciseTypeDetail()));
            },
            child: Row(
              children: const [Text("Select"), Icon(Icons.chevron_right)],
            ),
          )
        ],
      ),
    );
  }
}
