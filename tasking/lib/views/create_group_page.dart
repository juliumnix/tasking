import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasking/widgets/custom_input.dart';
import 'package:tasking/widgets/custom_button.dart';

class CreateGroupPage extends StatefulWidget {
  const CreateGroupPage({Key? key}) : super(key: key);

  @override
  State<CreateGroupPage> createState() => _CreateGroupPageState();
}

class _CreateGroupPageState extends State<CreateGroupPage> {
  final String _codigo = "";

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
                            setContent: (text) => _codigo,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              bottom:
                                  (MediaQuery.of(context).size.height * 0.007)),
                          child: CustomButton(
                              title: "Criar grupo",
                              onClick: () {
                                print(_codigo);
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
