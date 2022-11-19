import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:workout_log/screens/onboarding/onboarding_page3.dart';

List<String> genderList = ['Male', 'Female', 'Prefer not to say'];
String? selectedGender = genderList[0];

List<String> weightUnitList = ['kg', 'lbs'];
String? selectedWeightUnit = weightUnitList[0];

class OnboardingPage2 extends StatefulWidget {
  const OnboardingPage2({Key? key}) : super(key: key);

  @override
  State<OnboardingPage2> createState() => _OnboardingPage2State();
}

class _OnboardingPage2State extends State<OnboardingPage2> {
  @override
  Widget build(BuildContext context) {
    const double padding = 20;

    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Center(
          child: Column(children: [
            Padding(
                padding: const EdgeInsets.all(padding),
                child: Text("Select your gender.",
                    style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.headline2?.fontSize))),
            SizedBox(
              width: 200,
              child: Padding(
                padding: const EdgeInsets.only(left: padding, right: padding),
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: selectedGender,
                  items: genderList
                      .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(item,
                              style: TextStyle(
                                  fontSize: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.fontSize))))
                      .toList(),
                  onChanged: (item) => setState(() => selectedGender = item),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(
                    top: padding * 3, left: padding, right: padding),
                child: Text("Enter your bodyweight.",
                    style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.headline2?.fontSize))),
            Padding(
                padding: const EdgeInsets.all(padding),
                child: Row(
                  children: [
                    SizedBox(
                      width: 200,
                      child: Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: padding),
                          child: TextField(
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Bodyweight'))),
                    ),
                    SizedBox(
                        width: 100,
                        child: DropdownButton<String>(
                          isExpanded: true,
                          value: selectedWeightUnit,
                          items: weightUnitList
                              .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(item,
                                      style: TextStyle(
                                          fontSize: Theme.of(context)
                                              .textTheme
                                              .bodyText1
                                              ?.fontSize))))
                              .toList(),
                          onChanged: (item) =>
                              setState(() => selectedWeightUnit = item),
                        ))
                  ],
                )),
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
                              builder: (context) => const OnboardingPage3()));
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
