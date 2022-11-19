import 'package:flutter/material.dart';

class TableHeaderCell extends StatelessWidget {
  const TableHeaderCell({Key? key, required this.value}) : super(key: key);
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Text(
      value.toUpperCase(),
      style: TextStyle(color: Colors.grey.shade700),
    ));
  }
}
