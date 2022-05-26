import 'package:flutter/material.dart';
import 'package:tasking/controllers/login_page_controller.dart';
import 'package:tasking/widgets/custom_button.dart';
import 'package:tasking/widgets/custom_input.dart';

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
        print(snapshot);
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
                      setContent: (text) => _controller.usuario.setEmail(text),
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
                          _controller.signInUsingEmailPassword(
                              email: _controller.usuario.getEmail(),
                              password: _controller.usuario.getPassword(),
                              context: context);
                        }),
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
