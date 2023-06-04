import 'package:workout_log/enums/equipment_enum.dart';
import 'package:workout_log/enums/muscle_group_enum.dart';

class ExerciseModel {
  bool isSelected;
  final int exerciseId;
  final String name;
  final String musclesWorked;
  final int muscleGroupWorked;
  final int equipmentId;

  ExerciseModel(
      {this.isSelected = false,
      required this.exerciseId,
      required this.name,
      required this.musclesWorked,
      required this.muscleGroupWorked,
      required this.equipmentId});

  factory ExerciseModel.fromJson(Map<String, dynamic> json) {
    return ExerciseModel(
        exerciseId: json['exerciseId'],
        name: json['name'],
        musclesWorked: json['musclesWorked'],
        muscleGroupWorked: json['muscleGroupWorked'],
        equipmentId: json['equipmentId']);
  }
}

final exerciseList = [
  ExerciseModel(
      exerciseId: 1,
      name: "Arnold Press",
      musclesWorked: "Front Delts, Triceps",
      muscleGroupWorked: MuscleGroupEnum.chest.index,
      equipmentId: EquipmentEnum.dumbbell.index),
  ExerciseModel(
      exerciseId: 2,
      name: "Shoulder Press",
      musclesWorked: "Front Delts, Triceps",
      muscleGroupWorked: MuscleGroupEnum.chest.index,
      equipmentId: EquipmentEnum.dumbbell.index),
  ExerciseModel(
      exerciseId: 3,
      name: "Bench Press (Barbell)",
      musclesWorked: "Chest, Front Delts, Triceps",
      muscleGroupWorked: MuscleGroupEnum.chest.index,
      equipmentId: EquipmentEnum.barbell.index),
  ExerciseModel(
      exerciseId: 4,
      name: "Ab Wheel",
      musclesWorked: "Abdominals",
      muscleGroupWorked: MuscleGroupEnum.abs.index,
      equipmentId: EquipmentEnum.other.index),
];
