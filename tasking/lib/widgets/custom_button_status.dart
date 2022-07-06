import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButtonStatus extends StatefulWidget {
  // final bool hasButton;
  final String title;
  // final double hours;
  // final String url;
  // final bool? isComplete;
  // final double verticalPadding;
  // final double horizontalPadding;
  // final Function onPressedActivate;
  // final Function onPressedDesactivate;
  const CustomButtonStatus({
    Key? key,
    // required this.hasButton,
    required this.title,
    // required this.hours,
    // required this.url,
    // this.isComplete,
    // required this.verticalPadding,
    // required this.horizontalPadding,
    // required this.onPressedActivate,
    // required this.onPressedDesactivate,
  }) : super(key: key);

  @override
  State<CustomButtonStatus> createState() => _CustomButtonStatusState();
}

class _CustomButtonStatusState extends State<CustomButtonStatus> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular((MediaQuery.of(context).size.width) * 0.062),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 2, // changes position of shadow
            ),
          ],
          color: Colors.white,
        ),
        height: ((MediaQuery.of(context).size.height) * 0.08),
        width: ((MediaQuery.of(context).size.width) * 0.833),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              SizedBox(
                width: ((MediaQuery.of(context).size.width) * 0.733),
                child: Text(
                  widget.title,
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontFamily: GoogleFonts.comfortaa().fontFamily,
                      fontSize: 16),
                ),
              ),
              const Spacer(),
              SizedBox(
                  width: 20,
                  height: 20,
                  child: OutlinedButton(
                    style: ButtonStyle(
                        backgroundColor: _isPressed
                            ? MaterialStateProperty.all(const Color(0xFFEEF2F0))
                            : MaterialStateProperty.all(
                                const Color(0xFFFFFFAB))),
                    onPressed: () {
                      if (_isPressed) {
                      } else {}
                      setState(() {
                        _isPressed = !_isPressed;
                      });
                    },
                    child: const Text(""),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
