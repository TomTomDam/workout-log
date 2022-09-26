import 'package:flutter/material.dart';

class ExercisesPage extends StatelessWidget {
  const ExercisesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> exerciseItems = [
      const ExerciseItem(
        isCollapsed: true,
      ),
      const ExerciseItem(isCollapsed: false)
    ];

    return ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: exerciseItems);
  }
}

class ExerciseItem extends StatefulWidget {
  const ExerciseItem({Key? key, required this.isCollapsed}) : super(key: key);

  final bool isCollapsed;

  @override
  State<ExerciseItem> createState() => _ExerciseItemState();
}

class _ExerciseItemState extends State<ExerciseItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.grey),
      margin: const EdgeInsets.only(bottom: 16.0),
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(children: [
            InkWell(
              onTap: () {},
              child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: const Icon(Icons.fitness_center, size: 30)),
            ),
            Text(
              "Pull up",
              style: TextStyle(
                  fontSize: Theme.of(context).textTheme.headline2?.fontSize,
                  fontWeight:
                      Theme.of(context).textTheme.headline2?.fontWeight),
            ),
            const Spacer(),
            InkWell(
              onTap: () {},
              child: const Icon(
                Icons.help_outline,
                size: 30,
              ),
            ),
            InkWell(onTap: () {}, child: const Icon(Icons.more_vert, size: 30))
          ]),
          Container(
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                color: Colors.white, border: Border.all(color: Colors.black)),
            child: Container(
              margin: const EdgeInsets.all(8.0),
              child: Row(children: [
                Container(
                    margin: const EdgeInsets.only(right: 8.0),
                    child: const Icon(Icons.star, size: 30)),
                Container(
                    margin: const EdgeInsets.only(right: 16.0),
                    child: const Text("Best Set Volume")),
                Container(
                    margin: const EdgeInsets.only(right: 16.0),
                    child: Text(
                      "28kg x 12",
                      style: TextStyle(color: Colors.grey.shade600),
                    ))
              ]),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(bottom: 8.0, left: 8.0, right: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: const EdgeInsets.symmetric(vertical: 4.0),
                    child: const Text("Notes",
                        style: TextStyle(color: Colors.white))),
                Container(
                    margin: const EdgeInsets.only(bottom: 4.0),
                    child: const Text("Lightweight baby!"))
              ],
            ),
          ),
          //Table
          Container()
        ],
      ),
    );
  }
}
