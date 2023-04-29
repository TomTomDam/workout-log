import 'package:flutter/material.dart';
import 'package:workout_log/screens/exercise_information/equipment_pane.dart';
import 'package:workout_log/screens/exercise_information/muscles_worked_pane.dart';
import '../../widgets/header/header.dart';
import '../../widgets/page/pane_button.dart';
import 'instructions_pane.dart';

Widget pageSection = const InstructionsPane();

class ExerciseInformation extends StatefulWidget {
  const ExerciseInformation({Key? key, required this.exerciseId})
      : super(key: key);
  final int exerciseId;

  @override
  State<ExerciseInformation> createState() => _ExerciseInformationState();
}

class _ExerciseInformationState extends State<ExerciseInformation> {
  EdgeInsets padding = const EdgeInsets.all(25);
  bool instructionsIsActive = true;
  bool musclesWorkedIsActive = false;
  bool equipmentIsActive = false;

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
        Container(
          margin: const EdgeInsets.all(10),
          child: const Image(
              image: AssetImage('assets/images/pull-up.png'),
              height: 350,
              width: double.infinity),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: InkWell(
                onTap: () => {
                  setState(() {
                    pageSection = const InstructionsPane();
                    instructionsIsActive = true;
                    musclesWorkedIsActive = false;
                    equipmentIsActive = false;
                  })
                },
                child: PaneButton(
                    title: "Instructions", isActive: instructionsIsActive),
              ),
            ),
            Expanded(
              child: InkWell(
                  onTap: () => {
                        setState(() {
                          pageSection = const MusclesWorkedPane();
                          musclesWorkedIsActive = true;
                          instructionsIsActive = false;
                          equipmentIsActive = false;
                        })
                      },
                  child: PaneButton(
                      title: "Muscles worked",
                      isActive: musclesWorkedIsActive)),
            ),
            Expanded(
              child: InkWell(
                  onTap: () => {
                        setState(() {
                          pageSection = const EquipmentPane();
                          equipmentIsActive = true;
                          instructionsIsActive = false;
                          musclesWorkedIsActive = false;
                        })
                      },
                  child: PaneButton(
                      title: "Equipment", isActive: equipmentIsActive)),
            ),
          ],
        ),
        Padding(padding: padding, child: pageSection),
      ],
    )));
  }
}
