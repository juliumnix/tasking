import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasking/models/grupo_firebase.dart';
import 'package:tasking/models/usuario_firebase.dart';
import 'package:tasking/views/group_page.dart';
import 'package:tasking/widgets/custom_input.dart';
import 'package:tasking/widgets/custom_button.dart';

import '../controllers/db_firestore.dart';
import '../services/auth_service.dart';

class EnterGroupPage extends StatefulWidget {
  const EnterGroupPage({Key? key}) : super(key: key);

  @override
  State<EnterGroupPage> createState() => _EnterGroupPageState();
}

class _EnterGroupPageState extends State<EnterGroupPage> {
  String codigo = "";
  late FirebaseFirestore db;
  late AuthService auth;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: const Color((0xFFFAEB78)),
                child: Center(
                  child: SizedBox(
                    width: (MediaQuery.of(context).size.width * 0.834),
                    height: (MediaQuery.of(context).size.height * 0.209),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              bottom:
                                  (MediaQuery.of(context).size.height * 0.034)),
                          child: CustomInput(
                            hintText: "XDOQPZLW",
                            title: "Código de convite:",
                            setContent: (text) => codigo = text,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              bottom:
                                  (MediaQuery.of(context).size.height * 0.007)),
                          child: CustomButton(
                              title: "Entrar no grupo",
                              onClick: () async {
                                db = DbFirestore.get();
                                final user = db.collection("users").doc(
                                    FirebaseAuth.instance.currentUser?.email);
                                final userSnap = await user.get();
                                final userObject =
                                    UsuarioFirebase.fromJson(userSnap.data()!);
                                final group =
                                    db.collection("groups").doc(codigo);
                                final groupSnap = await group.get();
                                final groupObject =
                                    GrupoFirebase.fromJson(groupSnap.data()!);
                                final newUser = UsuarioFirebase(
                                    apelido: userObject.apelido,
                                    corFavorita: userObject.corFavorita,
                                    email: userObject.email,
                                    codigo: groupObject.codigo);
                                groupObject.participantes?.add(newUser);
                                await user.update(newUser.toJson());
                                await group.update(groupObject.toJson());
                                Navigator.pushReplacementNamed(
                                    context, "/homePageToday");
                              }),
                        ),
                        Center(
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacementNamed(
                                      context, "/createGroup");
                                },
                                child: Text(
                                  "Não tem um código de convite? Criar grupo",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontFamily:
                                          GoogleFonts.comfortaa().fontFamily),
                                ))),
                      ],
                    ),
                  ),
                ))));
  }
}
