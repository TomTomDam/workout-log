import 'package:flutter/material.dart';
import 'package:workout_log/screens/select_workout.dart';
import 'package:workout_log/screens/settings/settings.dart';
import '../../widgets/page/pane_button.dart';
import 'exercises_pane.dart';
import 'muscles/muscles_pane.dart';
import 'overview_pane.dart';

Widget pageSection = const OverviewPane();

class LogWorkout extends StatefulWidget {
  const LogWorkout({Key? key}) : super(key: key);

  @override
  State<LogWorkout> createState() => _LogWorkoutState();
}

enum LogWorkoutPanes { overview, exercises, muscles }

enum MuscleViewType { table, heatmapDiagram }

class _LogWorkoutState extends State<LogWorkout> {
  EdgeInsets padding = const EdgeInsets.all(25);
  LogWorkoutPanes selectedPane = LogWorkoutPanes.overview;

  MuscleViewType muscleViewType = MuscleViewType.table;
  updateMuscleViewType(newViewType) {
    setState(() {
      muscleViewType = newViewType;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: SafeArea(
                child: Center(
              child: Column(children: [
                const LogWorkoutNavBar(),
                const LogWorkoutHeader(),
                Container(
                    width: double.infinity,
                    height: 50,
                    margin: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 25.0),
                    alignment: Alignment.center,
                    child: ElevatedButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.electric_bolt),
                            Text("Start workout"),
                          ],
                        ))),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () => {
                        setState(() {
                          pageSection = const OverviewPane();
                          selectedPane = LogWorkoutPanes.overview;
                        })
                      },
                      child: PaneButton(
                          title: "Overview",
                          isActive: selectedPane == LogWorkoutPanes.overview),
                    ),
                    InkWell(
                        onTap: () => {
                              setState(() {
                                pageSection = const ExercisesPane();
                                selectedPane = LogWorkoutPanes.exercises;
                              })
                            },
                        child: PaneButton(
                            title: "Exercises",
                            isActive:
                                selectedPane == LogWorkoutPanes.exercises)),
                    InkWell(
                        onTap: () => {
                              setState(() {
                                pageSection = MusclesPane(
                                    updateViewType: updateMuscleViewType,
                                    viewType: muscleViewType);
                                selectedPane = LogWorkoutPanes.muscles;
                              })
                            },
                        child: PaneButton(
                            title: "Muscles",
                            isActive: selectedPane == LogWorkoutPanes.muscles)),
                  ],
                ),
                Padding(padding: padding, child: pageSection),
              ]),
            )),
          )),
    );
  }
}

class LogWorkoutHeader extends StatelessWidget {
  const LogWorkoutHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 24.0, left: 24.0, right: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Pull Hypertrophy",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Theme.of(context).textTheme.headline2?.fontSize)),
          Container(
              margin: const EdgeInsets.only(top: 5),
              child: const Text("21 October 2022 - 5:30PM"))
        ],
      ),
    );
  }
}

class LogWorkoutNavBar extends StatelessWidget {
  const LogWorkoutNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double padding = 20;
    const EdgeInsets rowPadding =
        EdgeInsets.only(top: padding, left: padding, right: padding);

    return Padding(
      padding: rowPadding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              flex: 2,
              child: Align(
                  alignment: Alignment.topLeft,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(40, 40), primary: Colors.white),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SelectWorkout()));
                    },
                    child: const Icon(
                      Icons.navigate_before,
                      color: Colors.black,
                    ),
                  ))),
          Expanded(
              flex: 2,
              child: Align(
                  alignment: Alignment.topLeft,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(40, 40), primary: Colors.white),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return const AlertDialog(
                              content: Text("This is a timer"),
                            );
                          });
                    },
                    child: const Icon(
                      Icons.timer,
                      color: Colors.black,
                    ),
                  ))),
          const Spacer(),
          Expanded(
            flex: 2,
            child: Center(
                child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(40, 40), primary: Colors.white),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Settings()));
              },
              child: const Icon(
                Icons.settings,
                color: Colors.black,
              ),
            )),
          ),
          Expanded(
            flex: 2,
            child: Center(
                child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(40, 40), primary: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.check,
                color: Colors.black,
              ),
            )),
          )
        ],
      ),
    );
  }
}
