import 'package:flutter/material.dart';
import 'package:tasking/views/create_account_page.dart';
import 'package:tasking/views/enter_group_page.dart';
import 'package:tasking/views/create_group_page.dart';
import 'package:tasking/views/home_page_today.dart';
import 'package:tasking/views/home_page_tomorrow.dart';
import 'package:tasking/views/home_page_yesterday.dart';
import 'package:tasking/views/login_page.dart';
import 'package:tasking/views/teste_page.dart';

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
      initialRoute: "/homePageToday",
      routes: {
        "/": (context) => const LoginPage(),
        "/teste": (context) => const TestePage(),
        "/createAccount": (context) => const CreateAccount(),
        "/enterGroup": (context) => const EnterGroupPage(),
        "/createGroup": (context) => const CreateGroupPage(),
        "/homePageToday": (context) => const HomePageToday(),
        "/homePageyesterday": (context) => const HomePageYesterday(),
        "/homePageTomorrow": (context) => const HomePageTomorrow()
      },
    );
  }
}
