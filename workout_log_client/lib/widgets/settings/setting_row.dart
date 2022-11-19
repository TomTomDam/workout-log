import 'package:flutter/material.dart';

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
