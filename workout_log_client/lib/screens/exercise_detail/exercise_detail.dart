import 'package:flutter/material.dart';
import '../../widgets/header/header.dart';
import '../../widgets/page/pane_button.dart';
import 'exercise_summary.dart';
import 'exercise_history.dart';

Widget pageSection = const ExerciseSummary();

class ExerciseDetail extends StatefulWidget {
  const ExerciseDetail({Key? key, required this.exerciseId}) : super(key: key);
  final int? exerciseId;

  @override
  State<ExerciseDetail> createState() => _ExerciseDetailState();
}

class _ExerciseDetailState extends State<ExerciseDetail> {
  EdgeInsets padding = const EdgeInsets.all(25);
  bool summaryIsActive = true;
  bool historyIsActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(children: [
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
      const Padding(padding: EdgeInsets.all(10)),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: InkWell(
              onTap: () => {
                setState(() {
                  pageSection = const ExerciseSummary();
                  summaryIsActive = true;
                  historyIsActive = false;
                })
              },
              child: PaneButton(title: "Summary", isActive: summaryIsActive),
            ),
          ),
          Expanded(
            child: InkWell(
                onTap: () => {
                      setState(() {
                        pageSection = const ExerciseHistory();
                        historyIsActive = true;
                        summaryIsActive = false;
                      })
                    },
                child: PaneButton(title: "History", isActive: historyIsActive)),
          ),
        ],
      ),
      Padding(padding: padding, child: pageSection),
    ])));
  }
}
