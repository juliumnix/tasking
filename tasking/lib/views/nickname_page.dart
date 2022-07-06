import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasking/widgets/custom_button.dart';
import 'package:tasking/widgets/custom_input_black.dart';

class NicknamePage extends StatefulWidget {
  const NicknamePage({Key? key}) : super(key: key);

  @override
  State<NicknamePage> createState() => _NicknamePageState();
}

class _NicknamePageState extends State<NicknamePage> {
  String _apelido = "";

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
                  GestureDetector(
                      onTap: () => {
                            Navigator.pushReplacementNamed(context, "/settings")
                          },
                      child: Icon(Icons.arrow_back_ios)),
                  Container(
                    padding: EdgeInsets.only(
                        left: ((MediaQuery.of(context).size.width) * 0.047)),
                    child: Text(
                      "Apelido",
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
                    top: (MediaQuery.of(context).size.height * 0.335),
                    bottom: (MediaQuery.of(context).size.height * 0.034)),
                child: CustomInputBlack(
                  hintText: "Mateus Nosse",
                  title: "Novo apelido:",
                  setContent: (text) => _apelido = text,
                ),
              ),
              Container(
                child: CustomButton(
                    title: "Salvar",
                    onClick: () {
                      print(_apelido);
                    }),
              )
            ],
          )),
    );
  }
}
