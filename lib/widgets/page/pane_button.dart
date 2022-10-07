import 'package:flutter/material.dart';

class PaneButton extends StatelessWidget {
  const PaneButton({Key? key, required this.title, required this.isActive})
      : super(key: key);
  final String title;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        width: 4,
                        color: isActive ? Colors.blue : Colors.black))),
            child: Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: isActive ? Colors.blue : Colors.black),
            )));
  }
}
