import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasking/widgets/custom_button.dart';
import 'package:tasking/widgets/custom_input_black.dart';
import 'package:tasking/widgets/custom_person_tile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(
              ((MediaQuery.of(context).size.width) * 0.083),
              ((MediaQuery.of(context).size.height) * 0.09),
              ((MediaQuery.of(context).size.width) * 0.083),
              ((MediaQuery.of(context).size.height) * 0.04)),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(Icons.arrow_back_ios),
                  Container(
                    padding: EdgeInsets.only(
                        left: ((MediaQuery.of(context).size.width) * 0.047)),
                    child: Text(
                      "Perfil",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: GoogleFonts.comfortaa().fontFamily),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(
                    top: (MediaQuery.of(context).size.height * 0.026),
                    bottom: (MediaQuery.of(context).size.height * 0.016)),
                child: CustomPersonTile(
                    letter: "M",
                    width: ((MediaQuery.of(context).size.width) * 0.416),
                    height: ((MediaQuery.of(context).size.width) * 0.416),
                    hexCode: "FF0000",
                    fontSize: 60),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Mateus Nosse",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontFamily: GoogleFonts.comfortaa().fontFamily),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: (MediaQuery.of(context).size.height * 0.016),
                    bottom: (MediaQuery.of(context).size.height * 0.35)),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Administrador",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: GoogleFonts.comfortaa().fontFamily),
                ),
              ),
              Container(
                child: CustomButton(
                    title: "Remover",
                    onClick: () {
                      print("");
                    }),
              )
            ],
          )),
    );
  }
}
