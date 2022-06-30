import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasking/models/usuario_tile.dart';
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

  @override
  void initState() {
    usuarios = getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 60),
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
                        border: Border.all(color: Colors.grey, width: 3),
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    child: MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
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
                                      onPressedActivate: () {
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
        ),
        const CustomBottomNavigationBar(),
      ],
    ));
  }
}
