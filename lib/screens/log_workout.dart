import 'package:flutter/material.dart';
import 'package:workout_log/screens/select_workout.dart';
import 'package:workout_log/screens/settings/settings.dart';

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

    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SafeArea(
              child: Center(
            child: Column(children: [
              LogWorkoutHeader(
                  navigationButton: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(40, 40), primary: Colors.white),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SelectWorkout()));
                    },
                    child: const Icon(
                      Icons.navigate_before_rounded,
                      color: Colors.black,
                    ),
                  ),
                  timerButton: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(40, 40), primary: Colors.white),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SelectWorkout()));
                    },
                    child: const Icon(
                      Icons.timer,
                      color: Colors.black,
                    ),
                  ),
                  settingsButton: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(40, 40), primary: Colors.white),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Settings()));
                    },
                    child: const Icon(
                      Icons.settings,
                      color: Colors.black,
                    ),
                  ),
                  finishButton: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(40, 40), primary: Colors.white),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Settings()));
                    },
                    child: const Icon(
                      Icons.check,
                      color: Colors.black,
                    ),
                  )),
              Container(
                margin: const EdgeInsets.all(25.0),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () =>
                        {setState(() => pageSection = const OverviewPage())},
                    child: const PageButton(title: "Overview"),
                  ),
                  InkWell(
                      onTap: () =>
                          {setState(() => pageSection = const ExercisesPage())},
                      child: const PageButton(title: "Exercises")),
                  InkWell(
                      onTap: () =>
                          {setState(() => pageSection = const MusclesPage())},
                      child: const PageButton(title: "Muscles")),
                ],
              ),
              Padding(padding: padding, child: pageSection),
            ]),
          )),
        ));
  }
}

class OverviewPage extends StatelessWidget {
  const OverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
            margin: const EdgeInsets.only(top: 8.0, left: 24.0, right: 24.0),
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                color: Colors.white,
                shape: BoxShape.circle),
            child: const Icon(Icons.fitness_center)),
        Container(
            margin: const EdgeInsets.only(top: 8.0, left: 24.0, right: 24.0),
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                color: Colors.white,
                shape: BoxShape.circle),
            child: const Icon(Icons.timer)),
      ]),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              margin: const EdgeInsets.only(top: 8.0, left: 24.0, right: 24.0),
              child: Text("3240 kg")),
          Container(
              margin: const EdgeInsets.only(top: 8.0, left: 24.0, right: 24.0),
              child: Text("1 hr 30 mins"))
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              margin: const EdgeInsets.only(top: 8.0, left: 24.0, right: 24.0),
              child: Text("Total volume")),
          Container(
              margin: const EdgeInsets.only(top: 8.0, left: 24.0, right: 24.0),
              child: Text("Duration"))
        ],
      )
    ]);
  }
}

class ExercisesPage extends StatelessWidget {
  const ExercisesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Exercise"),
    );
  }
}

class MusclesPage extends StatelessWidget {
  const MusclesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Muscles"),
    );
  }
}

class PageButton extends StatelessWidget {
  const PageButton({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: Container(
            padding: const EdgeInsets.all(5),
            decoration: const BoxDecoration(
                border:
                    Border(bottom: BorderSide(width: 4, color: Colors.black))),
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            )));
  }
}

class LogWorkoutHeader extends StatelessWidget {
  const LogWorkoutHeader(
      {Key? key,
      required this.navigationButton,
      required this.timerButton,
      required this.settingsButton,
      required this.finishButton})
      : super(key: key);
  final Widget? navigationButton;
  final Widget? timerButton;
  final Widget? settingsButton;
  final Widget? finishButton;

  @override
  Widget build(BuildContext context) {
    const double padding = 25;
    const EdgeInsets sectionPadding =
        EdgeInsets.only(top: padding, left: padding, right: padding);

    return Padding(
      padding: sectionPadding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              flex: 2,
              child: Align(
                  alignment: Alignment.topLeft,
                  child: navigationButton ?? Container())),
          Expanded(
              flex: 2,
              child: Align(
                  alignment: Alignment.topLeft,
                  child: timerButton ?? Container())),
          const Spacer(),
          Expanded(
            flex: 2,
            child: Center(child: settingsButton ?? Container()),
          ),
          Expanded(
            flex: 2,
            child: Center(child: finishButton ?? Container()),
          )
        ],
      ),
    );
  }
}
