import 'package:flutter/material.dart';
import 'muscles_heatmap_diagram.dart';
import 'muscles_table_view.dart';

class MusclesPane extends StatefulWidget {
  const MusclesPane({Key? key}) : super(key: key);

  @override
  State<MusclesPane> createState() => _MusclesPaneState();
}

class _MusclesPaneState extends State<MusclesPane> {
  EdgeInsets padding = const EdgeInsets.all(25);
  Widget pageSection = const MusclesTableView();
  bool tableViewIsActive = true;
  bool heatmapDiagramIsActive = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
                onTap: () => {
                      setState(() {
                        pageSection = const MusclesTableView();

                        tableViewIsActive = true;
                        heatmapDiagramIsActive = false;
                      })
                    },
                child: ViewTypeButton(
                    title: "Table view", isActive: tableViewIsActive)),
            InkWell(
                onTap: () => {
                      setState(() {
                        pageSection = const MusclesHeatmapDiagram();

                        heatmapDiagramIsActive = true;
                        tableViewIsActive = false;
                      })
                    },
                child: ViewTypeButton(
                    title: "Heatmap diagram",
                    isActive: heatmapDiagramIsActive)),
          ],
        ),
        Padding(padding: padding, child: pageSection),
      ],
    );
  }
}

class ViewTypeButton extends StatelessWidget {
  const ViewTypeButton({Key? key, required this.title, required this.isActive})
      : super(key: key);
  final String title;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                primary: isActive ? Colors.blue : Colors.grey),
            child: Text(title)));
  }
}
