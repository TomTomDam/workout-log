import 'package:flutter/material.dart';

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
