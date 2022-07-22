import 'package:tasking/models/task_firebase.dart';
import 'package:tasking/models/usuario_firebase.dart';

class GrupoFirebase {
  final String? codigo;
  final String? nome;
  final List<UsuarioFirebase>? participantes;
  final List<UsuarioFirebase>? administradores;
  final List<TaskFirebase>? tarefas;

  GrupoFirebase({
    this.codigo,
    this.nome,
    this.participantes,
    this.administradores,
    this.tarefas,
  });

  GrupoFirebase.fromJson(Map<String, dynamic> json)
      : this(
          codigo: json['codigo'],
          nome: json['nome'],
          participantes: List<UsuarioFirebase>.from(
              json['participantes'].map((p) => UsuarioFirebase.fromJson(p))),
          administradores: List<UsuarioFirebase>.from(
              json['administradores'].map((p) => UsuarioFirebase.fromJson(p))),
          tarefas: List<TaskFirebase>.from(
              json['tarefas'].map((p) => TaskFirebase.fromJson(p))),
        );

  Map<String, dynamic> toJson() {
    return {
      'codigo': codigo,
      'nome': nome,
      'participantes':
          List<dynamic>.from(participantes!.map((p) => p.toJson())),
      'administradores':
          List<dynamic>.from(administradores!.map((p) => p.toJson())),
      'tarefas': List<dynamic>.from(tarefas!.map((p) => p.toJson())),
    };
  }
}
