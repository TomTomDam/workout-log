import 'package:flutter/material.dart';

class NavigateBeforeButton extends StatelessWidget {
  const NavigateBeforeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: const Size(40, 40), primary: Colors.white),
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Icon(
          Icons.navigate_before,
          color: Colors.black,
        ));
  }
}
