import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  bool _hoverFirst = false;
  bool _hoverSecond = false;
  bool _hoverThird = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Material(
          child: InkWell(
            onHover: (value) {
              setState(() {
                _hoverFirst = value;
              });
            },
            onTap: () {
              setState(() {
                _hoverFirst = true;
                _hoverSecond = false;
                _hoverThird = false;
              });
            },
            onTapDown: (_) {},
            onTapCancel: () {},
            child: Container(
              color: _hoverFirst
                  ? Color(0xFFFAEB78)
                  : Color.fromARGB(255, 252, 239, 142),
              width: MediaQuery.of(context).size.width / 3,
              child: const Icon(
                Icons.person_outline_rounded,
                size: 50,
                color: Color(0xFFF4D745),
              ),
            ),
          ),
        ),
        Material(
          child: InkWell(
            onHover: (value) {
              setState(() {
                _hoverSecond = value;
              });
            },
            onTap: () {
              setState(() {
                _hoverFirst = false;
                _hoverSecond = true;
                _hoverThird = false;
              });
            },
            onTapDown: (_) {},
            onTapCancel: () {},
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFF4D745), width: 5),
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10)),
                color: _hoverSecond
                    ? Color(0xFFFAEB78)
                    : Color.fromARGB(255, 252, 239, 142),
              ),
              width: MediaQuery.of(context).size.width / 3,
              child: const Icon(
                Icons.home_rounded,
                size: 50,
                color: Color(0xFFF4D745),
              ),
            ),
          ),
        ),
        Material(
          child: InkWell(
            onHover: (value) {
              setState(() {
                _hoverThird = value;
              });
            },
            onTap: () {
              setState(() {
                _hoverFirst = false;
                _hoverSecond = false;
                _hoverThird = true;
              });
            },
            onTapDown: (_) {},
            onTapCancel: () {},
            child: Container(
              height: 50,
              color: _hoverThird
                  ? Color(0xFFFAEB78)
                  : Color.fromARGB(255, 252, 239, 142),
              width: MediaQuery.of(context).size.width / 3,
              child: const Icon(
                Icons.settings,
                size: 40,
                color: Color(0xFFF4D745),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
