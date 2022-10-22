import 'package:flutter/material.dart';

import '../../widgets/header/header.dart';
import '../settings/Settings.dart';

class Calendar extends StatelessWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          Header(
              title: "Calendar",
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
