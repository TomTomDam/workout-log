import 'package:flutter/material.dart';
import '../../widgets/header/header.dart';

class Exercises extends StatelessWidget {
  const Exercises({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          Header(
              title: "Exercises",
              navigationButton: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(40, 40), primary: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.navigate_before,
                  color: Colors.black,
                ),
              ),
              secondaryButton: null)
        ],
      )),
    );
  }
}
