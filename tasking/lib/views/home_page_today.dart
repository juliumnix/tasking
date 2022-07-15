import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasking/controllers/db_firestore.dart';
import 'package:tasking/models/usuario_tile.dart';
import 'package:tasking/services/auth_service.dart';
import 'package:tasking/widgets/custom_bottom_navigator.dart';
import 'package:tasking/widgets/custom_tile.dart';
import 'package:tasking/widgets/custom_top_navigator.dart';

class HomePageToday extends StatefulWidget {
  const HomePageToday({Key? key}) : super(key: key);

  @override
  State<HomePageToday> createState() => _HomePageTodayState();
}

class _HomePageTodayState extends State<HomePageToday> {
  List<UsuarioTile> usuarios = [];
  late FirebaseFirestore db;
  late AuthService auth;
  int _numeroDeTarefas = 6;

  static List<UsuarioTile> getUser() {
    const data = [
      {
        "id": 1,
        "url": "https://picsum.photos/512/512",
        "title": "Titulo 1",
        "hours": 11.00
      },
      {
        "id": 2,
        "url": "https://picsum.photos/512/512",
        "title": "Titulo 2",
        "hours": 22.00
      },
      {
        "id": 3,
        "url": "https://picsum.photos/512/512",
        "title": "Titulo 3",
        "hours": 13.50
      },
      {
        "id": 3,
        "url": "https://picsum.photos/512/512",
        "title": "Titulo 3",
        "hours": 13.50
      },
      {
        "id": 3,
        "url": "https://picsum.photos/512/512",
        "title": "Titulo 3",
        "hours": 13.50
      },
      {
        "id": 3,
        "url": "https://picsum.photos/512/512",
        "title": "Titulo 3",
        "hours": 13.50
      },
      {
        "id": 3,
        "url": "https://picsum.photos/512/512",
        "title": "Titulo 3",
        "hours": 13.50
      },
      {
        "id": 3,
        "url": "https://picsum.photos/512/512",
        "title": "Titulo 3",
        "hours": 13.50
      },
    ];
    return data.map<UsuarioTile>(UsuarioTile.fromJson).toList();
  }

  _startFirebase() {
    db = DbFirestore.get();
  }

  _testeFirebase() async {
    await db.collection("teste/0987/teste").doc("usuarioTeste").set({
      "valor_1": 1234,
    });
  }

  @override
  void initState() {
    usuarios = getUser();
    _startFirebase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            padding: EdgeInsets.only(
                left: ((MediaQuery.of(context).size.width) * 0.055),
                right: ((MediaQuery.of(context).size.width) * 0.055),
                top: ((MediaQuery.of(context).size.height) * 0.058)),
            margin: EdgeInsets.only(
                bottom: (MediaQuery.of(context).size.height * 0.07)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTopNavigator(
                    valorRecebido: 2,
                    onPressToday: () => Navigator.pushReplacementNamed(
                        context, "/homePageToday"),
                    onPressTomorrow: () => Navigator.pushReplacementNamed(
                        context, "/homePageTomorrow"),
                    onPressWesterday: () => Navigator.pushReplacementNamed(
                        context, "/homePageyesterday")),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                            ((MediaQuery.of(context).size.width) * 0.062)),
                        topRight: Radius.circular(
                            ((MediaQuery.of(context).size.width) * 0.062)),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 2, // changes position of shadow
                        ),
                      ],
                    ),
                    child: MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: ((MediaQuery.of(context).size.width) * 0.027)),
                        child: Column(
                          children: [
                            Text(
                              "Restam $_numeroDeTarefas tarefas a serem finalizadas",
                              style: TextStyle(
                                  color: const Color(0xFFF4D745),
                                  fontFamily:
                                      GoogleFonts.comfortaa().fontFamily),
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemCount: usuarios.length,
                                itemBuilder: (context, index) {
                                  return CustomTile(
                                      verticalPadding:
                                          ((MediaQuery.of(context).size.width) *
                                              0.027),
                                      horizontalPadding:
                                          ((MediaQuery.of(context).size.width) *
                                              0.027),
                                      onPressedActivate: () async {
                                        await _testeFirebase();
                                        setState(() {
                                          _numeroDeTarefas -= 1;
                                        });
                                      },
                                      onPressedDesactivate: () {
                                        setState(() {
                                          _numeroDeTarefas =
                                              _numeroDeTarefas + 1;
                                        });
                                      },
                                      hasButton: true,
                                      title: usuarios[index].title,
                                      hours: usuarios[index].hours,
                                      url: usuarios[index].url);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const CustomBottomNavigationBar(
            valorRecebido: 2,
          ),
        ],
      ),
    );
  }
}
