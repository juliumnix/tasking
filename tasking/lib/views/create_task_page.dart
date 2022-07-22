import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasking/models/grupo_firebase.dart';
import 'package:tasking/models/task_firebase.dart';
import 'package:tasking/models/usuario_firebase.dart';
import 'package:tasking/models/usuario_list_firebase.dart';
import 'package:tasking/services/auth_service.dart';
import 'package:tasking/widgets/custom_button.dart';
import 'package:tasking/widgets/custom_button_status.dart';
import 'package:tasking/widgets/custom_input_resizable.dart';
import 'package:tasking/widgets/custom_tile_person.dart';

import '../controllers/db_firestore.dart';

class CreateTaskPage extends StatefulWidget {
  const CreateTaskPage({Key? key}) : super(key: key);

  @override
  State<CreateTaskPage> createState() => _CreateTaskPageState();
}

class _CreateTaskPageState extends State<CreateTaskPage> {
  String _nome = "";
  String _descricao = "";
  DateTime _data = new DateTime.now();
  TimeOfDay _tempo = new TimeOfDay.now();
  String _nomeUsuario = "";
  late FirebaseFirestore db;
  late AuthService auth;

  Future<List<UsuarioFirebase>> getUsuariosList() async {
    final usersFirebase = db.collection("users");
    final usersDocSnap = await usersFirebase.get();
    final lista = usersDocSnap.docs.toList();
    List<UsuarioFirebase> usuariosList = [];
    for (var element in lista) {
      usuariosList.add(UsuarioFirebase.fromJson(element.data()));
    }
    return usuariosList;
  }

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
                        "Nova tarefa",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: GoogleFonts.comfortaa().fontFamily),
                      ),
                    ),
                  ],
                )),
              ],
            ),
            Container(
                margin: EdgeInsets.only(
                  top: ((MediaQuery.of(context).size.height) * 0.026),
                ),
                child: CustomInputResizable(
                  title: "Nome da tarefa:",
                  initialValue: _nome,
                  enabled: true,
                  lines: 1,
                  maxLength: 40,
                  setContent: (text) => _nome = text,
                )),
            Container(
                child: CustomInputResizable(
              title: "Descrição:",
              initialValue: _descricao,
              enabled: true,
              lines: 3,
              maxLength: 100,
              setContent: (text) => _descricao = text,
            )),
            GestureDetector(
              onTap: () async {
                DateTime? novaData = await showDatePicker(
                    context: context,
                    initialDate: _data,
                    firstDate: DateTime(1920),
                    lastDate: DateTime(2100));
                if (novaData == null) {
                  return;
                }
                setState(() {
                  _data = novaData;
                });

                _tempo = TimeOfDay(
                    hour: TimeOfDay.now().hour, minute: TimeOfDay.now().minute);
                TimeOfDay? novaHora =
                    await showTimePicker(context: context, initialTime: _tempo);
                if (novaHora == null) {
                  return;
                }
                setState(() {
                  _tempo = novaHora;
                });
              },
              child: Container(
                child: CustomInputResizable(
                  title: "Quando:",
                  initialValue:
                      "${_tempo.hour}:${_tempo.minute} ${_tempo.period.name} - ${_data.day}/${_data.month}/${_data.year}",
                  enabled: false,
                  lines: 1,
                  maxLength: 40,
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(
                  top: ((MediaQuery.of(context).size.height) * 0.026),
                ),
                child: CustomInputResizable(
                  title: "Quem:",
                  initialValue: _nomeUsuario,
                  enabled: true,
                  lines: 1,
                  maxLength: 40,
                  setContent: (text) => _nomeUsuario = text,
                )),
            Container(
              margin: EdgeInsets.only(
                top: ((MediaQuery.of(context).size.height) * 0.026),
              ),
              child: CustomButton(
                  title: "Criar tarefa",
                  onClick: () async {
                    db = DbFirestore.get();
                    final user = db
                        .collection("users")
                        .where("apelido", isEqualTo: _nomeUsuario);
                    final userSnap = await user.get();
                    final userDoc = userSnap.docs.first;
                    final userObject = UsuarioFirebase.fromJson(userDoc.data());
                    final group =
                        db.collection("groups").doc(userObject.codigo);
                    final groupSnap = await group.get();
                    final groupObject =
                        GrupoFirebase.fromJson(groupSnap.data()!);
                    final tasks = db.collection("tasks");
                    final task = TaskFirebase(
                        nome: _nome,
                        descricao: _descricao,
                        data: _data,
                        tempo: _tempo,
                        quem: userObject,
                        status: false);
                    tasks.add(task.toJson());
                    groupObject.tarefas?.add(task);
                    await group.update(groupObject.toJson());
                    Navigator.pushReplacementNamed(context, "/homePageToday");
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
