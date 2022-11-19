import 'package:flutter/material.dart';

class TableDataCell extends StatelessWidget {
  const TableDataCell({Key? key, required this.value}) : super(key: key);
  final String value;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(value));
  }
}
