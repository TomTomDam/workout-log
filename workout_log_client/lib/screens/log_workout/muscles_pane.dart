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

  selectTableView() {
    setState(() {
      pageSection = const MusclesTableView();
      tableViewIsActive = true;
      heatmapDiagramIsActive = false;
    });
  }

  selectHeatmapView() {
    setState(() {
      pageSection = const MusclesHeatmapDiagram();
      tableViewIsActive = false;
      heatmapDiagramIsActive = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ViewTypeButton(
                title: "Table view",
                isActive: tableViewIsActive,
                callback: selectTableView),
            ViewTypeButton(
                title: "Heatmap diagram",
                isActive: heatmapDiagramIsActive,
                callback: selectHeatmapView)
          ],
        ),
        Padding(padding: padding, child: pageSection),
      ],
    );
  }
}

class ViewTypeButton extends StatelessWidget {
  const ViewTypeButton(
      {Key? key,
      required this.title,
      required this.isActive,
      required this.callback})
      : super(key: key);
  final String title;
  final bool isActive;
  final Function callback;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        child: ElevatedButton(
            onPressed: () => callback(),
            style: ElevatedButton.styleFrom(
                primary: isActive ? Colors.blue : Colors.grey),
            child: Text(title)));
  }
}
