import 'package:flutter/material.dart';
import 'package:workout_log/screens/main.dart';
import '../widgets/filter_list.dart';

class OnboardingPage3 extends StatefulWidget {
  const OnboardingPage3({Key? key}) : super(key: key);

  @override
  State<OnboardingPage3> createState() => _OnboardingPage3State();
}

class _OnboardingPage3State extends State<OnboardingPage3> {
  @override
  Widget build(BuildContext context) {
    const double padding = 25;

    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Center(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(padding),
              child: Text(
                "What training styles do you follow? Select all that apply.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: Theme.of(context).textTheme.headline2?.fontSize),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(padding),
              child: FilterList(),
            ),
            Padding(
                padding: const EdgeInsets.only(
                    top: padding * 10,
                    bottom: padding,
                    left: padding,
                    right: padding),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(180, 60),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const Main(title: 'Workout Log')));
                    },
                    child: Text("Continue",
                        style: TextStyle(
                            fontSize: Theme.of(context)
                                .textTheme
                                .headline2
                                ?.fontSize))))
          ]),
        )));
  }
}
