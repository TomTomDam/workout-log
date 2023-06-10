import 'package:workout_log/enums/equipment_enum.dart';
import 'package:workout_log/enums/muscle_group_enum.dart';

class ExerciseModel {
  bool isSelected;
  final int? exerciseId;
  final String name;
  final bool isCustom;
  final String? instructions;
  final int exerciseTypeId;
  final int equipmentId;
  final int primaryMusclesWorkedId;

  ExerciseModel(
      {this.isSelected = false,
      required this.exerciseId,
      required this.name,
      required this.isCustom,
      required this.instructions,
      required this.exerciseTypeId,
      required this.equipmentId,
      required this.primaryMusclesWorkedId});

  factory ExerciseModel.fromJson(Map<String, dynamic> json) {
    return ExerciseModel(
        exerciseId: json['exerciseId'],
        name: json['name'],
        isCustom: json['isCustom'],
        instructions: json['instructions'],
        exerciseTypeId: json['exerciseTypeId'],
        equipmentId: json['equipmentId'],
        primaryMusclesWorkedId: json['primaryMusclesWorkedId']);
  }
}

final exerciseList = [
  ExerciseModel(
      exerciseId: 1,
      name: "Arnold Press",
      isCustom: false,
      instructions: '',
      exerciseTypeId: 0,
      equipmentId: 0,
      primaryMusclesWorkedId: 0)
];
