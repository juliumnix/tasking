class TaskTile {
  int id;
  String letter;
  String title;
  double hours;

  TaskTile(
      {required this.id,
      required this.letter,
      required this.hours,
      required this.title});

  static TaskTile fromJson(json) => TaskTile(
      id: json['id'],
      letter: json['letter'],
      hours: json['hours'],
      title: json['title']);
}
