import 'package:flutter/material.dart';
import './settings/settings.dart';
import '../header.dart';
import 'onboarding_page1.dart';
import 'onboarding_page2.dart';
import 'onboarding_page3.dart';

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
            Header(
              title: "Dashboard",
              navigationButton: ElevatedButton(
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
              secondaryButton: null,
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
