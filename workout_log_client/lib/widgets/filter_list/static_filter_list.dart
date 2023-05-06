import 'package:flutter/material.dart';

List<String> trainingStylesList = ['Strength', 'Hypertrophy', 'Powerbuilding'];
bool isSelected = false;

class StaticFilterList extends StatelessWidget {
  const StaticFilterList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
        spacing: 8,
        children: List.generate(trainingStylesList.length, (index) {
          return FilterListChip(data: trainingStylesList[index], index: index);
        }));
  }
}

class FilterListChip extends StatefulWidget {
  const FilterListChip({Key? key, required this.data, required this.index})
      : super(key: key);
  final String data;
  final int index;

  @override
  State<FilterListChip> createState() => _FilterListChipState();
}

class _FilterListChipState extends State<FilterListChip> {
  @override
  Widget build(BuildContext context) {
    return Chip(
      labelPadding: const EdgeInsets.all(4.0),
      backgroundColor: Colors.blue,
      label: Text(
        widget.data,
        style: Theme.of(context)
            .textTheme
            .bodyText2!
            .copyWith(color: Colors.white, fontSize: 16),
      ),
      elevation: 1,
      padding: const EdgeInsets.symmetric(horizontal: 10),
    );
  }
}
