import 'package:flutter/material.dart';
import '../../widgets/filter_list/filter_list.dart';
import '../../widgets/header/header.dart';

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

class SettingRow extends StatelessWidget {
  const SettingRow({Key? key, required this.name, required this.value})
      : super(key: key);
  final String name;
  final Widget value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Row(
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name,
                  style: TextStyle(
                      fontSize:
                          Theme.of(context).textTheme.headline2?.fontSize))
            ],
          )),
          Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [value]))
        ],
      ),
    );
  }
}

class SettingTextValue extends StatelessWidget {
  const SettingTextValue({Key? key, required this.value}) : super(key: key);
  final String value;

  @override
  Widget build(BuildContext context) {
    return Text(value,
        style: TextStyle(
            color: Colors.grey.shade500,
            fontSize: Theme.of(context).textTheme.headline2?.fontSize));
  }
}
