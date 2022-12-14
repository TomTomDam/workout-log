import 'package:flutter/material.dart';
import 'package:workout_log/screens/settings/personal_settings.dart';
import 'package:workout_log/widgets/header/navigate_before_button.dart';
import '../../widgets/header/header.dart';
import 'app_settings.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double padding = 20;
    const EdgeInsets settingsPadding = EdgeInsets.only(left: padding);

    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(children: [
            const Header(
              title: "Settings",
              navigationButton: NavigateBeforeButton(),
              secondaryButton: null,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(
                    height: 20, thickness: 2, indent: 20, endIndent: 20),
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
                                builder: (context) => const AppSettings()));
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
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const Settings()));
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
                                builder: (context) =>
                                    const PersonalSettings()));
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
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const Settings()));
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
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const Settings()));
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
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const Settings()));
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
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const Settings()));
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
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const Settings()));
                      },
                    )),
              ],
            )
          ]),
        ));
  }
}
