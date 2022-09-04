import 'package:flutter/material.dart';

class OnboardingPage1 extends StatelessWidget {
  const OnboardingPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double padding = 25;

    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Center(
          child: Column(children: [
            Padding(
              padding:
                  EdgeInsets.only(top: padding, left: padding, right: padding),
              child: Text("Workout Log",
                  style: TextStyle(
                      fontSize:
                          Theme.of(context).textTheme.headline1?.fontSize)),
            )
          ]),
        )));
  }
}
