import 'package:flutter/material.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Expanded(
          child: Container(
              margin: const EdgeInsets.only(top: 8.0),
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  color: Colors.white,
                  shape: BoxShape.circle),
              child: const Icon(Icons.fitness_center)),
        ),
        Expanded(
          child: Container(
              margin: const EdgeInsets.only(top: 8.0),
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  color: Colors.white,
                  shape: BoxShape.circle),
              child: const Icon(Icons.timer)),
        ),
      ]),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 8.0),
                child: const Text("3240 kg")),
          ),
          Expanded(
            child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(
                  top: 8.0,
                ),
                child: const Text("1 hr 30 mins")),
          )
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 8.0),
                child: const Text("Total volume",
                    style: TextStyle(fontWeight: FontWeight.bold))),
          ),
          Expanded(
            child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 8.0),
                child: const Text("Duration",
                    style: TextStyle(fontWeight: FontWeight.bold))),
          )
        ],
      )
    ]);
  }
}
