import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTopNavigator extends StatefulWidget {
  final int valorRecebido;
  final Function onPressWesterday;
  final Function onPressToday;
  final Function onPressTomorrow;
  const CustomTopNavigator(
      {Key? key,
      required this.valorRecebido,
      required this.onPressWesterday,
      required this.onPressToday,
      required this.onPressTomorrow})
      : super(key: key);

  @override
  State<CustomTopNavigator> createState() => _CustomTopNavigatorState();
}

class _CustomTopNavigatorState extends State<CustomTopNavigator> {
  bool _hoverFirst = false;
  bool _hoverSecond = false;
  bool _hoverThird = false;

  void _initialState(int valor) {
    if (valor == 1) {
      _hoverFirst = true;
      _hoverSecond = false;
      _hoverThird = false;
    }
    if (valor == 2) {
      _hoverFirst = false;
      _hoverSecond = true;
      _hoverThird = false;
    }
    if (valor == 3) {
      _hoverFirst = false;
      _hoverSecond = false;
      _hoverThird = true;
    }
  }

  @override
  void initState() {
    _initialState(widget.valorRecebido);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
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
              widget.onPressWesterday();
            },
            child: Container(
                height: _hoverFirst ? 60 : 55,
                decoration: _hoverFirst
                    ? BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(10),
                            topLeft: Radius.circular(10)),
                        color: _hoverFirst
                            ? const Color(0xFFFAEB78)
                            : const Color.fromARGB(255, 252, 239, 142),
                      )
                    : BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(10),
                            topLeft: Radius.circular(10)),
                        border: Border.all(color: Colors.grey, width: 1),
                        color: _hoverFirst
                            ? const Color(0xFFFAEB78)
                            : Colors.white,
                      ),
                width: MediaQuery.of(context).size.width / 4,
                child: Center(
                    child: Text("Ontem",
                        style: TextStyle(
                            color: Color(0xFFF4D745),
                            fontSize: 20,
                            fontFamily: GoogleFonts.comfortaa().fontFamily)))),
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
              widget.onPressToday();
            },
            child: Container(
              height: _hoverSecond ? 60 : 55,
              decoration: _hoverSecond
                  ? BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(10),
                          topLeft: Radius.circular(10)),
                      color: _hoverSecond
                          ? const Color(0xFFFAEB78)
                          : const Color.fromARGB(255, 252, 239, 142),
                    )
                  : BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(10),
                          topLeft: Radius.circular(10)),
                      color:
                          _hoverSecond ? const Color(0xFFFFFFAB) : Colors.white,
                    ),
              width: (MediaQuery.of(context).size.width / 4),
              child: Center(
                  child: Text(
                "Hoje",
                style: TextStyle(
                    color: Color(0xFFF4D745),
                    fontSize: 20,
                    fontFamily: GoogleFonts.comfortaa().fontFamily),
              )),
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
              widget.onPressTomorrow();
            },
            child: Container(
              height: _hoverThird ? 60 : 55,
              decoration: _hoverThird
                  ? BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(10),
                          topLeft: Radius.circular(10)),
                      color: _hoverThird
                          ? const Color(0xFFFAEB78)
                          : const Color.fromARGB(255, 252, 239, 142),
                    )
                  : BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(10),
                          topLeft: Radius.circular(10)),
                      color:
                          _hoverThird ? const Color(0xFFFAEB78) : Colors.white,
                    ),
              width: MediaQuery.of(context).size.width / 4,
              child: Center(
                child: Text("Amanhã",
                    style: TextStyle(
                        color: Color(0xFFF4D745),
                        fontSize: 20,
                        fontFamily: GoogleFonts.comfortaa().fontFamily)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
