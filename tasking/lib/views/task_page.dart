import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasking/widgets/custom_button.dart';
import 'package:tasking/widgets/custom_input_black.dart';
import 'package:tasking/widgets/custom_input_resizable.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  final String _descricao = "";
  final String _data = "";

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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      child: Row(
                    children: [
                      Icon(Icons.arrow_back_ios),
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
                  Icon(Icons.edit_outlined),
                ],
              ),
              Container(
                  child: CustomInputResizable(
                title: "Descrição",
                initialValue:
                    "Deve passar pano nos móveis, limpar as janelas, varrer o chão e organizar a bagunça.",
                enabled: false,
                lines: 3,
                maxLength: 100,
                setContent: (text) => _descricao,
              )),
              Container(
                  child: CustomInputResizable(
                title: "Quando",
                initialValue: "10:00 AM - 09/05/2022",
                enabled: true,
                lines: 1,
                maxLength: 40,
                setContent: (text) => _data,
              )),
            ],
          )),
    );
  }
}
