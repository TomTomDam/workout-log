import 'package:flutter/material.dart';

List<String> trainingStylesList = [
  'Strength',
  'Hypertrophy',
  'Powerbuilding',
  'Calisthenics',
  'Flexibility',
  'Endurance'
];
bool isSelected = false;

class FilterList extends StatelessWidget {
  FilterList({Key? key}) : super(key: key);

  final ButtonStyle buttonStyle =
      ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 16));

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
  final String data;
  final int index;

  const FilterListChip({Key? key, required this.data, required this.index})
      : super(key: key);

  @override
  State<FilterListChip> createState() => _FilterListChipState();
}

class _FilterListChipState extends State<FilterListChip> {
  Widget build(BuildContext context) {
    return ChoiceChip(
      labelPadding: const EdgeInsets.all(2.0),
      label: Text(
        widget.data,
        style: Theme.of(context)
            .textTheme
            .bodyText2!
            .copyWith(color: Colors.white, fontSize: 16),
      ),
      selected: isSelected,
      selectedColor: Colors.blue,
      onSelected: (value) {
        setState(() {
          isSelected = value;
        });
      },
      elevation: 1,
      padding: const EdgeInsets.symmetric(horizontal: 10),
    );
  }
}
