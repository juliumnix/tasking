import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasking/controllers/login_page_controller.dart';
import 'package:tasking/widgets/custom_button.dart';
import 'package:tasking/widgets/custom_input.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController _controller = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: _controller.initializeFirebase(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: const Color(0xFFFAEB78),
              child: SizedBox.expand(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                          child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.3,
                              width: MediaQuery.of(context).size.width,
                              child: Image.asset("assets/tasking-logo.png"))),
                      CustomInput(
                        hintText: "mateus@email.com",
                        title: "Login",
                        setContent: (text) =>
                            _controller.usuario.setEmail(text),
                      ),
                      Container(height: 10),
                      CustomInput(
                        hintText: "********",
                        title: "Senha",
                        isPassword: true,
                        setContent: (text) =>
                            _controller.usuario.setPassword(text),
                      ),
                      Container(height: 36),
                      CustomButton(
                          title: "Entrar",
                          onClick: () {
                            print("cloicou");
                            _controller.signInUsingEmailPassword(
                                email: _controller.usuario.getEmail(),
                                password: _controller.usuario.getPassword(),
                                context: context);
                          }),
                      Container(height: 10),
                      Center(
                          child: Text(
                        "Ou",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: GoogleFonts.comfortaa().fontFamily),
                      )),
                      Container(height: 10),
                      //TO-DO fazer botão do google e colocar a função
                      CustomButton(
                          title: "google",
                          onClick: () {
                            _controller.handleSignIn(context);
                          }),
                      Container(height: 10),
                      Center(
                          child: GestureDetector(
                              onTap: () {
                                Navigator.pushReplacementNamed(
                                    context, "/createAccount");
                              },
                              child: Text(
                                "Não tem uma conta? Crie uma aqui",
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
