import 'package:flutter/material.dart';
import 'package:workout_log/screens/select_workout.dart';
import 'package:workout_log/screens/settings/settings.dart';
import '../../widgets/page/pane_button.dart';
import 'exercises_pane.dart';
import 'muscles_pane.dart';
import 'overview_pane.dart';

Widget pageSection = const OverviewPage();

class LogWorkout extends StatefulWidget {
  const LogWorkout({Key? key}) : super(key: key);

  @override
  State<LogWorkout> createState() => _LogWorkoutState();
}

class _LogWorkoutState extends State<LogWorkout> {
  @override
  Widget build(BuildContext context) {
    const EdgeInsets padding = EdgeInsets.all(25);
    bool overviewIsActive = false;
    bool exercisesIsActive = false;
    bool musclesIsActive = false;

    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SafeArea(
              child: Center(
            child: Column(children: [
              const LogWorkoutHeader(),
              Container(
                margin:
                    const EdgeInsets.only(top: 24.0, left: 24.0, right: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Pull Hypertrophy",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: Theme.of(context)
                                .textTheme
                                .headline2
                                ?.fontSize)),
                    Container(
                        margin: const EdgeInsets.only(top: 5),
                        child: const Text("21 October 2022 - 5:30PM"))
                  ],
                ),
              ),
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
                        pageSection = const OverviewPage();
                        overviewIsActive = true;
                        exercisesIsActive = false;
                        musclesIsActive = false;
                      })
                    },
                    child: PaneButton(
                        title: "Overview", isActive: overviewIsActive),
                  ),
                  InkWell(
                      onTap: () => {
                            setState(() {
                              pageSection = const ExercisesPage();
                              exercisesIsActive = true;
                              overviewIsActive = false;
                              musclesIsActive = false;
                            })
                          },
                      child: PaneButton(
                          title: "Exercises", isActive: exercisesIsActive)),
                  InkWell(
                      onTap: () => {
                            setState(() {
                              pageSection = const MusclesPage();
                              musclesIsActive = true;
                              exercisesIsActive = false;
                              overviewIsActive = false;
                            })
                          },
                      child: PaneButton(
                          title: "Muscles", isActive: musclesIsActive)),
                ],
              ),
              Padding(padding: padding, child: pageSection),
            ]),
          )),
        ));
  }
}

class LogWorkoutHeader extends StatelessWidget {
  const LogWorkoutHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double padding = 25;
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
