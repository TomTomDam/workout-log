import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header(
      {Key? key,
      required this.title,
      required this.navigationButton,
      required this.secondaryButton})
      : super(key: key);
  final String title;
  final ElevatedButton? navigationButton;
  final ElevatedButton? secondaryButton;

  @override
  Widget build(BuildContext context) {
    const double padding = 25;
    const EdgeInsets sectionPadding =
        EdgeInsets.only(top: padding, left: padding, right: padding);

    return Padding(
      padding: sectionPadding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              flex: 2,
              child: Align(
                  alignment: Alignment.topLeft,
                  child: navigationButton ?? Container())),
          Expanded(
            flex: 6,
            child: Center(
              child: Text(title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize:
                          Theme.of(context).textTheme.headline1?.fontSize)),
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(child: secondaryButton ?? Container()),
          )
        ],
      ),
    );
  }
}
