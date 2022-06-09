import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../models/usuario.dart';

class CreateAccountController {
  ValueNotifier<bool> isLoading = ValueNotifier(false);
  Usuario usuario = Usuario.getinstance();

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
    } on FirebaseAuthException catch (e) {
      print(e);
    }
    isLoading.value = false;

    return user;
  }
}
