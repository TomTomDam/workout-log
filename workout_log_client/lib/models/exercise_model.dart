class ExerciseModel {
  final String name;
  final String musclesWorked;

  const ExerciseModel({required this.name, required this.musclesWorked});
}

const exerciseList = [
  ExerciseModel(name: "Arnold Press", musclesWorked: "Front Delts, Triceps"),
  ExerciseModel(name: "Ab Wheel", musclesWorked: "Abdominals"),
  ExerciseModel(
      name: "Bench Press (Barbell)",
      musclesWorked: "Chest, Front Delts, Triceps")
];
