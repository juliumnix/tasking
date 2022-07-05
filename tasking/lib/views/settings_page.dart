import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasking/widgets/custom_person_icon.dart';
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
        child: Center(
            child: Column(
          children: [
            Center(
                child: Container(
                    padding: EdgeInsets.fromLTRB(
                        ((MediaQuery.of(context).size.width) * 0.055),
                        ((MediaQuery.of(context).size.height) * 0.064),
                        ((MediaQuery.of(context).size.width) * 0.055),
                        ((MediaQuery.of(context).size.height) * 0)),
                    margin: EdgeInsets.only(
                        bottom: (MediaQuery.of(context).size.height * 0.012)),
                    child: Text(
                      "Configurações",
                      style: TextStyle(
                          color: const Color((0xFFF4D745)),
                          fontSize: 20,
                          fontFamily: GoogleFonts.comfortaa().fontFamily),
                    ))),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.894,
                    width: MediaQuery.of(context).size.width * 0.889,
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
                    child: Column(children: [
                      Center(
                        child: Container(
                          height: MediaQuery.of(context).size.width * 0.223,
                          width: MediaQuery.of(context).size.width * 0.223,
                          margin: EdgeInsets.only(
                              top: (MediaQuery.of(context).size.height * 0.051),
                              bottom:
                                  (MediaQuery.of(context).size.height * 0.018)),
                          child: GestureDetector(
                              onTap: () => {
                                    Navigator.pushReplacementNamed(
                                        context, "/profile")
                                  },
                              child: CustomPersonIcon(
                                  letter: "M",
                                  width: ((MediaQuery.of(context).size.width) *
                                      0.222),
                                  height: ((MediaQuery.of(context).size.width) *
                                      0.222),
                                  hexCode: "FF0000",
                                  fontSize: 30)),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: (MediaQuery.of(context).size.height * 0.01),
                            bottom:
                                (MediaQuery.of(context).size.height * 0.01)),
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
                            Navigator.pushReplacementNamed(
                                context, "/createGroup");
                          }),
                      CustomSettingsTile(
                          title: "Grupo atual",
                          isInteractive: true,
                          onClick: () {
                            Navigator.pushReplacementNamed(
                                context, "/groupSelect");
                          }),
                      CustomSettingsTile(
                          title: "Apelido",
                          isInteractive: true,
                          onClick: () {
                            Navigator.pushReplacementNamed(
                                context, "/nickname");
                          }),
                      CustomSettingsTile(
                          title: "Cor favorita",
                          isInteractive: true,
                          onClick: () {
                            Navigator.pushReplacementNamed(
                                context, "/favoriteColor");
                          }),
                      Container(
                          margin: EdgeInsets.only(
                              top: (MediaQuery.of(context).size.height * 0.11)),
                          child: GestureDetector(
                            onTap: () {
                              print("Colocar função de deslogar");
                              Navigator.pushReplacementNamed(context, "/");
                            },
                            child: Text(
                              "Sair",
                              style: TextStyle(
                                  color: const Color((0xFFFF0000)),
                                  fontSize: 12,
                                  fontFamily:
                                      GoogleFonts.comfortaa().fontFamily),
                            ),
                          )),
                    ]),
                  ),
                ),
                const CustomBottomNavigationBar(),
              ],
            ),
          ],
        )),
      )),
    );
  }
}
