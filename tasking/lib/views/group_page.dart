import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasking/widgets/custom_settings_tile.dart';
import 'package:tasking/widgets/custom_bottom_navigator.dart';

class GroupPage extends StatefulWidget {
  const GroupPage({Key? key}) : super(key: key);

  @override
  State<GroupPage> createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(
              ((MediaQuery.of(context).size.width) * 0.083),
              ((MediaQuery.of(context).size.height) * 0.09),
              ((MediaQuery.of(context).size.width) * 0.083),
              ((MediaQuery.of(context).size.height) * 0.04)),
          child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.arrow_back_ios),
                      Container(
                        padding: EdgeInsets.only(
                            left:
                                ((MediaQuery.of(context).size.width) * 0.047)),
                        child: Text(
                          "Grupo atual",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: GoogleFonts.comfortaa().fontFamily),
                        ),
                      ),
                    ],
                  ),
                  Column(children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(
                          top: (MediaQuery.of(context).size.height * 0.026),
                          bottom: (MediaQuery.of(context).size.height * 0.016)),
                      child: Text(
                        "Grupo atual:",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: GoogleFonts.comfortaa().fontFamily),
                      ),
                    ),
                    CustomSettingsTile(
                        title: "Casa dos Nosse",
                        isInteractive: false,
                        onClick: () {
                          print("Clicou em casa dos Nosse");
                        }),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(
                          top: (MediaQuery.of(context).size.height * 0.026),
                          bottom: (MediaQuery.of(context).size.height * 0.016)),
                      child: Text(
                        "Grupos:",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: GoogleFonts.comfortaa().fontFamily),
                      ),
                    ),
                    CustomSettingsTile(
                        title: "Grupo empresa",
                        isInteractive: true,
                        onClick: () {
                          print("Clicou em grupo empresa");
                        }),
                    CustomSettingsTile(
                        title: "Grupo faculdade",
                        isInteractive: true,
                        onClick: () {
                          print("Clicou em grupo faculdade");
                        }),
                  ]),
                ],
              ))),
    );
  }
}
