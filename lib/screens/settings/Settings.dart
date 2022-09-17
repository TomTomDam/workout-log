import 'package:flutter/material.dart';
import 'package:workout_log/main.dart';

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
            Padding(
              padding: const EdgeInsets.all(padding),
              child: Row(children: [
                Expanded(
                    flex: 2,
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size(40, 40),
                              primary: Colors.white),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Main(
                                          title: 'Workout Log',
                                        )));
                          },
                          child: const Icon(
                            Icons.navigate_before_rounded,
                            color: Colors.black,
                          ),
                        ))),
                Expanded(
                  flex: 6,
                  child: Center(
                    child: Text("Settings",
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
              ]),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(
                  height: 0,
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
                    padding: EdgeInsets.only(left: padding),
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
