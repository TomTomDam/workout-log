import 'package:flutter/material.dart';
import 'package:workout_log/screens/OnboardingPage1.dart';
import 'BorderBox.dart';
import 'screens/OnboardingPage1.dart';
import 'screens/OnboardingPage2.dart';
import 'screens/OnboardingPage3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Workout Log',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: const TextTheme(
              headline1: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
              headline2:
                  TextStyle(fontSize: 31.0, fontWeight: FontWeight.bold))),
      home: const Dashboard(title: 'Workout Log'),
    );
  }
}

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

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
                  const Expanded(
                      flex: 2,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: BorderBox(
                          height: 50,
                          width: 50,
                          child: Icon(
                            Icons.settings,
                            color: Colors.black,
                          ),
                        ),
                      )),
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
                      child: const Text("Go to: Onboarding Page 2"),
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
