import 'package:flutter/material.dart';

class MusclesPage extends StatelessWidget {
  const MusclesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            ViewTypeButton(title: "Table view"),
            ViewTypeButton(title: "Heatmap diagram"),
          ],
        )
      ],
    );
  }
}

class ViewTypeButton extends StatelessWidget {
  const ViewTypeButton({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(primary: Colors.grey),
            child: Text(title)));
  }
}
