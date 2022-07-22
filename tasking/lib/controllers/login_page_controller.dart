import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tasking/models/usuario.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController {
  ValueNotifier<bool> isLoading = ValueNotifier(false);

  Usuario usuario = Usuario.getinstance();

  Future<FirebaseApp> initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  Future<void> handleSignIn(BuildContext context) async {
    try {
      GoogleSignInAccount? usuario = await GoogleSignIn().signIn();
      print(usuario);
    } catch (error) {
      print(error);
    }
  }

  Future<User?> signInUsingEmailPassword({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    isLoading.value = true;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
      print('Signed in: ${user?.email}');
      Navigator.pushReplacementNamed(context, "/homePageToday");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.red,
            duration: Duration(seconds: 2),
            content: Text('Email não cadastrado no sistema')));
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided.');
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.red,
            duration: Duration(seconds: 2),
            content: Text('Senha incorreta')));
      }
    }
    isLoading.value = false;

    return user;
  }
}
