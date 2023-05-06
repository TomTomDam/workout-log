import 'package:flutter/material.dart';
import '../log_workout.dart';
import 'muscles_heatmap_diagram.dart';
import 'muscles_table_view.dart';

class MusclesPane extends StatefulWidget {
  const MusclesPane(
      {Key? key, required this.updateViewType, required this.viewType})
      : super(key: key);
  final Function updateViewType;
  final MuscleViewType viewType;

  @override
  State<MusclesPane> createState() => _MusclesPaneState();
}

class _MusclesPaneState extends State<MusclesPane> {
  EdgeInsets padding = const EdgeInsets.all(25);
  Widget pageSection = const MusclesTableView();

  selectTableView() {
    setState(() {
      pageSection = const MusclesTableView();
      widget.updateViewType(MuscleViewType.table);
    });
  }

  selectHeatmapView() {
    setState(() {
      pageSection = const MusclesHeatmapDiagram();
      widget.updateViewType(MuscleViewType.heatmapDiagram);
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
                isActive: widget.viewType == MuscleViewType.table,
                callback: selectTableView),
            ViewTypeButton(
                title: "Heatmap diagram",
                isActive: widget.viewType == MuscleViewType.heatmapDiagram,
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
