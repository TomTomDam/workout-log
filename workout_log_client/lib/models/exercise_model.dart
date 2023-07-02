import 'package:workout_log/enums/muscle_group_enum.dart';
import '../enums/equipment_enum.dart';

class ExerciseModel {
  bool isSelected;
  final int id;
  final String name;
  final bool isCustom;
  final String? instructions;
  final int exerciseTypeId;
  final int equipmentId;
  final int primaryMusclesWorkedId;

  ExerciseModel(
      {this.isSelected = false,
      required this.id,
      required this.name,
      required this.isCustom,
      required this.instructions,
      required this.exerciseTypeId,
      required this.equipmentId,
      required this.primaryMusclesWorkedId});

  factory ExerciseModel.fromJson(Map<String, dynamic> json) {
    return ExerciseModel(
        id: json['id'],
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
      id: 1,
      name: "Arnold Press",
      isCustom: false,
      instructions: "",
      exerciseTypeId: 1,
      equipmentId: EquipmentEnum.dumbbell.index,
      primaryMusclesWorkedId: MuscleGroupEnum.shoulders.index),
  ExerciseModel(
      id: 2,
      name: "Bench Press (Barbell)",
      isCustom: false,
      instructions: "",
      exerciseTypeId: 1,
      equipmentId: EquipmentEnum.barbell.index,
      primaryMusclesWorkedId: MuscleGroupEnum.chest.index),
  ExerciseModel(
      id: 3,
      name: "Ab Wheel",
      isCustom: false,
      instructions: "",
      exerciseTypeId: 1,
      equipmentId: EquipmentEnum.machine.index,
      primaryMusclesWorkedId: MuscleGroupEnum.back.index),
  ExerciseModel(
      id: 4,
      name: "Bicep Curl (Machine)",
      isCustom: false,
      instructions: "",
      exerciseTypeId: 1,
      equipmentId: EquipmentEnum.machine.index,
      primaryMusclesWorkedId: MuscleGroupEnum.biceps.index),
];
