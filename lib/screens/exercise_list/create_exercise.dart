import 'package:flutter/material.dart';
import '../../widgets/header/header.dart';
import '../../widgets/header/navigate_before_button.dart';

class CreateExercise extends StatelessWidget {
  const CreateExercise({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const EdgeInsets rowMargin =
        EdgeInsets.only(left: 25.0, right: 25.0, top: 15.0);

    return Scaffold(
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
            )
          ],
        )));
  }
}
