import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasking/widgets/custom_input.dart';
import 'package:tasking/widgets/custom_button.dart';

class EnterGroupPage extends StatefulWidget {
  const EnterGroupPage({Key? key}) : super(key: key);

  @override
  State<EnterGroupPage> createState() => _EnterGroupPageState();
}

class _EnterGroupPageState extends State<EnterGroupPage> {
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
                            hintText: "XDOQPZLW",
                            title: "Código de convite:",
                            setContent: (text) => _codigo,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              bottom:
                                  (MediaQuery.of(context).size.height * 0.007)),
                          child: CustomButton(
                              title: "Entrar no grupo",
                              onClick: () {
                                print(_codigo);
                              }),
                        ),
                        Center(
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacementNamed(
                                      context, "/createGroup");
                                },
                                child: Text(
                                  "Não tem um código de convite? Criar grupo",
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
