import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasking/models/grupo_firebase.dart';
import 'package:tasking/models/usuario_firebase.dart';
import 'package:tasking/widgets/custom_input.dart';
import 'package:tasking/widgets/custom_button.dart';

import '../controllers/db_firestore.dart';
import '../services/auth_service.dart';

class CreateGroupPage extends StatefulWidget {
  const CreateGroupPage({Key? key}) : super(key: key);

  @override
  State<CreateGroupPage> createState() => _CreateGroupPageState();
}

class _CreateGroupPageState extends State<CreateGroupPage> {
  String _nome = "";
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
                            hintText: "Ex.: Casa dos Nosse",
                            title: "Nome do grupo:",
                            setContent: (text) => _nome = text,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              bottom:
                                  (MediaQuery.of(context).size.height * 0.007)),
                          child: CustomButton(
                              title: "Criar grupo",
                              onClick: () async {
                                db = DbFirestore.get();
                                final usuario = db.collection("users").doc(
                                    FirebaseAuth.instance.currentUser?.email);
                                final docSnap = await usuario.get();
                                final userObject =
                                    UsuarioFirebase.fromJson(docSnap.data()!);
                                final groups = db.collection("groups");
                                Random random = Random();
                                int length = 8;
                                String letras = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
                                String codigo = '';
                                while (length-- > 0) {
                                  codigo += letras[(random.nextInt(26)) | 0];
                                }
                                final newUser = UsuarioFirebase(
                                    apelido: userObject.apelido,
                                    corFavorita: userObject.corFavorita,
                                    email: userObject.email,
                                    codigo: codigo);
                                final newGroup = GrupoFirebase(
                                    codigo: codigo,
                                    nome: _nome,
                                    participantes: [newUser],
                                    administradores: [newUser],
                                    tarefas: []);
                                await usuario.update(newUser.toJson());
                                await groups.doc(codigo).set(newGroup.toJson());
                                Navigator.pushReplacementNamed(
                                    context, "/homePageToday");
                              }),
                        ),
                        Center(
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacementNamed(
                                      context, "/enterGroup");
                                },
                                child: Text(
                                  "Tem um código de convite? Entrar no grupo",
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
