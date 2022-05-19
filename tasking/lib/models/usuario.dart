class Usuario {
  Usuario._();

  String _email = "";
  String _password = "";

  static Usuario? _instance;

  static Usuario getinstance() {
    if (_instance == null) {
      _instance = Usuario._();
    }
    return _instance!;
  }

  void setEmail(String email) {
    _email = email;
  }

  void setPassword(String password) {
    _password = password;
  }

  String getEmail() {
    return _email;
  }

  String getPassword() {
    return _password;
  }
}
