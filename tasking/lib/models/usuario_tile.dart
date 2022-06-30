class UsuarioTile {
  int id;
  String url;
  String title;
  double hours;

  UsuarioTile(
      {required this.id,
      required this.url,
      required this.hours,
      required this.title});

  static UsuarioTile fromJson(json) => UsuarioTile(
      id: json['id'],
      url: json['url'],
      hours: json['hours'],
      title: json['title']);
}
