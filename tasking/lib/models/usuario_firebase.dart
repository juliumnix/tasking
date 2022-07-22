class UsuarioFirebase {
  final String? apelido;
  final String? corFavorita;
  final String? email;
  final String? codigo;

  UsuarioFirebase({
    this.apelido,
    this.corFavorita,
    this.email,
    this.codigo,
  });

  UsuarioFirebase.fromJson(Map<String, dynamic> json)
      : this(
          apelido: json['apelido'],
          corFavorita: json['corFavorita'],
          email: json['email'],
          codigo: json['codigo'],
        );

  Map<String, dynamic> toJson() {
    return {
      'apelido': apelido,
      'corFavorita': corFavorita,
      'email': email,
      'codigo': codigo,
    };
  }
}
