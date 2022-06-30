import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasking/widgets/custom_button.dart';
import 'package:tasking/widgets/custom_input_black.dart';

class FavoriteColorPage extends StatefulWidget {
  const FavoriteColorPage({Key? key}) : super(key: key);

  @override
  State<FavoriteColorPage> createState() => _FavoriteColorPageState();
}

class _FavoriteColorPageState extends State<FavoriteColorPage> {
  final String _color = "";

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
                      "Cor favorita",
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
                  hintText: "Código HEX ex.: FAEB78",
                  title: "Nova cor favorita:",
                  setContent: (text) => _color,
                ),
              ),
              Container(
                child: CustomButton(
                    title: "Salvar",
                    onClick: () {
                      print(_color);
                    }),
              )
            ],
          )),
    );
  }
}
