import 'package:flutter/material.dart';
import '../main.dart';

class SelectWorkout extends StatefulWidget {
  const SelectWorkout({Key? key}) : super(key: key);

  @override
  State<SelectWorkout> createState() => _SelectWorkoutState();
}

class _SelectWorkoutState extends State<SelectWorkout> {
  @override
  Widget build(BuildContext context) {
    const double padding = 25;
    const EdgeInsets sectionPadding =
        EdgeInsets.only(top: padding, left: padding, right: padding);
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Center(
          child: Column(children: [
            Padding(
              padding: sectionPadding,
              child: Row(
                children: [
                  const Expanded(flex: 2, child: Center()),
                  Expanded(
                    flex: 6,
                    child: Center(
                      child: Text("Select a workout",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .headline1
                                  ?.fontSize)),
                    ),
                  ),
                  const Expanded(
                    flex: 2,
                    child: Center(),
                  )
                ],
              ),
            ),
            Padding(
                padding: sectionPadding,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Your next scheduled workout",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: Theme.of(context)
                                .textTheme
                                .headline2
                                ?.fontSize))
                  ],
                )),
            Padding(
              padding: sectionPadding,
              child: Container(
                width: width - padding,
                height: 100,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Pull Hypertrophy",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Row(
                          children: const [
                            Expanded(
                              flex: 5,
                              child: Padding(
                                padding: EdgeInsets.only(right: 8.0),
                                child: Text(
                                  "Duration",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Padding(
                                padding: EdgeInsets.only(right: 8.0),
                                child: Text("Volume",
                                    style: TextStyle(color: Colors.white)),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Row(
                            children: const [
                              Expanded(
                                flex: 5,
                                child: const Text("1 hr 30 mins"),
                              ),
                              Expanded(flex: 5, child: const Text("1000kg"))
                            ],
                          ))
                    ],
                  ),
                ),
              ),
            ),
            const Padding(
              padding: sectionPadding,
              child: Text("Hello"),
            )
          ]),
        )));
  }
}
