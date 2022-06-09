import 'package:flutter/material.dart';
import 'package:tasking/views/create_account_page.dart';
import 'package:tasking/views/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tasking',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => LoginPage(),
        "/createAccount": (context) => CreateAccount(),
      },
    );
  }
}
