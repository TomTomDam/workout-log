import 'package:flutter/material.dart';

class HeaderButton extends StatelessWidget {
  const HeaderButton({Key? key, required this.buttonAction}) : super(key: key);
  final Widget buttonAction;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          minimumSize: const Size(40, 40), primary: Colors.white),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => buttonAction));
      },
      child: const Icon(
        Icons.navigate_before_rounded,
        color: Colors.black,
      ),
    );
  }
}
