import 'package:flutter/material.dart';
import '../sub_header.dart';
import '../header.dart';
import '../nav_bar.dart';

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
          ]),
        )));
  }
}
