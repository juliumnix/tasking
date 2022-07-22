import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../models/usuario.dart';
import '../models/usuario_firebase.dart';
import '../services/auth_service.dart';
import 'db_firestore.dart';

class CreateAccountController {
  ValueNotifier<bool> isLoading = ValueNotifier(false);
  Usuario usuario = Usuario.getinstance();
  late FirebaseFirestore db;
  late AuthService auth;

  void navigationBack(BuildContext context) {
    Navigator.pushReplacementNamed(context, "/");
  }

  Future<FirebaseApp> initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  Future<User?> signUpUsingEmailPassword({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    isLoading.value = true;
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
      print('Signed in: ${user?.email}');
      db = DbFirestore.get();
      Random random = Random();
      int length = 6;
      String chars = '0123456789ABCDEF';
      String hex = '';
      while (length-- > 0) hex += chars[(random.nextInt(16)) | 0];
      final users = db.collection("users");
      final newUser = UsuarioFirebase(
          apelido: email.split('@')[0], corFavorita: hex, email: email);
      await users.doc(email).set(newUser.toJson());
      Navigator.pushReplacementNamed(context, "/enterGroup");
    } on FirebaseAuthException catch (e) {
      print(e);
    }
    isLoading.value = false;
    return user;
  }
}
