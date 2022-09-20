import 'package:flutter/material.dart';
import '../widgets/sub_header.dart';
import '../widgets/header.dart';
import '../widgets/nav_bar.dart';

class SelectWorkout extends StatefulWidget {
  const SelectWorkout({Key? key}) : super(key: key);

  @override
  State<SelectWorkout> createState() => _SelectWorkoutState();
}

class _SelectWorkoutState extends State<SelectWorkout> {
  @override
  Widget build(BuildContext context) {
    const double margin = 25;
    const EdgeInsets containerMargin =
        EdgeInsets.only(top: 10, left: margin, right: margin);

    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: const NavBar(currentPage: 1),
        body: SingleChildScrollView(
          child: SafeArea(
              child: Center(
            child: Column(children: [
              const Header(
                  title: "Select a workout",
                  navigationButton: null,
                  secondaryButton: null),
              const SubHeader(title: "Your next scheduled workout"),
              Container(
                margin: containerMargin,
                child: Container(
                    width: width - margin,
                    height: 90,
                    padding: const EdgeInsets.all(8.0),
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Pull Hypertrophy",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .headline2
                                    ?.fontSize)),
                        Expanded(
                          child: GridView.count(
                            primary: false,
                            padding: const EdgeInsets.only(top: 8.0),
                            crossAxisSpacing: 0,
                            mainAxisSpacing: 0,
                            crossAxisCount: 2,
                            childAspectRatio: (1 / .12),
                            children: <Widget>[
                              Text("Duration",
                                  style:
                                      TextStyle(color: Colors.grey.shade200)),
                              Text("Volume",
                                  style:
                                      TextStyle(color: Colors.grey.shade200)),
                              const Text("1 hr 30 mins"),
                              const Text("1000kg")
                            ],
                          ),
                        )
                      ],
                    )),
              ),
              const SubHeader(title: "Quick start"),
              Container(
                margin: containerMargin,
                child: Container(
                  width: width - margin,
                  height: 70,
                  padding: const EdgeInsets.all(8.0),
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                  ),
                  child: const Align(
                      alignment: Alignment.center,
                      child: Text("Start an empty workout")),
                ),
              ),
              const SubHeader(title: "Workouts"),
              Container(
                margin:
                    const EdgeInsets.only(top: 10, left: margin, right: margin),
                child: Row(children: const [
                  GridButton(text: "New workout", icon: Icons.add),
                  GridButton(text: "Search workouts", icon: Icons.search),
                  GridButton(text: "Favourites", icon: Icons.star),
                ]),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SubHeader(title: "Workout history"),
                  Container(
                    margin: const EdgeInsets.only(
                        top: margin, left: margin, right: margin),
                    child: const Icon(Icons.keyboard_arrow_down,
                        color: Colors.black),
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.only(
                    top: 10, bottom: 25, left: margin, right: margin),
                child: Container(
                  width: width - margin,
                  height: 270,
                  padding: const EdgeInsets.all(8.0),
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Push Hypertrophy",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .headline2
                                        ?.fontSize)),
                            const Icon(Icons.more_vert, color: Colors.black)
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 4.0),
                          child: Text(
                            "Yesterday (18/09/2022)",
                            style: TextStyle(color: Colors.grey.shade200),
                          ),
                        ),
                        Expanded(
                          child: GridView.count(
                            primary: false,
                            padding: const EdgeInsets.only(top: 8.0),
                            crossAxisSpacing: 0,
                            mainAxisSpacing: 0,
                            crossAxisCount: 2,
                            childAspectRatio: (1 / .12),
                            children: <Widget>[
                              Text("Duration",
                                  style:
                                      TextStyle(color: Colors.grey.shade200)),
                              Text("Volume",
                                  style:
                                      TextStyle(color: Colors.grey.shade200)),
                              const Text("1 hr 30 mins"),
                              const Text("1000kg")
                            ],
                          ),
                        ),
                        const Divider(
                          color: Colors.black,
                          thickness: 1,
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 4.0),
                          child: Text(
                            "Exercises",
                            style: TextStyle(color: Colors.grey.shade200),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              top: 4.0, bottom: 4.0, left: 4.0),
                          child: Row(
                            children: const [
                              ExerciseImage(),
                              ExerciseText(text: "3 sets - Bench Press")
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              top: 4.0, bottom: 4.0, left: 4.0),
                          child: Row(
                            children: const [
                              ExerciseImage(),
                              ExerciseText(
                                  text: "3 sets - Chest Press (Machine)")
                            ],
                          ),
                        )
                      ]),
                ),
              )
            ]),
          )),
        ));
  }
}

class GridButton extends StatelessWidget {
  const GridButton({Key? key, required this.text, required this.icon})
      : super(key: key);
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
          padding: const EdgeInsets.only(top: 10),
          alignment: Alignment.center,
          height: 80,
          decoration: const BoxDecoration(
            color: Colors.grey,
          ),
          child: Column(children: [
            Icon(
              icon,
              color: Colors.black,
            ),
            Container(
              margin: const EdgeInsets.only(top: 8.0),
              child: Text(
                text,
                textAlign: TextAlign.center,
              ),
            )
          ]),
        ),
      ),
    );
  }
}

class ExerciseImage extends StatelessWidget {
  const ExerciseImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 4.0, left: 4.0, right: 4.0),
        width: 50,
        height: 50,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            color: Colors.white,
            shape: BoxShape.circle));
  }
}

class ExerciseText extends StatelessWidget {
  const ExerciseText({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 8.0, left: 4.0), child: Text(text));
  }
}
