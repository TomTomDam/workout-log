import 'package:flutter/material.dart';
import 'package:workout_log/screens/dashboard/calendar.dart';
import 'package:workout_log/screens/dashboard/exercises.dart';
import 'package:workout_log/screens/dashboard/goals.dart';
import 'package:workout_log/screens/dashboard/statistics.dart';
import '../../widgets/filter_list/static_filter_list.dart';
import '../settings/settings.dart';
import '../../widgets/header/header.dart';
import '../onboarding/onboarding_page1.dart';
import '../onboarding/onboarding_page2.dart';
import '../onboarding/onboarding_page3.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    const double sectionPadding = 20;

    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
          child: Column(
        children: [
          Header(
            title: "Dashboard",
            navigationButton: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(40, 40), primary: Colors.white),
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Settings())),
              child: const Icon(
                Icons.settings,
                color: Colors.black,
              ),
            ),
            secondaryButton: null,
          ),
          Padding(
              padding: const EdgeInsets.only(
                  top: sectionPadding,
                  left: sectionPadding,
                  right: sectionPadding),
              child: Row(
                children: const [Text("Welcome back, Tom!")],
              )),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 120,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                  ),
                  margin: const EdgeInsets.fromLTRB(20, 20, 5, 0),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text("Your current streak",
                          textAlign: TextAlign.center),
                      Text("12",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .headline1
                                  ?.fontSize)),
                      const Text("Completed workouts",
                          textAlign: TextAlign.center)
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: Container(
                      height: 120,
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                      ),
                      margin: const EdgeInsets.fromLTRB(5, 20, 20, 0),
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const FittedBox(
                            child: Text("Your next workout is",
                                textAlign: TextAlign.center),
                          ),
                          Text("Today",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: Theme.of(context)
                                      .textTheme
                                      .headline1
                                      ?.fontSize),
                              textAlign: TextAlign.center),
                          const Text("Pull Hypertrophy",
                              textAlign: TextAlign.center)
                        ],
                      )))
            ],
          ),
          Container(
            height: 146,
            width: double.infinity,
            decoration: const BoxDecoration(color: Colors.grey),
            margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Your most recent workout"),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Text(
                    "Push Hypertrophy",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize:
                            Theme.of(context).textTheme.headline1?.fontSize),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  child: Text("Yesterday (21/07/2022)",
                      style: TextStyle(color: Colors.grey.shade200)),
                ),
                SizedBox(
                  height: 50,
                  child: GridView.count(
                    primary: false,
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(top: 10),
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
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(20, 5, 20, 0),
            child: SizedBox(
              child: GridView.count(
                primary: false,
                shrinkWrap: true,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
                crossAxisCount: 2,
                childAspectRatio: (1 / .35),
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Statistics()));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      decoration: const BoxDecoration(color: Colors.grey),
                      margin: const EdgeInsets.fromLTRB(0, 10, 5, 0),
                      padding: const EdgeInsets.all(10),
                      child:
                          const Text("Statistics", textAlign: TextAlign.center),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Exercises()));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      decoration: const BoxDecoration(color: Colors.grey),
                      margin: const EdgeInsets.fromLTRB(5, 10, 0, 0),
                      padding: const EdgeInsets.all(10),
                      child:
                          const Text("Exercises", textAlign: TextAlign.center),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Calendar()));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      decoration: const BoxDecoration(color: Colors.grey),
                      margin: const EdgeInsets.fromLTRB(0, 10, 5, 0),
                      padding: const EdgeInsets.all(10),
                      child:
                          const Text("Calendar", textAlign: TextAlign.center),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Goals()));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      decoration: const BoxDecoration(color: Colors.grey),
                      margin: const EdgeInsets.fromLTRB(5, 10, 0, 0),
                      padding: const EdgeInsets.all(10),
                      child: const Text("Goals", textAlign: TextAlign.center),
                    ),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Text(
                "Training styles",
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
          ),
          const Padding(
              padding: EdgeInsets.only(top: 5), child: StaticFilterList()),
          Padding(
              padding: const EdgeInsets.only(
                  top: sectionPadding,
                  left: sectionPadding,
                  right: sectionPadding),
              child: Row(
                children: [
                  ElevatedButton(
                    child: const Text("Go to: Onboarding Page 1"),
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OnboardingPage1())),
                  )
                ],
              )),
          Padding(
              padding: const EdgeInsets.only(
                  left: sectionPadding, right: sectionPadding),
              child: Row(
                children: [
                  ElevatedButton(
                    child: const Text("Go to: Onboarding Page 2"),
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OnboardingPage2())),
                  )
                ],
              )),
          Padding(
              padding: const EdgeInsets.only(
                  left: sectionPadding, right: sectionPadding),
              child: Row(
                children: [
                  ElevatedButton(
                    child: const Text("Go to: Onboarding Page 3"),
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OnboardingPage3())),
                  )
                ],
              )),
        ],
      )),
    ));
  }
}
