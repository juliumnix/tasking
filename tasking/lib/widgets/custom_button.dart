import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final void Function() onClick;

  const CustomButton({Key? key, required this.title, required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: OutlinedButton(
        onPressed: () {
          onClick();
        },
        style: ButtonStyle(
            side: MaterialStateProperty.all(const BorderSide(
                width: 5, color: Color(0xFFF4D745), style: BorderStyle.solid)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
            backgroundColor: MaterialStateProperty.all(const Color(0xFFFFFFAB)),
            minimumSize: MaterialStateProperty.all(Size(
                (MediaQuery.of(context).size.width * 0.6945),
                (MediaQuery.of(context).size.height * 0.0556)))),
        child: Text(
          title,
          style: TextStyle(
            fontFamily: GoogleFonts.comfortaa().fontFamily,
            fontSize: 20,
            color: const Color(0xFFF4D745),
          ),
        ),
      ),
    );
  }
}
