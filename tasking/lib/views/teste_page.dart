import 'package:flutter/material.dart';
import 'package:tasking/widgets/custom_bottom_navigator.dart';

class TestePage extends StatefulWidget {
  const TestePage({Key? key}) : super(key: key);

  @override
  State<TestePage> createState() => _TestePageState();
}

class _TestePageState extends State<TestePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CustomBottomNavigationBar()),
    );
  }
}
