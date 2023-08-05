class WorkoutExerciseModel {
  final String notes;
  final int order;
  final int workoutId;
  final int exerciseId;

  WorkoutExerciseModel(
      {required this.notes,
      required this.order,
      required this.workoutId,
      required this.exerciseId});

  factory WorkoutExerciseModel.fromJson(Map<String, dynamic> json) {
    return WorkoutExerciseModel(
        notes: json['notes'],
        order: json['order'],
        workoutId: json['workoutId'],
        exerciseId: json['exerciseId']);
  }
}
