class ExerciseModel {
  bool isSelected;
  final int? id;
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
