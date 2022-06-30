import 'package:flutter/material.dart';
import 'package:tasking/views/create_account_page.dart';
import 'package:tasking/views/enter_group_page.dart';
import 'package:tasking/views/create_group_page.dart';
import 'package:tasking/views/favorite_color_page.dart';
import 'package:tasking/views/group_page.dart';
import 'package:tasking/views/login_page.dart';
import 'package:tasking/views/nickname_page.dart';
import 'package:tasking/views/profile_page.dart';
import 'package:tasking/views/settings_page.dart';
import 'package:tasking/views/task_page.dart';
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
      initialRoute: "/",
      routes: {
        "/": (context) => const LoginPage(),
        "/teste": (context) => const TestePage(),
        "/createAccount": (context) => const CreateAccount(),
        "/enterGroup": (context) => const EnterGroupPage(),
        "/createGroup": (context) => const CreateGroupPage(),
        "/settings": (context) => const SettingsPage(),
        "/nickname": (context) => const NicknamePage(),
        "/favoriteColor": (context) => const FavoriteColorPage(),
        "/task": (context) => const TaskPage(),
        "/profile": (context) => const ProfilePage(),
        "/groupSelect": (context) => const GroupPage(),
      },
    );
  }
}
