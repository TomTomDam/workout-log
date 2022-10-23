import 'package:flutter/material.dart';
import 'package:workout_log/screens/onboarding/onboarding_page2.dart';
import 'onboarding_page2.dart';

class OnboardingPage1 extends StatelessWidget {
  const OnboardingPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double padding = 20;

    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Center(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: padding, left: padding, right: padding),
              child: Text("Workout Log",
                  style: TextStyle(
                      fontSize: Theme.of(context).textTheme.headline1?.fontSize,
                      fontWeight:
                          Theme.of(context).textTheme.headline1?.fontWeight)),
            ),
            Padding(
                padding: const EdgeInsets.only(
                    top: padding * 6, left: padding, right: padding),
                child: Text("What is your name?",
                    style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.headline2?.fontSize))),
            const Padding(
                padding: EdgeInsets.only(
                    top: padding, left: padding, right: padding),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: "Full Name"),
                )),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(
                  bottom: padding * 2, left: padding, right: padding),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ButtonTheme(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(180, 60),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12))),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const OnboardingPage2()));
                      },
                      child: Text("Continue",
                          style: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .headline2
                                  ?.fontSize))),
                ),
              ),
            ))
          ]),
        )));
  }
}
