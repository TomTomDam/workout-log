import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
    const double padding = 25;
    const EdgeInsets containerPadding =
        EdgeInsets.only(top: 10, left: padding, right: padding);
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: const NavBar(currentPage: 1),
        body: SafeArea(
            child: Center(
          child: Column(children: [
            const Header(
                title: "Select a workout",
                navigationButton: null,
                secondaryButton: null),
            const SubHeader(title: "Your next scheduled workout"),
            Padding(
              padding: containerPadding,
              child: Container(
                  width: width - padding,
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
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          crossAxisSpacing: 0,
                          mainAxisSpacing: 0,
                          crossAxisCount: 2,
                          childAspectRatio: (1 / .12),
                          children: <Widget>[
                            Text("Duration",
                                style: TextStyle(color: Colors.grey.shade200)),
                            Text("Volume",
                                style: TextStyle(color: Colors.grey.shade200)),
                            const Text("1 hr 30 mins"),
                            const Text("1000kg")
                          ],
                        ),
                      )
                    ],
                  )),
            ),
            const SubHeader(title: "Quick start"),
            Padding(
              padding: containerPadding,
              child: Container(
                width: width - padding,
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
            Padding(
              padding:
                  const EdgeInsets.only(top: 10, left: padding, right: padding),
              child: Row(children: const [
                GridButton(text: "New workout", icon: Icons.add),
                GridButton(text: "Search workouts", icon: Icons.search),
                GridButton(text: "Favourites", icon: Icons.star),
              ]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                SubHeader(title: "Workout history"),
                Padding(
                  padding: EdgeInsets.only(
                      top: padding, left: padding, right: padding),
                  child: Icon(Icons.keyboard_arrow_down, color: Colors.black),
                )
              ],
            ),
            Padding(
              padding: containerPadding,
              child: Container(
                width: width - padding,
                height: 100,
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
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          "Yesterday (18/09/2022)",
                          style: TextStyle(color: Colors.grey.shade200),
                        ),
                      ),
                      Expanded(
                        child: GridView.count(
                          primary: false,
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          crossAxisSpacing: 0,
                          mainAxisSpacing: 0,
                          crossAxisCount: 2,
                          childAspectRatio: (1 / .12),
                          children: <Widget>[
                            Text("Duration",
                                style: TextStyle(color: Colors.grey.shade200)),
                            Text("Volume",
                                style: TextStyle(color: Colors.grey.shade200)),
                            const Text("1 hr 30 mins"),
                            const Text("1000kg")
                          ],
                        ),
                      )
                    ]),
              ),
            )
          ]),
        )));
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
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
