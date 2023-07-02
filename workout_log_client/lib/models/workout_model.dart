class WorkoutModel {
  final int id;
  final String name;
  final int totalVolume;
  final int duration;
  final String dateCreated;
  final String dateNextScheduled;
  final bool isFavourited;
  final int userId;

  WorkoutModel(
      {required this.id,
      required this.name,
      required this.totalVolume,
      required this.duration,
      required this.dateCreated,
      required this.dateNextScheduled,
      required this.isFavourited,
      required this.userId});

  factory WorkoutModel.fromJson(Map<String, dynamic> json) {
    return WorkoutModel(
        id: json['id'],
        name: json['name'],
        totalVolume: json['totalVolume'],
        duration: json['duration'],
        dateCreated: json['dateCreated'],
        dateNextScheduled: json['dateNextScheduled'],
        isFavourited: json['isFavourited'],
        userId: json['userId']);
  }
}
