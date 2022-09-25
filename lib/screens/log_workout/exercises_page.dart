import 'package:flutter/material.dart';

class ExercisesPage extends StatelessWidget {
  const ExercisesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: ExerciseItem());
  }
}

class ExerciseItem extends StatefulWidget {
  const ExerciseItem({Key? key}) : super(key: key);

  final bool isCollapsed = false;

  @override
  State<ExerciseItem> createState() => _ExerciseItemState();
}

class _ExerciseItemState extends State<ExerciseItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.grey),
      padding: const EdgeInsets.all(8.0),
      child: Row(children: [
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
              fontWeight: Theme.of(context).textTheme.headline2?.fontWeight),
        ),
        const Spacer(),
        InkWell(
          onTap: () {},
          child: const Icon(
            Icons.help_outline,
            size: 30,
          ),
        ),
        InkWell(onTap: () {}, child: Icon(Icons.more_vert, size: 30))
      ]),
    );
  }
}
