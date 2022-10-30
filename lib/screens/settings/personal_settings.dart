import 'package:flutter/material.dart';
import '../../widgets/filter_list/filter_list.dart';
import '../../widgets/header/header.dart';
import '../../widgets/settings/setting_row.dart';
import '../../widgets/settings/setting_text_value.dart';

class PersonalSettings extends StatelessWidget {
  const PersonalSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              Header(
                  title: "Personal settings",
                  navigationButton: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(40, 40), primary: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.navigate_before,
                      color: Colors.black,
                    ),
                  ),
                  secondaryButton: null),
              const Divider(
                  height: 20, thickness: 2, indent: 20, endIndent: 20),
              const SettingRow(
                  name: "Name", value: SettingTextValue(value: "Thomas Dam")),
              const SettingRow(
                  name: "Gender", value: SettingTextValue(value: "Male")),
              const SettingRow(
                  name: "Bodyweight", value: SettingTextValue(value: "62kg")),
              const SettingRow(
                  name: "Training styles", value: SettingTextValue(value: "")),
              Container(
                  margin: const EdgeInsets.only(top: 10), child: FilterList())
            ],
          ),
        ));
  }
}
