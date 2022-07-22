import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:tasking/models/usuario_firebase.dart';

class TaskFirebase {
  final String? nome;
  final String? descricao;
  final DateTime? data;
  final TimeOfDay? tempo;
  final UsuarioFirebase? quem;
  final bool? status;

  TaskFirebase({
    this.nome,
    this.descricao,
    this.data,
    this.tempo,
    this.quem,
    this.status,
  });

  TaskFirebase.fromJson(Map<String, dynamic> json)
      : this(
          nome: json['nome'],
          descricao: json['descricao'],
          data: json['data'],
          tempo: TimeOfDay(
              hour: json['tempo']['hour'], minute: json['tempo']['minute']),
          quem: UsuarioFirebase.fromJson(json['quem']),
          status: json['status'],
        );

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'descricao': descricao,
      'data': data,
      'tempo': timeOfDayToFirebase(tempo!),
      'quem': quem?.toJson(),
      'status': status,
    };
  }

  Map timeOfDayToFirebase(TimeOfDay timeOfDay) {
    return {'hour': timeOfDay.hour, 'minute': timeOfDay.minute};
  }
}
