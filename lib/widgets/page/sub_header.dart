import 'package:flutter/material.dart';

class SubHeader extends StatelessWidget {
  const SubHeader({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    const double padding = 20;
    const EdgeInsets rowPadding =
        EdgeInsets.only(top: padding, left: padding, right: padding);

    return Padding(
      padding: rowPadding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Theme.of(context).textTheme.headline2?.fontSize)),
        ],
      ),
    );
  }
}
