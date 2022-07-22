import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasking/controllers/db_firestore.dart';
import 'package:tasking/models/usuario_firebase.dart';
import 'package:tasking/widgets/custom_bottom_navigator.dart';
import 'package:tasking/widgets/custom_tile_person.dart';

class ParticipantPage extends StatefulWidget {
  const ParticipantPage({Key? key}) : super(key: key);

  @override
  State<ParticipantPage> createState() => _ParticipantPageState();
}

class _ParticipantPageState extends State<ParticipantPage> {
  late Future<List<UsuarioFirebase>> usuarios;
  List<UsuarioFirebase> usuariosRemoverEssaLista =
      metodoTesteRemoverJuntoComALista();

  static List<UsuarioFirebase> metodoTesteRemoverJuntoComALista() {
    List<UsuarioFirebase> usuarios = [];
    final mateus = UsuarioFirebase(
        apelido: "Mateus",
        corFavorita: "F6FCBC",
        codigo: "JMVZUUHB",
        email: "mateus@gmail.com");
    final julio = UsuarioFirebase(
        apelido: "Julio",
        corFavorita: "576839",
        codigo: "JMVZUUHB",
        email: "julio@gmail.com");
    usuarios.add(mateus);
    usuarios.add(julio);
    return usuarios;
  }

  static Future<List<UsuarioFirebase>> getUsuarios() async {
    FirebaseFirestore db = DbFirestore.get();
    final user = db.collection("users");
    final userSnap = await user.get();
    final List<UsuarioFirebase> usuarios = [];
    userSnap.docs.forEach((element) {
      UsuarioFirebase.fromJson(element.data());
    });
    return usuarios;
  }

  @override
  void initState() {
    usuarios = getUsuarios();
    print(usuarios);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              padding: EdgeInsets.only(
                  left: ((MediaQuery.of(context).size.width) * 0.055),
                  right: ((MediaQuery.of(context).size.width) * 0.055)),
              // top: ((MediaQuery.of(context).size.height) * 0.058)),
              margin: EdgeInsets.only(
                  bottom: (MediaQuery.of(context).size.height * 0.07)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Participantes",
                    style: TextStyle(
                        color: const Color(0xFFF4D745),
                        fontFamily: GoogleFonts.comfortaa().fontFamily,
                        fontSize: 20),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(
                          top: (MediaQuery.of(context).size.height * 0.0120)),
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
                              top: ((MediaQuery.of(context).size.height) *
                                  0.027),
                              left: ((MediaQuery.of(context).size.width) *
                                  0.0277),
                              right: ((MediaQuery.of(context).size.width) *
                                  0.0277)),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    bottom:
                                        (MediaQuery.of(context).size.height *
                                            0.0201)),
                                child: Text(
                                  "${usuariosRemoverEssaLista.length} participantes",
                                  style: TextStyle(
                                      color: const Color(0xFFF4D745),
                                      fontFamily:
                                          GoogleFonts.comfortaa().fontFamily),
                                ),
                              ),
                              Expanded(
                                child: ListView.builder(
                                  itemCount: usuariosRemoverEssaLista.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      margin: EdgeInsets.only(
                                          top: (MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.0120)),
                                      child: CustomTilePerson(
                                          title: usuariosRemoverEssaLista[index]
                                              .apelido!,
                                          letter:
                                              usuariosRemoverEssaLista[index]
                                                  .apelido![0],
                                          hexCode:
                                              usuariosRemoverEssaLista[index]
                                                  .corFavorita!),
                                    );
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
              valorRecebido: 1,
            ),
          ],
        ),
      ),
    );
  }
}
