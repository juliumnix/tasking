import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasking/widgets/custom_person_tile.dart';
import 'package:tasking/widgets/custom_settings_tile.dart';
import 'package:tasking/widgets/custom_bottom_navigator.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
          child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: const Color((0xFFFFFFFF)),
        padding: EdgeInsets.fromLTRB(
            ((MediaQuery.of(context).size.width) * 0.055),
            ((MediaQuery.of(context).size.height) * 0.064),
            ((MediaQuery.of(context).size.width) * 0.055),
            ((MediaQuery.of(context).size.height) * 0)),
        child: Center(
            child: Column(
          children: [
            Center(
                child: Container(
                    margin: EdgeInsets.only(
                        bottom: (MediaQuery.of(context).size.height * 0.012)),
                    child: Text(
                      "Configurações",
                      style: TextStyle(
                          color: const Color((0xFFF4D745)),
                          fontSize: 20,
                          fontFamily: GoogleFonts.comfortaa().fontFamily),
                    ))),
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.812,
                width: MediaQuery.of(context).size.width * 0.889,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(22.5),
                    topRight: Radius.circular(22.5),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 2, // changes position of shadow
                    ),
                  ],
                ),
                child: Column(children: [
                  Center(
                    child: Container(
                      height: MediaQuery.of(context).size.width * 0.223,
                      width: MediaQuery.of(context).size.width * 0.223,
                      margin: EdgeInsets.only(
                          top: (MediaQuery.of(context).size.height * 0.051),
                          bottom: (MediaQuery.of(context).size.height * 0.018)),
                      child: CustomPersonTile(
                          letter: "M",
                          width: ((MediaQuery.of(context).size.width) * 0.222),
                          height: ((MediaQuery.of(context).size.width) * 0.222),
                          hexCode: "FF0000",
                          fontSize: 30),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: (MediaQuery.of(context).size.height * 0.01),
                        bottom: (MediaQuery.of(context).size.height * 0.01)),
                    child: Text(
                      "Mateus Nosse",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: GoogleFonts.comfortaa().fontFamily),
                    ),
                  ),
                  CustomSettingsTile(
                      title: "Novo grupo",
                      isInteractive: true,
                      onClick: () {
                        print("Clicou em novo grupo");
                      }),
                  CustomSettingsTile(
                      title: "Grupo atual",
                      isInteractive: true,
                      onClick: () {
                        print("Clicou em grupo atual");
                      }),
                  CustomSettingsTile(
                      title: "Apelido",
                      isInteractive: true,
                      onClick: () {
                        print("Clicou em apelido");
                      }),
                  CustomSettingsTile(
                      title: "Cor favorita",
                      isInteractive: true,
                      onClick: () {
                        print("Clicou em cor favorita");
                      }),
                  Container(
                      margin: EdgeInsets.only(
                          top: (MediaQuery.of(context).size.height * 0.11)),
                      child: GestureDetector(
                        onTap: () {
                          print("Clicou em sair");
                        },
                        child: Text(
                          "Sair",
                          style: TextStyle(
                              color: const Color((0xFFFF0000)),
                              fontSize: 12,
                              fontFamily: GoogleFonts.comfortaa().fontFamily),
                        ),
                      )),
                ]),
              ),
            ),
          ],
        )),
      )),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
