class MuscleGroupModel {
  final String name;

  MuscleGroupModel({required this.name});

  factory MuscleGroupModel.fromJson(Map<String, dynamic> json) {
    return MuscleGroupModel(name: json['name']);
  }
}
