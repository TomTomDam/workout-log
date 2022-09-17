import 'package:flutter/material.dart';
import 'package:workout_log/screens/OnboardingPage1.dart';
import 'package:workout_log/screens/settings/Settings.dart';
import 'OnboardingPage1.dart';
import 'OnboardingPage2.dart';
import 'OnboardingPage3.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    const double padding = 25;

    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: padding, left: padding, right: padding),
              child: Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(40, 40),
                                primary: Colors.white),
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
                          ))),
                  Expanded(
                    flex: 6,
                    child: Center(
                      child: Text("Dashboard",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .headline2
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
                padding: const EdgeInsets.only(
                    top: padding, left: padding, right: padding),
                child: Row(
                  children: const [Text("Welcome back, Tom!")],
                )),
            Padding(
                padding: const EdgeInsets.only(
                    top: padding, left: padding, right: padding),
                child: Row(
                  children: [
                    ElevatedButton(
                      child: const Text("Go to: Onboarding Page 1"),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const OnboardingPage1()));
                      },
                    )
                  ],
                )),
            Padding(
                padding: const EdgeInsets.only(left: padding, right: padding),
                child: Row(
                  children: [
                    ElevatedButton(
                      child: const Text("Go to: Onboarding Page 2"),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const OnboardingPage2()));
                      },
                    )
                  ],
                )),
            Padding(
                padding: const EdgeInsets.only(left: padding, right: padding),
                child: Row(
                  children: [
                    ElevatedButton(
                      child: const Text("Go to: Onboarding Page 3"),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const OnboardingPage3()));
                      },
                    )
                  ],
                )),
          ],
        )));
  }
}
