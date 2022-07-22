import 'package:tasking/models/usuario_firebase.dart';

class UsuarioListFirebase {
  final List<UsuarioFirebase>? usuarios;

  UsuarioListFirebase({
    this.usuarios,
  });

  UsuarioListFirebase.fromJson(Map<String, dynamic> json)
      : this(
          usuarios: List<UsuarioFirebase>.from(
              json['usuarios'].map((p) => UsuarioFirebase.fromJson(p))),
        );

  Map<String, dynamic> toJson() {
    return {'usuarios': List<dynamic>.from(usuarios!.map((p) => p.toJson()))};
  }
}
