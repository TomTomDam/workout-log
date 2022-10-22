import 'package:flutter/material.dart';
import 'package:workout_log/widgets/header/header.dart';
import '../settings/Settings.dart';

class Statistics extends StatelessWidget {
  const Statistics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          Header(
              title: "Statistics",
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
              secondaryButton: null)
        ],
      )),
    );
  }
}
