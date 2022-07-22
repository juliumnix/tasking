import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasking/widgets/custom_button_status.dart';
import 'package:tasking/widgets/custom_input_resizable.dart';
import 'package:tasking/widgets/custom_tile_person.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  bool _edicaoAtiva = false;
  String _descricao =
      "Deve passar pano nos móveis, limpar as janelas, varrer o chão e organizar a bagunça.";
  String _data = "10:00 AM - 09/05/2022";

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, "/homePageToday");
                        },
                        child: Icon(Icons.arrow_back_ios),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          left: ((MediaQuery.of(context).size.width) * 0.047),
                        ),
                        child: Text(
                          "Limpar a casa",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: GoogleFonts.comfortaa().fontFamily),
                        ),
                      ),
                    ],
                  )),
                  GestureDetector(
                      onTap: () => {
                            setState(() {
                              _edicaoAtiva = !_edicaoAtiva;
                            })
                          },
                      child: Icon(Icons.edit_outlined)),
                ],
              ),
              Container(
                  margin: EdgeInsets.only(
                    top: ((MediaQuery.of(context).size.height) * 0.026),
                  ),
                  child: CustomInputResizable(
                    title: "Descrição:",
                    initialValue: _descricao,
                    enabled: _edicaoAtiva,
                    lines: 3,
                    maxLength: 100,
                    setContent: (text) => _descricao,
                  )),
              Container(
                  child: CustomInputResizable(
                title: "Quando:",
                initialValue: _data,
                enabled: _edicaoAtiva,
                lines: 1,
                maxLength: 40,
                setContent: (text) => _data,
              )),
              Container(
                margin: EdgeInsets.only(
                  bottom: ((MediaQuery.of(context).size.height) * 0.03),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Quem:',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: GoogleFonts.comfortaa().fontFamily,
                      ),
                    ),
                    Container(
                        height: (MediaQuery.of(context).size.height) * 0.02),
                    CustomTilePerson(
                      title: 'Mateus Nosse',
                      hexCode: 'FF0000',
                      letter: 'M',
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Status:',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: GoogleFonts.comfortaa().fontFamily,
                      ),
                    ),
                    Container(
                      // height: (MediaQuery.of(context).size.height) * 0.02,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: CustomButtonStatus(title: "Teste"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
