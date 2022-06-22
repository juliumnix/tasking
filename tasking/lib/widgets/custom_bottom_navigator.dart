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

  void _initialState() {
    _hoverSecond = true;
  }

  @override
  void initState() {
    _initialState();
    super.initState();
  }

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
              height: _hoverFirst ? 60 : 55,
              decoration: _hoverFirst
                  ? BoxDecoration(
                      border:
                          Border.all(color: const Color(0xFFF4D745), width: 5),
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(10),
                          topLeft: Radius.circular(10)),
                      color: _hoverFirst
                          ? const Color(0xFFFAEB78)
                          : const Color.fromARGB(255, 252, 239, 142),
                    )
                  : BoxDecoration(
                      color: _hoverFirst
                          ? const Color(0xFFFAEB78)
                          : const Color.fromARGB(255, 252, 239, 142),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                      ),
                    ),
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
              height: _hoverSecond ? 60 : 55,
              decoration: _hoverSecond
                  ? BoxDecoration(
                      border:
                          Border.all(color: const Color(0xFFF4D745), width: 5),
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(10),
                          topLeft: Radius.circular(10)),
                      color: _hoverSecond
                          ? const Color(0xFFFAEB78)
                          : const Color.fromARGB(255, 252, 239, 142),
                    )
                  : BoxDecoration(
                      color: _hoverSecond
                          ? const Color(0xFFFAEB78)
                          : const Color.fromARGB(255, 252, 239, 142),
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
              height: _hoverThird ? 60 : 55,
              decoration: _hoverThird
                  ? BoxDecoration(
                      border:
                          Border.all(color: const Color(0xFFF4D745), width: 5),
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(10),
                          topLeft: Radius.circular(10)),
                      color: _hoverThird
                          ? const Color(0xFFFAEB78)
                          : const Color.fromARGB(255, 252, 239, 142),
                    )
                  : BoxDecoration(
                      color: _hoverThird
                          ? const Color(0xFFFAEB78)
                          : const Color.fromARGB(255, 252, 239, 142),
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(10),
                      ),
                    ),
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
