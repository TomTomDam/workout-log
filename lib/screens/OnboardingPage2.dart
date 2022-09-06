import 'package:flutter/material.dart';
import '../DropdownButtonApp.dart';

class OnboardingPage2 extends StatelessWidget {
  const OnboardingPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double padding = 25;

    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Center(
          child: Column(children: [
            Padding(
                padding: EdgeInsets.all(padding),
                child: Text("Select your gender.",
                    style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.headline2?.fontSize))),
            const Padding(
              padding:
                  EdgeInsets.only(top: padding, left: padding, right: padding),
            )
          ]),
        )));
  }
}
