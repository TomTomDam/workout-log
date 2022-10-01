import 'package:flutter/material.dart';
import 'package:workout_log/screens/main.dart';
import '../../widgets/header.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double padding = 25;
    const EdgeInsets settingsPadding = EdgeInsets.only(left: padding);

    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(children: [
            Header(
              title: "Settings",
              navigationButton: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(40, 40), primary: Colors.white),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Main(
                                title: 'Workout Log',
                              )));
                },
                child: const Icon(
                  Icons.navigate_before,
                  color: Colors.black,
                ),
              ),
              secondaryButton: null,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(
                  height: 25,
                  thickness: 2,
                  indent: 25,
                  endIndent: 25,
                ),
                Padding(
                    padding: settingsPadding,
                    child: TextButton(
                      child: const Text(
                        "App settings",
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Settings()));
                      },
                    )),
                Padding(
                    padding: settingsPadding,
                    child: TextButton(
                      child: const Text(
                        "Workout settings",
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Settings()));
                      },
                    )),
                Padding(
                    padding: settingsPadding,
                    child: TextButton(
                      child: const Text(
                        "Personal settings",
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Settings()));
                      },
                    )),
                Padding(
                    padding: settingsPadding,
                    child: TextButton(
                      child: const Text(
                        "Notifications",
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Settings()));
                      },
                    )),
                Padding(
                    padding: settingsPadding,
                    child: TextButton(
                      child: const Text(
                        "Backup and restore data",
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Settings()));
                      },
                    )),
                Padding(
                    padding: settingsPadding,
                    child: TextButton(
                      child: const Text(
                        "About  ",
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Settings()));
                      },
                    )),
                Padding(
                    padding: settingsPadding,
                    child: TextButton(
                      child: const Text(
                        "Reset factory settings",
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Settings()));
                      },
                    )),
                Padding(
                    padding: settingsPadding,
                    child: TextButton(
                      child: const Text(
                        "Delete data",
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Settings()));
                      },
                    )),
              ],
            )
          ]),
        ));
  }
}
