import 'package:flutter/material.dart';
import 'package:workout_log/screens/log_workout/muscles_heatmap_diagram.dart';
import 'muscles_table_view.dart';

final GlobalKey<_ButtonState> _buttonKey = GlobalKey<_ButtonState>();

class Button extends StatefulWidget {
  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  bool _isSelected = false;

  void _updateSelection(bool isSelected) {
    setState(() {
      _isSelected = isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      key: _buttonKey,
      onPressed: () {
        _updateSelection(true);
        _buttonKey.currentState?._updateSelection(_isSelected);
      },
      child: Text('Button'),
      style: ElevatedButton.styleFrom(
        primary: _isSelected ? Colors.green : Colors.red,
      ),
    );
  }
}

class MusclesPane extends StatefulWidget {
  const MusclesPane({Key? key}) : super(key: key);

  @override
  State<MusclesPane> createState() => _MusclesPaneState();
}

class _MusclesPaneState extends State<MusclesPane> {
  EdgeInsets padding = const EdgeInsets.all(25);
  Widget pageSection = const MusclesTableView();
  // bool tableViewIsActive = true;
  // bool heatmapDiagramIsActive = false;

  bool _isSelected = false;
  void _updateButtonState(bool isSelected) {
    setState(() {
      _isSelected = isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
                onPressed: () {
                  _updateButtonState(true);
                },
                style: ElevatedButton.styleFrom(
                  primary: _isSelected ? Colors.blue : Colors.grey,
                ),
                child: const Text("Table view")),
            ElevatedButton(
                onPressed: () {
                  _updateButtonState(true);
                },
                style: ElevatedButton.styleFrom(
                  primary: _isSelected ? Colors.blue : Colors.grey,
                ),
                child: const Text("Heatmap diagram")),
            // InkWell(
            //     onTap: () => {
            //           setState(() {
            //             pageSection = const MusclesTableView();

            //             tableViewIsActive = true;
            //             heatmapDiagramIsActive = false;
            //           })
            //         },
            //     child: ViewTypeButton(
            //         title: "Table view", isActive: tableViewIsActive)),
            // InkWell(
            //     onTap: () => {
            //           setState(() {
            //             pageSection = const MusclesHeatmapDiagram();

            //             heatmapDiagramIsActive = true;
            //             tableViewIsActive = false;
            //           })
            //         },
            //     child: ViewTypeButton(
            //         title: "Heatmap diagram",
            //         isActive: heatmapDiagramIsActive)),
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
