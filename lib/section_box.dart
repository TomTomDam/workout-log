import 'package:flutter/material.dart';

class SectionBox extends StatelessWidget {
  const SectionBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double padding = 25;
    const EdgeInsets containerPadding =
        EdgeInsets.only(top: 10, left: padding, right: padding);
    final double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: containerPadding,
      child: Container(
          width: width - padding,
          height: 90,
          padding: const EdgeInsets.all(8.0),
          decoration: const BoxDecoration(
            color: Colors.grey,
          ),
          child: Container()),
    );
  }
}
