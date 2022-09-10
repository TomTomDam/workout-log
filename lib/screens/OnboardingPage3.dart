import 'package:flutter/material.dart';

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
            )
          ]),
        )));
  }
}
