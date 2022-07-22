import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasking/controllers/create_account_controller.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_input.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final CreateAccountController _controller = CreateAccountController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: _controller.initializeFirebase(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Container(
            color: const Color(0xFFFAEB78),
            child: SizedBox.expand(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomInput(
                      hintText: "mateus@email.com",
                      title: "Login",
                      setContent: (text) =>
                          {_controller.usuario.setEmail(text)},
                    ),
                    Container(
                        height: MediaQuery.of(context).size.height * 0.01),
                    CustomInput(
                      hintText: "********",
                      title: "Senha",
                      isPassword: true,
                      setContent: (text) =>
                          {_controller.usuario.setPassword(text)},
                    ),
                    Container(
                        height: MediaQuery.of(context).size.height * 0.034),
                    CustomButton(
                        title: "Criar",
                        onClick: () {
                          _controller.signUpUsingEmailPassword(
                              email: _controller.usuario.getEmail(),
                              password: _controller.usuario.getPassword(),
                              context: context);
                        }),
                    Container(
                        height: MediaQuery.of(context).size.height * 0.008),
                    Center(
                        child: GestureDetector(
                            onTap: () {
                              _controller.navigationBack(context);
                            },
                            child: Text(
                              "Já possui uma conta? Fazer login",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontFamily:
                                      GoogleFonts.comfortaa().fontFamily),
                            ))),
                  ],
                ),
              ),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    ));
  }
}
