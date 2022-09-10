import 'package:flutter/material.dart';

List<String> trainingStylesList = [
  'Strength',
  'Hypertrophy',
  'Powerbuilding',
  'Calisthenics',
  'Flexibility',
  'Endurance'
];
String? selectedTrainingStyle = trainingStylesList[0];

class FilterList extends StatelessWidget {
  const FilterList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [],
    );
  }
}
